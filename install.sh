#!/usr/bin/env bash
# Installs the grill-idea skill into the current project (or your home folder).
#
#   curl -fsSL https://raw.githubusercontent.com/Obiwanbanan/grill-idea/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/Obiwanbanan/grill-idea/main/install.sh | bash -s -- --agent cursor,codex
#
# Options:
#   --agent LIST   comma-separated agents, or "auto" / "all" (default: auto)
#                  claude, codex, cursor, copilot, gemini, opencode
#                  auto: .agents/skills (shared folder) + every agent whose
#                        folder already exists here, Claude Code if none found
#   --global       install for your user instead of this project
#   --list         print the folder each agent uses and exit
#   --version X    install release X (e.g. 0.2.0) instead of the latest main
set -euo pipefail

REPO="${GRILL_IDEA_REPO:-Obiwanbanan/grill-idea}"
REF="${GRILL_IDEA_REF:-main}"
AGENTS="auto"
GLOBAL=0
LIST=0
PINNED=0

ALL_AGENTS="claude codex cursor copilot gemini opencode"

# Skill folder for an agent, relative to the project or to $HOME (--global).
skill_dir() {
  local agent="$1" global="$2"
  case "$agent:$global" in
    claude:*) echo ".claude/skills" ;;
    codex:*) echo ".agents/skills" ;;
    cursor:*) echo ".cursor/skills" ;;
    copilot:0) echo ".github/skills" ;;
    copilot:1) echo ".copilot/skills" ;;
    gemini:*) echo ".gemini/skills" ;;
    opencode:0) echo ".opencode/skills" ;;
    opencode:1) echo ".config/opencode/skills" ;;
    *) return 1 ;;
  esac
}

# Folder whose presence means the agent is used in this project.
marker_dir() {
  case "$1" in
    claude) echo ".claude" ;;
    codex) echo ".codex" ;;
    cursor) echo ".cursor" ;;
    copilot) echo ".github/copilot-instructions.md" ;;
    gemini) echo ".gemini" ;;
    opencode) echo ".opencode" ;;
  esac
}

while [ $# -gt 0 ]; do
  case "$1" in
    --agent) AGENTS="${2:-}"; shift 2 ;;
    --agent=*) AGENTS="${1#--agent=}"; shift ;;
    --global) GLOBAL=1; shift ;;
    --list) LIST=1; shift ;;
    --version) REF="v${2#v}"; PINNED=1; shift 2 ;;
    --version=*) v="${1#--version=}"; REF="v${v#v}"; PINNED=1; shift ;;
    -h|--help) sed -n '2,14p' "$0" 2>/dev/null || true; exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

BASE="$PWD"
[ "$GLOBAL" -eq 1 ] && BASE="$HOME"

if [ "$LIST" -eq 1 ]; then
  for a in $ALL_AGENTS; do printf '%-9s %s\n' "$a" "$BASE/$(skill_dir "$a" "$GLOBAL")"; done
  exit 0
fi

case "$AGENTS" in
  all) SELECTED="$ALL_AGENTS" ;;
  auto)
    SELECTED="codex"
    found=0
    for a in $ALL_AGENTS; do
      [ "$a" = codex ] && continue
      if [ -e "$BASE/$(marker_dir "$a")" ]; then SELECTED="$SELECTED $a"; found=1; fi
    done
    [ "$found" -eq 0 ] && SELECTED="$SELECTED claude"
    ;;
  *)
    SELECTED="$(echo "$AGENTS" | tr ',' ' ')"
    for a in $SELECTED; do
      skill_dir "$a" "$GLOBAL" >/dev/null || {
        echo "Unknown agent: $a (use: ${ALL_AGENTS// /, }, auto, all)" >&2; exit 1; }
    done
    ;;
esac

# Several agents can share one folder (e.g. .agents/skills); install each folder once.
DIRS=""
for a in $SELECTED; do
  d="$(skill_dir "$a" "$GLOBAL")"
  case " $DIRS " in *" $d "*) ;; *) DIRS="$DIRS $d" ;; esac
done

# Use the local checkout when the script runs from inside the repo; otherwise download it.
SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

TMP=""
cleanup() { [ -n "$TMP" ] && rm -rf "$TMP"; }
trap cleanup EXIT

if [ "$PINNED" -eq 0 ] && [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/plugins/grill-idea" ]; then
  SRC="$SCRIPT_DIR/plugins/grill-idea/skills/grill-idea"
else
  TMP="$(mktemp -d)"
  echo "Downloading $REPO@$REF..."
  curl -fsSL "https://codeload.github.com/$REPO/tar.gz/$REF" -o "$TMP/src.tar.gz" 2>/dev/null \
    || { echo "Could not download $REPO@$REF. Check the version in CHANGELOG.md." >&2; exit 1; }
  tar -xzf "$TMP/src.tar.gz" -C "$TMP" --strip-components=1
  SRC="$TMP/plugins/grill-idea/skills/grill-idea"
fi

[ -f "$SRC/SKILL.md" ] || { echo "Skill not found at $SRC" >&2; exit 1; }
VERSION="$(sed -n 's/^  version: *"\{0,1\}\([^"]*\)"\{0,1\}$/\1/p' "$SRC/SKILL.md" | head -1)"
echo "grill-idea ${VERSION:-(unknown version)}"

for d in $DIRS; do
  DEST="$BASE/$d/grill-idea"
  mkdir -p "$BASE/$d"
  rm -rf "$DEST"
  cp -R "$SRC" "$DEST"
  echo "Installed grill-idea to $DEST"
done

echo
echo "Start a new agent session and ask it to grill your idea:"
echo "  Claude Code, Cursor, Copilot, Gemini, OpenCode:  /grill-idea <your idea>"
echo "  Codex:                                           \$grill-idea <your idea>"
