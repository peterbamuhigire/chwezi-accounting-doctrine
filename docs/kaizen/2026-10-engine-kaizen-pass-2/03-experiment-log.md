# Experiment log, kaizen pass 2: 2026-10-31

One change at a time, highest priority first. Each entry gives the hypothesis,
the smallest change that tests it, the measure before and after, and the
decision. The baseline is in [`01-baseline-scorecard.md`](01-baseline-scorecard.md).
Order of work: A1's checker was written first and run against the live
register to show it fails for the right reason, then A2's data fix made the
register pass, then both were committed (A2 first, so every commit is green).

## A2 and A1 (P0): register data and the strict gate

**Hypothesis.** The July VAT threshold text and the recheck-before-access
entry are stale or wrong, and the gate cannot see a defect in any entry after
the first in a file.

**Before.**
- A fixture register whose second entry was `verified-current` and nine months
  overdue returned gate state `pass`, 0 findings.
- The live register returned `pass`; `UG-VAT-STANDARD-RATE` carried recheck
  2026-08-14 against access 2026-10-29, and the lookup tool printed
  "recheck overdue" for it.

**Change (A1, `tools/check-source-register.ps1`).** Parse each list item as its
own block and read state, required fields, recheck date and archive from that
block. New findings: `SRC-010` (recheck date earlier than access date) and
`SRC-011` (verified entry with no captured archive, or one that names a file
that does not exist). A parsing side effect: an entry whose first line is
`- topic:` was previously reported as missing `topic` (a false positive in the
old per-file regex); that finding disappears.

**Run before the data fix.** The new checker on the live register returned
`fail` with exactly one finding, `SRC-010` for `UG-VAT-STANDARD-RATE`
(exit 1), and per-entry counts of 27 draft entries (previously 9, counted per
file). On the earlier mixed-state fixture it returned `SRC-005` and `SRC-011`
for the right entry.

**Change (A2, data only).** Added `UG-VAT-REG-THRESHOLD` as a `draft` entry
(URA's VAT page and its FY2026-27 guide state UGX 300,000,000 a year and
UGX 75,000,000 over three consecutive months; no effective date; amending Act
not located); corrected the standard-rate recheck date to the 2026-12-29 its
own note already gave; recorded the 2026-10-31 observations for the WHT, PAYE
and two IFRS entries. Nothing was promoted or given a new effective date.

**After.** Live register: gate `pass`, 0 findings, 30 entries. Lookup for VAT
no longer prints "recheck overdue" for the rate entry and returns the new
threshold entry (exit 3, refused). Two new negative controls plus the existing
one: 3 of 3 pass, each failing for its named code.

**Decision.** Keep. Commits `666655c` (A2) and `90323f5` (A1).

**What did not go as planned.** My first read of the baseline fixture result
needed confirming before it could be called a false negative; it was confirmed
by running the old checker on the fixture (pass) and the Python lookup on the
same file (refused) before any change.

## A3 (P1): cross-platform integrity check

**Hypothesis.** The same class of defect, plus source keys cited in guidance
that do not exist, fails on any host if a Python check enforces it.

**Change.** `tools/source_register_integrity.py` and
`tests/test_source_register_integrity.py` (17 cases). Field and state lists are
read from `schema.yaml`, not hard-coded. Overdue draft entries and
`verified-current` entries whose verifier text does not name a reviewer are
reported but do not fail, because they need a human decision.

**Before.** 23 tests; no check resolved cited keys.

**First run: red, for a real defect.** With the tool and tests in place, 3
tests failed: the retail example cited `UG-EFRIS`, a key that is not in the
register, and labelled it `verified-current` (the register holds the EFRIS
entries as `draft`). The same README labelled `UG-VAT-STANDARD-RATE`
`verified-current-with-conflict-watch`, a state the schema does not have. I
corrected both states, pointed the key at `UG-EFRIS-HANDBOOK-FY2026-27`, and
changed the matching fixture field (not read by any script; the 63 accounting
assertions still pass).

**Also changed.** `references/uganda-statutory.md` rewritten so its seven
dangling keys now cite real entries and its states match the register.

