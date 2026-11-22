# Business questions

A bank to draw from, not a questionnaire. Ask only what changes the decision, the value, or the scope. Every question still goes out in the round format: short, options where they make sense, one marked as recommended.

## Problem

- Who exactly runs into this? In what situation?
- What are they trying to get done at that moment?
- What is slow, confusing, risky, expensive, or impossible today?
- How do they cope today? Why isn't that good enough?
- How often does it happen?

## Origin and evidence

- What made this come up now?
- Is it one customer asking, or have others hit the same thing?
- What do we know for sure (support tickets, calls, numbers), and what are we assuming?

## Value

- What gets better for the user once this exists?
- How does it show up for the business: retention, conversion, revenue, support load, time saved, risk?
- What happens if we leave things as they are for another few months?
- Why is this more important than other problems right now?

## The solution itself

- Which part of the problem does each piece of the idea solve?
- What do we lose if we drop this piece?
- Could we get the same result more simply: better wording, an existing feature made easier to find, a process change?
- What is the smallest change that already delivers value?
- Are we adding complexity for most users to serve a rare case?

## Scope

- What must a user be able to do once this ships?
- How do they know it worked?
- What should happen in the one unusual case that matters most?
- What definitely stays out of the first version?

## Success

- What would we observe that tells us the problem is solved?
- What does it look like today, before the change?
- Which number should move: time, errors, support requests, completed actions, repeat purchases, something else?
- Do we have the data to see it? If not, is there a reasonable proxy?
- Who will check whether it worked, and when: a week after release, a month, after the next quarter?

Don't force a numeric goal when there is no reliable data. Record the missing baseline. For a small usability fix, clear acceptance criteria can be enough; say why.

## Turning product facts into questions

What you found in the code becomes context for a business decision, never a technical question:

| You found | You ask |
| --- | --- |
| The feature already exists on another screen | "The product already does this from Settings. Is the real problem that people can't find it?" |
| The product has nothing like it today | "There's nothing like this in the product yet, so this is a new area rather than a tweak. Is the problem big enough to justify that?" |
| A similar flow exists for another user group | "Admins already have this. Should regular users get the same thing, or something different?" |

## Example round

```
❓ **Q1.** Who needs to export reports?

- **A.** Account owners only ⭐ recommended: they send reports to accountants.
- **B.** Owners and their staff.

---

❓ **Q2.** Where does this come from?

- **A.** Support tickets or sales calls ⭐ my guess; how many, if you know?
- **B.** One customer asked.
- **C.** A hunch, no requests yet.

---

Reply with letters ("1A, 2B"), "yes" to accept all recommendations, or your own words.
```

## Disagreeing constructively

1. Say what you understood.
2. Name the concern in user or business terms.
3. Offer a simpler alternative or a counterfactual.
4. Ask the idea owner to decide, or to bring evidence that changes your view.

Never be combative or sarcastic. The goal is a better decision, not winning.

## Done versus worked

- **Done (acceptance):** the agreed behaviour exists. "An owner can download all invoices for a month in one action."
- **Worked (success):** the underlying problem improved. "Fewer support requests about invoices."

A ticket can be done correctly and still not work. Keep the two apart.
