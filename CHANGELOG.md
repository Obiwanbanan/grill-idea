# Changelog

Versions follow [Semantic Versioning](https://semver.org). Each release is a git tag `vX.Y.Z`; install a specific one with `install.sh --version X.Y.Z`.

When releasing, bump the version in `plugins/grill-idea/skills/grill-idea/SKILL.md` (`metadata.version`) and `plugins/grill-idea/.claude-plugin/plugin.json`, add a section here, then tag the commit.

## 0.3.0

- Looks for the same idea in the tracker (open and closed tickets) **before** the grilling, not after it. The idea owner chooses: build on it, file separately, or stop.
- Ticket headings and field labels are written in the idea owner's language, not copied from the English template.
- Shorter rounds: no title before a question, one-sentence questions, 2–4 short options with one marked ⭐ recommended, replies like "1A, 2B".

## 0.2.0

- Ticket: new **Value** section (for the user, for the business, cost of doing nothing).
- Ticket: "How we'll know it worked" is now **Success**, with expected outcome, metric, baseline, target, who verifies, and when. Every line may say "unknown".
- Ticket: new **Complexity** score from 1 to 100, set by the agent from the product and explained in product terms. The idea owner is never asked for it.
- Installer: `--version` to install a specific release; prints the installed version.

## 0.1.0

- First release: business-language grilling, one ticket in any tracker, installer for Claude Code, Codex, Cursor, GitHub Copilot, Gemini CLI and OpenCode.