**After.** 40 tests pass at this point; integrity run: 0 errors, 8 attention
items (7 overdue drafts, 1 verified-current entry without a named reviewer).

**Decision.** Keep. Commit `cfed502`.

## A4 (P1): machine-specific paths

**Hypothesis.** Active content carries machine-specific paths that nothing
guards.

**Change.** Replaced six lines in three files with catalogue-resolution
wording and added `tools/check_machine_paths.py` with 10 tests.

**Surprise caught by the new guard.** I had listed five lines to fix. The
scanner also found a sixth that my own grep missed: a heading in the
governance how-to naming a personal profile directory with a user name
(`C:\Users\<name>\.claude\skills`). Fixed. The hook test payloads (11 fake
Windows paths) are held to an explicit ceiling with a stated reason, and the
two portfolio-managed lines in `AGENTS.md` likewise.

**After.** Identical-regex count over the whole tree: 50 lines in 21 files at
baseline, 44 in 18 now; in active scope 6 lines to 0. The remaining lines are
dated history, retired integration notes and the allowlisted lines.

**Decision.** Keep. Commit `43e6fc5`.

## A5 (P2): execute the routing fixtures

**Hypothesis.** The 29 October fixture never ran. Running it through a
lexical proxy will show whether the labelled routes are robust, and a
truthful description change can widen any thin margin without displacing a
neighbour.

**Before.** The portfolio's shared proxy, run read-only, ranked all five
labels correctly, but the first Section 10 positive led its neighbour by only
0.007. My own independent proxy (new, engine-local) ranked that positive
second, by -0.005.

**Change.** `tools/route_proxy.py` (Tier-2 lexical check with a 0.05 margin
floor, explicitly not live routing), `tests/test_routing_lexical_proxy.py`
(including a control that replays the old description and must fail it), two
owned neighbour negatives added to the fixture, and the skill description
aligned with what its worked example covers: reversal and correction in an
open period and retrospective restatement of comparatives.

**After (both proxies).** First positive margin +0.145 (mine) and +0.158
(portfolio); the other two positives +0.163 and +0.297 (mine). The nearest
neighbour query (ledger reversal design) stayed first at +0.142. All seven
cases pass on both proxies.

**What went wrong on the way.** My first wording used a colon inside a plain
YAML value, which made the frontmatter invalid; the frontmatter check caught
it at once and I reworded. A negative-control test I wrote later asserted that
every positive fails when one skill's description is broken, which became
wrong once a second fixture existed; I scoped it to the skill under test.

**Decision.** Keep. Commit `3530f82`. Not claimed: live routing, precision@1.

## A6 (P2): the source-register skill

**Hypothesis.** The skill governing register edits should state this cycle's
rules, and its description should match the question agents ask.

**Before.** Skill failed one portable check (capability contract); on a
practitioner-style query its routing margin was +0.058 and +0.035 on the two
natural queries.

**Change.** Four decision rules (per-entry judgement; named reviewer and
archive for `verified-current`; recheck date moves only after re-reading;
cited keys must resolve), a capability and degraded-mode table whose rows say
what to do when Python, the official source or write access is missing, a
description that names the question (which entry applies on a date, its state,
whether it may support final output), and a three-positive, two-negative
fixture. Review dates updated because the body was reviewed.

**After.** Margins +0.218 and +0.171 on those queries, neighbours unchanged
(payroll +0.100, indirect tax +0.182); portable scan 2 of 108 fully compliant
(was 1) with the capability count 104 to 103.

**Decision.** Keep. Commit `dc592e7`. The other near-compliant skill
(`finance-module-audit`, degraded mode) was not changed: I did not identify
content that would change what an agent does there, and adding a heading to
satisfy a regex would be boilerplate. Moved to `06-next-cycle.md`.

## Reverted

None. No change was reverted.

## Teach

README and `AGENTS.md` now tell a fresh agent how to run the Python checks on
a host without PowerShell, and state that they support but do not replace the
PowerShell gate (commit `2d0ed36`, with the changelog entry).
