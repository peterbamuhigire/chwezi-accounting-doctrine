# Final report — 2026-10 Accounting Doctrine Kaizen

## Result

This cycle retained three bounded improvements: a routed after-close Section 10
example, a control-byte scanner and exact repair for repeated damaged
reference rows, and local Claude/Codex packaging plus file-count checks. No
canonical doctrine policy or sibling engine was changed. The synthetic
practitioner tasks remain blocked from a client-ready statutory close where
source, review or transaction evidence is missing.

## Scores

The pre-change evidence snapshot and baseline score correction history are in
[`01-baseline-scorecard.md`](01-baseline-scorecard.md). Because the scorecard
was not frozen before implementation, the cycle owner reconstructed and
reassessed both score sets after the experiments. These ratings are not an
independent audit; no points were assigned just because a backlog target was
stated.

| Dimension | Baseline /100 | Final /100 | Evidence-based final assessment |
|---|---:|---:|---|
| Doctrine | 58 | 58 | The canonical doctrine and posting invariants were preserved and used; the cycle did not re-audit all output families or obtain professional acceptance. |
| Taxonomy and routing | 60 | 63 | A focused three-positive/two-negative expected-label fixture now covers the touched Section 10 skill; 108 active skill roots match both local marketplace manifests. The fixture is not router execution; precision@1 remains `NOT_ASSESSED`. |
| Skill depth | 55 | 60 | The previously missing after-close case now has balanced fixture journals, a source distinction and an acceptance test. Broad skill depth remains uneven; one case does not establish coverage across 108 skills. |
| Applied proof | 54 | 62 | The Python suite rose from 20 to 23 passing tests; the native strict gate has 17/17 checks passing, including negative controls. No model, client or professional controller run was performed. |
| Standards currency | 38 | 46 | Official sources and current dates were checked and bounded register notes updated; 10 rechecks are overdue, multiple jurisdiction records remain draft, and named independent review/archive gaps remain. |
| Output readiness | 48 | 54 | The synthetic close now includes a balanced TB, cross-foot check, PBC index and a clearer prior-error illustration. It is still not a releasable client pack: supporting evidence, LST, tax provision, review and cash-flow classification remain absent or unassessed. |
| Accessibility and inclusion | 50 | 50 | No rendered, assistive-technology or inclusive-output assessment was performed; no evidence supports a score change. |
| Production and handoff | 48 | 62 | Local Claude and Codex installs/details exposed all 108 skills, and file-count/negative checks run in the registered gate. Public listing acceptance and remote CI remain unassessed; Claude strict directory validation retains two warnings. |
| Hygiene | 44 | 58 | Four C0 control bytes per row were repaired in 74 repeated rows; the new scanner catches their class, local links pass, and full/package counts remain under the configured cap. Ten source rechecks and machine-specific paths in consumer engines remain open. |
| Safety and integrity | 60 | 60 | Draft and unsupported statutory values still block final-use output, the ledger history rule is preserved, and failure-path tests pass. No live professional acceptance or external model behavior was tested. |

**Corrected baseline raw mean:** 51.5/100. Its standard published score is
51.5/100 (`min(51.5, 65)`); the separate user-requested initial-baseline cap
is 45/100 (`min(51.5, 45)`). **Final raw mean:** 57.3/100 (`573 / 10`).
**Final standard published capped score:** 57.3/100 (`min(57.3, 65)`). The
initial-baseline cap is reported for the initial baseline only. These caps do
not change the raw scores or clear source, legal, financial or release
blockers. This assessment remains bounded and is not an audit opinion.

### Final-score correction history

The first post-cycle draft also assigned provisional final scores of
74, 74, 72, 68, 46, 58, 70, 70, 65 and 84 (raw mean 68.1/100). Root review
found the same overstatement pattern as in the provisional baseline. The
cycle owner reassessed the scores against the actual scope and retained the
earlier set here as superseded history.

