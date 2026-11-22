---
name: grill-idea
description: Grill someone about a product idea or hypothesis in plain business language, then turn the agreed result into one ticket in the team's tracker (GitHub, GitLab, Jira, Linear, a local file, or anything else). Use when someone describes a feature idea, request, or hypothesis they want turned into a task, or asks to grill an idea.
license: MIT
metadata:
  version: "0.3.0"
---

# Grill Idea

The person talking to you, the **idea owner**, brings an idea or a hypothesis. They might be a product manager, a founder, a designer, someone from sales or support: anyone. Assume they are not an engineer. You study the product, grill them until the idea is sharp, and write **one ticket** a developer can pick up.

You stop at the ticket. Technical design happens later, in whatever process the developers use.

## Business language only

Every question is about users, problems, value, money, time, risk, scope, or success. Never ask about architecture, code, data, APIs, frameworks, technical approach, or estimates. Never ask the idea owner to choose a technical solution.

The code is yours to read, not theirs to discuss. When something you find matters to the decision, translate it into product terms ("the product already lets admins export reports, just not from this screen"), never file names, components, or jargon.

Always reply in the language the idea owner writes in, and write the whole ticket in that language too: title, body, **section headings and field labels** ("## Проблема", "**Для пользователя:**", "Выполнено, когда"). These instructions and the template are in English; translate them, never copy the English headings into a ticket in another language.

## 1. Study the product

Before the first round, read the project to understand the product from a user's point of view: README, docs, user-facing text, the screens and flows the idea touches, existing tickets if you can reach them. If you can dispatch a sub-agent, use one for broad exploration; otherwise explore yourself. Look hardest for whether the capability already exists in some form.

Read-only: don't modify files, run the app, or open secrets (`.env`, keys, credentials, customer data).

## 2. Look for the same idea in the tracker

Before the first question, find the tracker and search it for tickets about the same problem or solution ([trackers.md](./references/trackers.md)). Search open and closed tickets with a few distinctive words, then with synonyms.

- **Found something close:** show each match in one line (title, link, open or closed, how it overlaps) and ask what to do: build on it (the new ticket references it, or becomes a comment on it), go ahead with a separate ticket, or stop here.
- **Nothing found:** say so in one line and start grilling.
- **Tracker unknown:** make "where do tickets go" the first question of round 1, and search as soon as you have the answer, before the next round.
- **Tracker unreachable:** say so in one line and carry on.

## 3. Grill

Interview the idea owner relentlessly until you reach a shared understanding. Map it as a **decision tree**: every business decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you haven't heard. Ask the whole frontier in one round, then wait for the answers.

Keep the idea owner's effort low. Format a round like so:

```
❓ **Q1.** <the question, one short sentence>

- **A.** <option> ⭐ recommended: <reason, a few words>
- **B.** <option>
- **C.** <option>

---

❓ **Q2.** <the question>

➡️ <your recommended answer, one short sentence>

---

Reply with letters ("1A, 2 yes"), "yes" to accept all recommendations, or your own words.
```

- **The question comes first**, with no title or topic label before it. One sentence, plain words. Add one short line of context above it only when the question makes no sense without it.
- **Give options** when there are real alternatives: 2–4, each a few words, the recommended one marked ⭐ with a short reason. When there is only one sensible answer to confirm, or it's an open question like a number, give a single ➡️ recommendation instead.
- **Short answers.** One line per option. No paragraphs, no repeating the question.
- Ground recommendations in what you found in the product and what the idea owner said; say so when one is a guess.

Each answered round reshapes the tree. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a later round.

**Facts about the product are your job; decisions and business facts are the idea owner's.** Don't ask anything the project can answer. Do ask what only the business knows: customer evidence, numbers, why now, priorities.

The branches the tree must cover (question bank and examples in [business-questions.md](./references/business-questions.md)):

- **Problem**: who has it, in what situation, what hurts, how they cope today.
- **Origin and evidence**: why now, how many people, what is fact and what is assumption.
- **Value**: for the user, for the business, the cost of doing nothing.
- **The solution itself**: is a new feature needed at all, does the product already do it, what is the smallest valuable version.
- **Scope**: what's in, what's out, the edge cases that matter, in user terms.
- **Success**: how we'll see it's done (acceptance), how we'll see it worked (a metric, or an honest "not measured"), and who checks it and when.

**Challenge.** A requested feature is a hypothesis, not a requirement. Push back when evidence is thin, when the solution is bigger than the problem, or when the product already covers it. Be respectful and evidence-led; the idea owner decides. If the honest conclusion is "don't build this", say so. No ticket is a valid outcome.

Never invent evidence, numbers, baselines, or targets. "Unknown" is a valid answer; record it as such.

The grilling is done when the frontier is empty: every branch visited, nothing silently assumed. Summarise the shared understanding in a few lines and ask the idea owner to confirm it before you write the ticket.

## 4. Write the ticket

Draft one ticket with [ticket-template.md](./references/ticket-template.md). It must carry everything agreed in the grilling, so that a person and a coding agent who missed the conversation both understand what the idea owner meant. Show the title and body exactly as they will be published.

One ticket. No subtasks, specs, technical plans, or time estimates. You do give it a rough **complexity score from 1 to 100**, set by you from what you read in the product and explained in product terms (scale in the template). Never ask the idea owner for it.

If a related ticket was found in step 2, link it in the ticket.

## 5. Publish

Publish to the tracker found in step 2 ([trackers.md](./references/trackers.md)). Show the destination with the draft, and publish only after the idea owner explicitly approves that exact draft. Report the ticket link or ID only once the tool has returned it. If publishing is impossible, hand over the ticket as Markdown ready to paste.
