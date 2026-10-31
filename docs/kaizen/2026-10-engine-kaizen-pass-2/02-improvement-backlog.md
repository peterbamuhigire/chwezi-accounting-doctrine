# Improvement backlog, kaizen pass 2: 2026-10-31

Baseline: 56.4/100 raw, published 56.4/100 (`min(56.4, 65)`), in
[`01-baseline-scorecard.md`](01-baseline-scorecard.md). Every item targets an
eventual 95/100; the contributions below are planning hypotheses, not earned
points. Six items are selected (limit ten). No item weakens a source gate,
ledger immutability, double entry, segregation or reviewer control, and none
edits canonical doctrine text.

## Five Whys

### D1: the strict gate passes a register with an overdue verified entry

1. Why did the gate pass? It read only the first `state` and recheck date in each file.
2. Why only the first? `Get-ScalarValue` returns the first match, written when each file held one entry.
3. Why did that survive? Files later became sequences (PAYE holds two entries) and the only negative control tests duplicate identities, not mixed states.
4. Why was no mixed-state control written? The gate was last hardened for ids, not for state semantics.
5. Why is that risky? Statutory use depends on the state being tested per entry. Root cause: **tooling and proof boundary**. The Python lookup tool is already per entry, so runtime refusal is safe; the CI gate is the weak layer.

### D2 to D4: stale and unresolvable register content

1. Why does the engine still say URA shows UGX 150,000,000? The July snapshot was never refreshed after its August review date.
2. Why was it not refreshed? `references/uganda-statutory.md` is not consumed by a skill or validated, so no check notices it ageing.
3. Why can it cite keys that do not exist? Keys were written in a markdown register first, and the YAML register was started later under different ids.
4. Why did no gate catch that? No check resolves cited source keys against the register.
5. Why did a recheck date land before its access date? Dates were edited by hand in two places and no rule compares them. Root cause: **reference and tooling** (no referential-integrity check between prose and register).

### D6: machine-specific paths in active content

1. Why are sibling paths in a governance how-to and a skill reference? They were pasted when the engines lived under one Windows web root.
2. Why were they not removed on 29 October? The cycle recorded them in `06-next-cycle.md` as a handoff for other engines and did not scan this repository's own active content.
3. Why no guard? No validator tests for drive-letter or home-directory paths. Root cause: **process and tooling**.

## Ranked plan

