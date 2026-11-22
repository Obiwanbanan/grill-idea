# grill-idea

An agent skill for anyone with a product idea, no engineering background needed: a product manager, a founder, a designer, someone from sales or support. Describe the idea, and the agent studies your product, grills you about it **in business language only**, then writes **one ticket** in your team's tracker (GitHub, GitLab, Jira, Linear, or paste-ready Markdown).

## Install

Run in the root of your project:

```bash
curl -fsSL https://raw.githubusercontent.com/Obiwanbanan/grill-idea/main/install.sh | bash
```

It installs for the agents it finds in the project. Works with Claude Code, Codex, Cursor, GitHub Copilot, Gemini CLI, OpenCode, and any agent that reads `.agents/skills`. To pick agents, or to install for your user instead of the project:

```bash
curl -fsSL https://raw.githubusercontent.com/Obiwanbanan/grill-idea/main/install.sh | bash -s -- --agent cursor,codex --global
```

Add `--version 0.3.0` to install a specific release ([changelog](CHANGELOG.md)). Run the command again to update.

For Claude Code you can also install it as a plugin: `claude plugin marketplace add Obiwanbanan/grill-idea`, then `claude plugin install grill-idea@grill-idea`.

## Use

```text
/grill-idea Let customers pause their subscription instead of cancelling
```

In Codex, use `$grill-idea`. You can also just say "grill my idea: ...".

## How it works

Write in any language: the agent replies and writes the ticket in the language you use.

```
 You: /grill-idea Let customers pause their subscription
        │
        ▼
 Agent reads the project quietly        (what the product already does)
        │
        ▼
 Checks the tracker for the same idea   (build on it, file separately, or stop)
        │
        ▼
 Rounds of business questions           (who, why now, value, smallest version, success)
        │
        ▼
 Shared understanding, confirmed by you
        │
        ▼
 One ticket: GitHub, GitLab, Jira, Linear, a local file, or paste-ready Markdown
        │
        ▼
 A developer takes it into their own process
```

Questions are short, with options and one recommended. Reply with letters, "yes" to accept the recommendations, or your own words. It never asks about code, architecture, or estimates.

```
❓ Q1. Who needs to pause a subscription?

- A. Account owners only ⭐ recommended: staff can't manage billing today.
- B. Owners and staff.
```

## License

MIT
