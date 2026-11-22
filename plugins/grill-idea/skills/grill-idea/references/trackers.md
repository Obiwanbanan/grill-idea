# Trackers

The ticket is the same everywhere; only the way it's published changes.

## 1. Find the tracker

Stop at the first one that answers:

1. **A saved choice.** Read `docs/agents/issue-tracker.md` (the same file Matt Pocock's skills use), then any tracker instructions in `AGENTS.md` or `CLAUDE.md`.
2. **What's connected.** Check your tools for a tracker integration (MCP or connector for Jira, Linear, YouTrack, GitHub, GitLab, Asana, ClickUp, Notion, Trello...) and for CLIs (`gh`, `glab`). Look at `git remote -v`.
3. **Ask the idea owner.** One question in the round format, with what you found as the recommendation:

```
❓ **Q1.** Where should the ticket go?

- **A.** GitHub Issues in `acme/shop` ⭐ recommended: the project is there and I'm signed in.
- **B.** Another tracker (name it).
- **C.** Just give me Markdown to paste.
```

If the idea owner names a tracker you can't reach, say what's missing in plain words ("I'm not connected to Jira here") and offer the paste-ready Markdown.

After the first ticket, offer to save the choice to `docs/agents/issue-tracker.md` so the next run doesn't ask. Write it only on a yes. Keep it short: tracker, project or repo, and any labels or fields the team always sets.

## 2. Check for duplicates

Do this **before the grilling starts**, right after finding the tracker, so the idea owner doesn't spend time on an idea that's already filed or was already rejected. Search open and closed tickets for the problem and the solution, a few distinctive words at a time, then synonyms. Use the search commands in the table below.

Show each match in one line and let the idea owner choose: build on it, file separately, or stop. Closed tickets matter too: "we tried this in 2024 and dropped it" is evidence for the grilling.

If the idea changed a lot during the grilling, search once more before publishing.

## 3. Publish

Only after the idea owner approves the exact draft. Don't add assignees, labels, sprints, priorities, or estimates unless the idea owner approved them or the saved choice says the team always sets them. Use only labels that already exist.

| Tracker | Search | Create |
| --- | --- | --- |
| GitHub | `gh issue list --repo OWNER/REPO --state all --search "<words>"` | write the body to a temp file, then `gh issue create --repo OWNER/REPO --title "<title>" --body-file <file>` |
| GitLab | `glab issue list --repo GROUP/PROJECT --search "<words>"` | `glab issue create --repo GROUP/PROJECT --title "<title>" --description "<body>"` |
| Jira, Linear, YouTrack, Asana, ClickUp, Notion, Trello, others | the integration's search tool | the integration's create tool; the ticket body goes in the description field. Ask the idea owner for the project or board only if it isn't saved and can't be listed |
| Local files | look through `tickets/` | after approval, write `tickets/<YYYY-MM-DD>-<short-slug>.md` with the title as the first heading |
| None reachable | | give the idea owner the title and body as Markdown in a code block, ready to paste |

Prefer an integration tool over a CLI when both exist. If the tracker doesn't render Markdown, convert the formatting without changing the content.

## 4. Report

Report the ticket number, title, and link exactly as the tool returned them. If creation failed, say what went wrong in plain words and give the paste-ready Markdown. Never claim a ticket exists unless the tool confirmed it.
