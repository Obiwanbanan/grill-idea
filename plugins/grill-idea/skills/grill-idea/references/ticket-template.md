# Ticket template

The ticket has two readers:

- **A person** (the idea owner, a teammate, a manager) who should recognise exactly what the idea owner meant.
- **A developer or coding agent** who will turn it into a plan and use "Done when" as the definition of finished.

The implementation depends on both understanding the idea the same way, so **meaning comes first**. There is no length limit: write as much as it takes to carry what was agreed in the grilling, including the reasons behind decisions. Cut only what carries no meaning: filler, repetition, generic statements that would fit any ticket.

A reader who wasn't in the conversation must not have to guess. If a decision was made in the grilling, it's in the ticket.

**Language:** the template below is in English only as a reference. Write every heading and label in the idea owner's language. In Russian, for example: Проблема, Ценность (Для пользователя / Для бизнеса / Цена бездействия), Что должно измениться, Пример, Решения и почему, Готово, когда, Вне рамок, Успех (Ожидаемый результат / Метрика / Текущее значение / Цель / Кто проверяет / Когда оцениваем), Сложность, Открытые вопросы.

```markdown
## Problem
[Who has the problem, in what situation, what they can't do today, and why it matters now. Mark assumptions as "(assumption)".]

## Value
**For the user:** [What becomes easier, faster, cheaper, or possible.]
**For the business:** [Which outcome we expect: retention, conversion, revenue, support load, time saved, risk.]
**Cost of doing nothing:** [What happens if we leave it as it is.]

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

## Success
- **Expected outcome:** [What we should observe once the problem is solved.]
- **Metric:** [Which number should move, or "not measured yet" plus the agreed proxy.]
- **Current baseline:** [Today's value, or "unknown".]
- **Target:** [Agreed target, or "not set".]
- **Who will verify the result:** [The role or person who checks it.]
- **When we'll evaluate:** [A date or a moment, e.g. "a month after release".]

## Complexity
**[N] / 100**: [One or two sentences in product terms on what drives it: which screens, user groups, flows, or outside services it touches, and what's new versus reused.]

## Open questions
[Optional. Only what is still open and doesn't block the work.]
```

## Value and Success

Fill them from what the idea owner said in the grilling. Any line can say "unknown" or "not set": never press the idea owner to make up a number, and never make one up yourself. Drop a line only when it truly doesn't apply (a small usability fix may have no metric; say so in "Expected outcome").

## Complexity

A rough score from 1 to 100 that you set yourself from reading the product, so whoever plans the work can compare tickets at a glance. It is not a time estimate and not a promise. Never ask the idea owner for it.

| Score | Roughly |
| --- | --- |
| 1–10 | Wording, a setting, or a visual tweak on one screen |
| 11–30 | A small change to one existing screen or flow |
| 31–60 | A new step or screen, or a change spread over several existing flows |
| 61–85 | A new area of the product, several user groups, or a new outside service |
| 86–100 | A major new capability that reshapes how the product works; consider splitting the idea |

Pick a number within the band, not just its edge. If you couldn't read enough of the product to judge, say so in the sentence and keep the score.

## Rules

- The title states the user-visible outcome ("Owners can download a month of invoices at once"), not an internal action ("Add export endpoint").
- Use the product's own names for screens, buttons, and roles, exactly as the interface shows them, and keep them the same throughout. A person recognises them; an agent can search the code for them.
- Keep the idea owner's own words where they carry intent; don't paraphrase meaning away.
- Each "Done when" item is a single behaviour a tester could check, never developer activity like "write tests".
- No architecture, APIs, data models, code, technical tasks, or time estimates. The complexity score is the only sizing, and it is explained in product terms.
- Never invent a number. An unknown baseline beats a made-up one.
- Say each thing once. Drop optional sections that would be empty.
- Before showing the draft, reread it as someone who missed the conversation: would they build what the idea owner meant? If not, add what's missing.
