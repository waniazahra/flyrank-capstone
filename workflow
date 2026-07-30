# WORKFLOW.md — Vague Prompt vs. Precise Prompt

**Feature:** settings form (name, email, password validation).
**Branches:** `round1-vague` (prompt: "build a website setting form", accepted as-is,
no follow-up) vs. `round2-precise` (fresh session, spec with field
constraints, accessibility requirements, and a verification step).

## Correctness
Round 1 has no validation at all — the form accepts a completely empty
submit and still writes `{name:"", email:"", password:""}` to
`localStorage`. Round 2 validates every field (name 2–50 chars, email
regex, password 8+ chars with a digit) and blocks submit until all three
are valid.

**The mistake I caught:** round 1's `saveSettings()` writes the raw
password into `localStorage` in plain text — `localStorage.setItem(
'settings', JSON.stringify({..., password: password}))`. Anyone with
DevTools access (or an XSS payload) could read it directly. I only
noticed this by diffing the two `settings.js` files side by side; it
wasn't obvious from just looking at round 1 alone since the form
"worked" and said "Saved!". Round 2's spec explicitly required password
to never be persisted, so `settings.js` there only ever saves
`{name, email}`.

## Accessibility
Round 1: labels are plain text next to inputs with no `for`/`id` link,
so a screen reader announces an unlabeled "edit text." The password
field uses `type="text"`, so the password is visible on screen as it's
typed. There's no error or status region at all. Round 2: every input
has a real `<label for>`, `aria-describedby` pointing to its error/hint
text, `aria-invalid="true"` set on failure, `role="alert"` on error
text, and a `role="status" aria-live="polite"` region for the save
confirmation. Focus moves to the first invalid field automatically.

## Edge cases
Round 1 handles none — empty name, malformed email (`user@`,
`user@domain`), and short/no-digit passwords are all silently accepted.
Round 2's `tests.js` covers 9 cases (empty / boundary / valid, for each
of the 3 fields) — `node tests.js` output: **9 passed, 0 failed**, run
and confirmed before the feature was considered done.

## Review effort
Round 1 took seconds to produce and looked done at a glance — that's
the trap. Actually verifying it (storage contents, screen-reader
labeling, edge cases) requires manual testing with no safety net, and
took longer than round 2's whole build. Round 2 took longer to prompt
and generate, but reviewing it was mostly reading a green test run and
checking the diff against the 4 rules in `CLAUDE.md` — end-to-end,
round 2 was faster once fixing/reviewing time is counted.

