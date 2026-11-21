# Ticket template

The ticket has two readers:

- **A person** (the idea owner, a teammate, a manager) who should recognise exactly what the idea owner meant.
- **A developer or coding agent** who will turn it into a plan and use "Done when" as the definition of finished.

The implementation depends on both understanding the idea the same way, so **meaning comes first**. There is no length limit: write as much as it takes to carry what was agreed in the grilling, including the reasons behind decisions. Cut only what carries no meaning: filler, repetition, generic statements that would fit any ticket.

A reader who wasn't in the conversation must not have to guess. If a decision was made in the grilling, it's in the ticket.

```markdown
## Problem
[Who has the problem, in what situation, what they can't do today, and why it matters now. Mark assumptions as "(assumption)".]

## What should change
[The new behaviour from the user's point of view. If the product already does part of this, say where, in product terms ("the Export button on the Reports page").]

## Example
[Optional, but use it whenever the idea is easy to misread. One concrete scenario, step by step: who the user is, what they do, what they see. A good example removes more ambiguity than a paragraph of description.]

## Decisions and why
[Choices made in the grilling that a reader could otherwise get wrong, each with its reason. "Only account owners, not staff: staff can't manage billing today." Skip if there were none worth recording.]

## Done when
- [ ] [One observable check: what a user can do, see, or complete.]
- [ ] [As many as needed, each checkable on its own.]

## Out of scope
- [What was deliberately left out, so nobody builds it "just in case".]

## How we'll know it worked
[Optional. Metric with baseline and target if known, or "not measured yet" plus the agreed proxy.]

## Open questions
[Optional. Only what is still open and doesn't block the work.]
```

## Rules

- The title states the user-visible outcome ("Owners can download a month of invoices at once"), not an internal action ("Add export endpoint").
- Use the product's own names for screens, buttons, and roles, exactly as the interface shows them, and keep them the same throughout. A person recognises them; an agent can search the code for them.
- Keep the idea owner's own words where they carry intent; don't paraphrase meaning away.
- Each "Done when" item is a single behaviour a tester could check, never developer activity like "write tests".
- No architecture, APIs, data models, code, technical tasks, or estimates.
- Never invent a number. An unknown baseline beats a made-up one.
- Say each thing once. Drop optional sections that would be empty.
- Before showing the draft, reread it as someone who missed the conversation: would they build what the idea owner meant? If not, add what's missing.