| Priority / ID | Gap and root cause | Exact change and hypothesis | Owner / date | Acceptance evidence | Risk and rollback | Target contribution toward 95 |
|---|---|---|---|---|---|---|
| P0 / A2 (D2, D3, D4) | VAT threshold stale; recheck before access; seven dangling keys; July snapshot contradicts the register. Root cause: reference. | Add `UG-VAT-REG-THRESHOLD` to `doctrine/source-register/uganda/vat.yaml` as `draft` with the 2026-10-31 URA observations and the open Act, gazette and effective-date questions; correct the standard-rate recheck date; rewrite the snapshot table to cite register keys that exist, with their current states; record dated observations for the surfaces re-read today. Hypothesis: every cited key resolves and the threshold conflict is stated as it stands now, with no value promoted. | Cycle owner, 2026-10-31. | Lookup tool returns the new entry (exit 3) and no "recheck overdue" for the rate entry; Python integrity test (A3) green; strict gate green in the offline container. | Over-claiming. The entry stays `draft`, states what the URA pages do not say, and is blocked for final use. Revert the commit if the gate or lookup regresses. | Standards currency +6; hygiene +2. |
| P0 / A1 (D1, D2) | Gate false negative on later entries; no recheck-after-access rule. Root cause: tooling and proof. | In `tools/check-source-register.ps1` evaluate state, recheck and (for `verified-*`) archive path per entry; add `SRC-010` (recheck before access date) and `SRC-011` (verified entry with a local archive path that does not exist); add two negative controls (mixed-state file; recheck before access). Hypothesis: the fixture that passed on baseline now fails with the right codes and the live register still passes. | Cycle owner, 2026-10-31. | Negative controls run in the offline container fail for the expected codes; live register passes; the baseline fixture file now returns `SRC-005`. | A stricter parser could reject real files. Limit to documented fields; roll back the checker and controls if the live register fails. | Safety +3; applied proof +2. |
| P1 / A3 (D2, D4, D5 detection) | No cross-platform check of register integrity or key resolution; CI-only PowerShell gate cannot run on Linux. Root cause: tooling. | New `tools/source_register_integrity.py` and `tests/test_source_register_integrity.py` (unittest): per-entry required fields, state enum, recheck not before access, verified entries not overdue and with an existing archive path, every backticked source key in active documents resolves, plus a report mode that lists overdue entries and verified-current entries lacking a named reviewer without failing. Hypothesis: the same class of defect fails on any host, including this Linux workstation. | Cycle owner, 2026-10-31. | Tests pass on live data; negative fixtures fail for each rule; the reporter lists the D5 entry. | False positives on prose keys; scope to documented key prefixes and active directories. Remove the tool and test to roll back. | Applied proof +3; hygiene +2. |
| P1 / A4 (D6) | Machine-specific paths in active content, unguarded. Root cause: process and tooling. | Replace the five active paths (governance how-to, retail source basis, report template) with catalogue-name wording; add `tests/test_no_machine_specific_paths.py` scanning active content with an explicit allowlist for portfolio-managed `AGENTS.md` lines and dated history. Hypothesis: new absolute paths fail the Python suite. | Cycle owner, 2026-10-31. | Scan returns 0 outside the allowlist; negative fixture with a drive-letter path fails; link gate still passes. | Editing a consumer how-to could change meaning; wording change only, links preserved. | Hygiene +3. |
| P2 / A5 | One skill has labelled fixtures and nothing executes them. Root cause: proof. | Add an owned nearest-neighbour negative for the Section 10 skill (the events-after-reporting skill, which scored 0.285 against 0.292) and a self-contained lexical check that runs every fixture case through an engine-local TF-IDF over skill descriptions. Hypothesis: a description edit that breaks routing fails the suite. Labelled Tier-2 proxy, never live routing. | Cycle owner, 2026-10-31. | Test passes on current descriptions and fails on a fixture with a broken expected skill. | Over-fitting descriptions to the proxy. The test reports margins and never edits descriptions. | Routing +2. |
| P2 / A6 (D7) | Two skills fail one portable check each. Root cause: skill. | Only if time allows: add real capability and degraded-mode guidance to `tax-statutory-source-register-and-country-packs` (lookup tool, PyYAML and network unavailable; per-entry state; named-reviewer rule). Not padding: content must change what an agent does. | Cycle owner | Scanner reports 2 of 108. | Boilerplate risk; skip if the content would not change behaviour. | Skill depth +1. |
| Escalated / D5 | `verified-current` NSSF entry lacks a named reviewer; `effective_from` is the verification date. | Not changed here: demoting the state or naming a reviewer changes release posture and needs Peter. A3's reporter lists it. | Peter | Decision recorded in `06-next-cycle.md` and the final message. | n/a | Safety, once resolved. |

## Not selected, and why

| Item | Reason |
|---|---|
| Bulk migration of 107 skills to the portable contract | Needs domain-specific work per skill; padding would defeat the purpose. Structural, moved to `06-next-cycle.md`. |
| Other-country schedules (Kenya, Rwanda, Tanzania, South Africa) | Need official schedules and a named reviewer. Not rechecked on 2026-10-31; their notes of 2026-10-29 stand. A web search for the Tanzania PAYE schedule found only secondary sources that disagree on whether PAYE changed; no value admitted. |
| URA EFRIS FY2026-27 handbook contents | The handbook was not opened; technical changes since 2026-08-28 stay `NOT_ASSESSED`. A search found no URA EFRIS notice dated after 2026-08-11. |
| Linux-native port of the full PowerShell gate | Structural. A3 gives the Linux-runnable guard for the highest-risk class instead. |
