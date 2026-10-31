# Final report: 2026-10 Accounting Doctrine kaizen, pass 2

## Result

Six bounded improvements were kept and none reverted. The most important is a
fix to the strict gate: it judged source-register state once per file, so a
`verified-current` entry sitting second in a file was never tested for an
overdue recheck (a fixture with such an entry nine months overdue passed with
0 findings). The cycle also refreshed the Uganda VAT registration threshold
against URA's own pages (as a `draft` entry; nothing was promoted), added three
Python checks that run on a host without PowerShell, removed machine-specific
paths from active content, and executed the routing fixtures that had only been
labelled on 29 October. No canonical doctrine text was changed and no sibling
engine was edited. One decision is left for Peter (D5, below). The synthetic
trading entity is still not a releasable statutory close.

**Branches.** Started on `main` at `7bc6a02`; work is on
`kaizen/2026-10-pass2` (11 commits, counting the one that adds files 03 to 06).
Nothing was pushed, tagged or opened as a pull request. The repository was
returned to `main` after the final commit.

## Scores

The baseline was frozen and committed before the first engine edit
([`01-baseline-scorecard.md`](01-baseline-scorecard.md)). Scores are the cycle
owner's evidence-bounded assessment, not an independent audit, and no point
was given for a backlog target alone.

| Dimension | 29 Oct final | Baseline now | Final | Evidence-based reason |
|---|---:|---:|---:|---|
| Doctrine | 58 | 58 | 58 | No doctrine text changed; D5 unresolved; no professional acceptance. |
| Taxonomy and routing | 63 | 62 | 63 | Fixtures now execute (12 cases, two skills, margin floor 0.05); two thin margins fixed. 2 of 108 skills covered; live routing `NOT_ASSESSED`. |
| Skill depth | 60 | 60 | 61 | Source-register skill gained four rules and a capability table; portable scan 2 of 108. Examples unchanged. |
| Applied proof | 62 | 62 | 64 | 23 to 56 tests; three source-register controls (was one); in their first run the new checks found four defects in live content (a recheck date before its access date, a non-existent key cited as `verified-current`, a profile path with a user name, a thin routing margin) and the gate false negative was reproduced on a fixture. No model, client or controller run. |
| Standards currency | 46 | 44 | 48 | VAT threshold read from URA's own guide, one recheck-date defect fixed, cited keys resolve, overdue records 10 to 7. Statutory entries remain `draft`; LST, WHT reconciliation and EFRIS handbook contents open. |
| Output readiness | 54 | 54 | 54 | No output pack changed. |
| Accessibility and inclusion | 50 | 50 | 50 | No assessment run. |
| Production and handoff | 62 | 60 | 61 | Python checks run on Linux and are documented in the router; not yet registered in the manifest or catalogue; remote CI unassessed. |
| Hygiene | 58 | 56 | 62 | Machine-specific paths in active scope 6 to 0 (guarded); dangling source keys 7 to 0 (guarded); recheck-date defect fixed. Seven overdue records remain. |
| Safety and integrity | 60 | 58 | 61 | Gate false negative fixed with controls; archive-existence check added. D5 still open (escalated, not fixed). |

**Baseline raw mean:** 56.4/100 (564 / 10), published 56.4 (`min(56.4, 65)`).
**Final raw mean:** 58.2/100 (582 / 10), published 58.2 (`min(58.2, 65)`).
**29 October final for comparison:** raw 57.3, published 57.3. The caps do not
change the raw scores or clear any source, legal, financial or release blocker.

### Correction to one baseline figure

The baseline scorecard counted 47 machine-specific path lines in 21 files. That
count used an older pattern that missed single-backslash `C:\Users` lines. With
the identical pattern at the baseline commit and now: 50 lines in 21 files to 44
lines in 18 files overall, and 6 lines to 0 in active scope. The frozen
scorecard was left as written.

## Kept changes and evidence

| Item | Commit | Change | Verification |
|---|---|---|---|
| A2 | `666655c` | Draft `UG-VAT-REG-THRESHOLD`; standard-rate recheck date corrected; 2026-10-31 observations for WHT, PAYE and two IFRS entries; root register freshness notice. | Lookup for VAT no longer reports a false "recheck overdue"; gate green; nothing promoted. |
| A1 | `90323f5` | Gate judges each entry; `SRC-010` and `SRC-011`; two negative controls. | Baseline fixture passed before, fails with `SRC-005` and `SRC-011` now; 3 of 3 controls pass. |
| A3 | `cfed502`, `74df846` | `tools/source_register_integrity.py` with 17 tests; Uganda snapshot rewritten to real keys; retail example state and key corrected. | First run failed on a real defect (`UG-EFRIS` cited as `verified-current`, key not in the register); 0 errors now. |
| A4 | `43e6fc5` | Six machine-specific lines replaced in three files; `tools/check_machine_paths.py` with 10 tests. | The guard found a profile path with a user name that my own search had missed. 0 over ceiling now. |
| A5 | `3530f82` | `tools/route_proxy.py`, routing tests, two owned negatives, Section 10 description aligned with its worked example. | First positive margin from under 0.01 to about 0.15 on two independent proxies; nearest neighbour unchanged. |
| A6 | `dc592e7` | Source-register skill: four rules, capability and degraded-mode table, description aligned, fixture added. | Margins 0.058 and 0.035 to 0.218 and 0.171; portable scan 1 to 2 of 108. |
| Teach | `2d0ed36` | README and `AGENTS.md` tell a fresh agent how to run the Python checks; changelog entry. | Link and machine-path checks green. |

Evidence commits: `0ec9877` (frozen baseline and scope), `d14b7c7` (backlog) and
the commit that adds files 03 to 06.

## Mistakes made and caught during the cycle

- A first draft of the Task 1 re-performance showed assets unequal to
  liabilities plus equity. The error was in my check script (gross input VAT on
  one side, net on the other). Netted consistently, it matches the 29 October
  figures.
- My first description wording for the Section 10 skill used a colon inside a
  plain YAML value; the frontmatter check failed it immediately and I reworded.
- A negative-control test I wrote asserted that every positive fixture fails,
  which became wrong once a second fixture existed; I scoped it.

## Residual risk and blockers

- **D5 (decision for Peter).** A `verified-current` NSSF entry without a named
  reviewer lets the lookup tool answer "final use allowed". Detected and
  reported on every run; not changed. See `06-next-cycle.md`.
- Final statutory output remains blocked for every `draft`, overdue or
  unreviewed entry. The VAT threshold rests on regulator guidance with no
  effective date or Act reference, and secondary reports are not admitted.
- No live-model routing, Tier 3 run, controller acceptance, Windows PowerShell
  5.1 run, native `pwsh` run, remote CI run or public marketplace test was
  produced. The registered gate was run piecewise in an offline container, not
  as one script (see `04-validation-record.md`).
- The lexical routing proxy is a regression guard, not a router; a first-place
  result does not show that a host model would load the skill.