| Dimension | Superseded provisional final | Corrected final | Correction basis |
|---|---:|---:|---|
| Doctrine | 74 | 58 | No full doctrine review across output families or professional acceptance. |
| Taxonomy and routing | 74 | 63 | The expected-label fixture is focused and not router execution or precision measurement. |
| Skill depth | 72 | 60 | One improved after-close example does not establish broad skill coverage. |
| Applied proof | 68 | 62 | Deterministic tests and local gates do not establish client/model behavior or independent review. |
| Standards currency | 46 | 46 | No scoring change; source checks improved, but draft entries and reviewer gaps remain. |
| Output readiness | 58 | 54 | The scenario pack is synthetic and lacks external evidence and review. |
| Accessibility and inclusion | 70 | 50 | No rendered or assistive-technology assessment was run. |
| Production and handoff | 70 | 62 | Native local install succeeds; public listing, remote CI and warning-free strict Claude directory validation remain open. |
| Hygiene | 65 | 58 | The repeated control-byte class was repaired and guarded, but source rechecks and consumer path references remain. |
| Safety and integrity | 84 | 60 | Release gates remain intact, but no live professional acceptance or end-to-end behavior was assessed. |

## Kept changes and evidence

| Item | Change and commit | Verification |
|---|---|---|
| A2 | `34a0874 fix(accounting): catch control-byte corruption in reference contracts` — repaired the exact repeated row and registered the scanner plus bell/tab fixture. | 20-test suite and baseline 13-check strict gate passed at that commit. Final 23-test suite and 17-check gate also pass; exact row mapping is in `03-experiment-log.md`. |
| A1 | `dba156a fix(accounting): clarify after-close Section 10 corrections`; `9857cbb fix(accounting): correct Section 10 journal net explanation` — routed example distinguishes Chwezi ledger mechanics from Section 10 reporting and correctly attributes the net effect to all three open-period journals. | Task 2 rechecked; final 23 Python tests and 17-check strict gate pass. No client case or independent IFRS reviewer. |
| A1 routing fixture | `59ef4c0 test(accounting): add Section 10 routing fixtures` — three positive and two negative expected labels for the touched skill, with a test for target discoverability and label integrity. | Final suite includes two fixture-integrity tests; actual router execution/precision remains `NOT_ASSESSED`. |
| A4 | `3abc9b8 feat(accounting): add Codex local marketplace packaging`; `5f17618 fix(accounting): harden marketplace path and cap validation` — Claude metadata, Codex compatibility/local catalogue, exact-path discovery and hard file-cap guards. | Native Claude install/details and Codex local add/install/list expose all 108 skills. Structural path and failure-path fixtures pass. Claude strict directory scan returns 1 due nonblocking warnings. Public catalogue acceptance is `NOT_ASSESSED`. |
| Source currency | `5048265 docs(accounting): refresh October 2026 source evidence` — refreshes source observation dates and adds bounded currentness notes without promoting unsupported tax entries. | Source register gate passes; official primary-source observations and gaps are cited in `04-validation-record.md` and the country register README files. |

No changes were reverted. The trial-balance duplicate line found during task 3
authoring was corrected before final validation and is documented in
`00-scope-and-evidence.md` and `03-experiment-log.md`.

## Residual blockers and limitations

- Uganda LST schedule/base and final WHT reconciliation were not established;
  Kenya, Rwanda, Tanzania and South Africa statutory schedules were not fully
  reconciled. Draft/unverified entries must not be used for final statutory
  output.
- Independent jurisdiction reviewer, source snapshots/archives and user
  transaction evidence are absent. The synthetic task-1 payroll/close and
  task-3 PBC pack remain illustrative and blocked from release.
- IFRS amendment final text was not located; IFRS 18 statement-template impact
  was not reviewed. Ten source recheck dates remain overdue.
- No route execution/precision benchmark, Tier 3 model run, controller
  acceptance, Windows PowerShell 5.1 run or remote CI result was produced.
- Claude strict directory validation returns exit 1 because of nonblocking
  missing-icon and root-`CLAUDE.md` warnings. The manifest and marketplace
  validators themselves pass without errors or warnings. Public marketplace
  acceptance is `NOT_ASSESSED`.
