# Kaizen Wave 1 Repository Report — 2026-08-11

Repository: `C:\wamp64\www\chwezi-accounting-doctrine`
Owner: Peter / Codex
Scope: assigned Wave 1 repairs only; no accounting doctrine or statutory source promotion.

## Evidence boundary and file availability

The required control documents were available and read before edits: the master
assignment, the initial assessment, the standards source register, this
repository's `README.md` controller, and the five skills under
`C:\wamp64\www\skills-web-dev\skills\sdlc-meta\` named by the assignment.
No required reading file was unavailable.

The repository does not contain `scripts/skill_catalog_guardrails.py` at the
expected path. That optional source-ingestion/catalog check is therefore
`NOT ASSESSED`; no pass is claimed for it.

## Baseline

Baseline status was clean `main...origin/main` before edits. The initial
assessment records 103 active skills, 245 reference files, 2 templates, 134
examples, 12 scripts, 3 test files, one machine fixture, and nine quality
fixtures for this repository (`C:\wamp64\www\KAIZEN-INITIAL-ASSESSMENT.md`).

The baseline evidence was:

| Measure | Baseline evidence | Result |
|---|---|---|
| Active catalogue | Filesystem inventory and initial assessment | 103 `SKILL.md` files |
| Structural doctrine gate | `tools/validate-doctrine.ps1 -Strict` | Pass, exit 0; 4 checks |
| Invariant runner | `tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1 -Json` | Pass, exit 0; 38 assertions |
| Frontmatter | `scripts/fix-frontmatter-report.ps1 -Strict` | Pass, exit 0; 103 files, 0 findings |
| Router map | Initial assessment and direct placeholder scan | 102 of 103 rows had literal `$name` / `$rel` columns |
| Root discovery | Root inventory | No `AGENTS.md`, `CLAUDE.md`, or root `SKILL.md` |
| Finance-module audit path | `finance-module-audit/SKILL.md` | Stale consumer-specific `_doctrine` path present |
| Source state | Fixture versus `doctrine/source-register/schema.yaml` | Fixture used unsupported `verified-current-with-conflict-watch`; the VAT register entry remains `draft` |

The diagnostic raw baseline was 67.0/100 and the exercise-published baseline
was 55.0/100 under `min(raw, 55)`. The repository's permanent doctrine policy
continues to use its separate 65 ceiling in `README.md`; this report does not
replace it. Baseline maturity was L2, repeatable but with material evidence
gaps (initial assessment).

### Re-score decision

The provisional raw score is retained at 67.0/100 rather than increased. The
wave adds structural and fixture evidence, but no independent outcome,
render, system, or production evidence exists to support a numeric uplift.
The exercise-published score therefore remains 55.0/100. The 95/100 target is
not achieved by this wave. Maturity remains L2 pending the broader evidence
listed below.

## Changes implemented

### P0-01 — filesystem-derived router map and principal route gate

| Field | Wave 1 record |
|---|---|
| Gap | `docs/router-map.md` contained 102 literal placeholder rows out of 103; navigation could not reliably identify a skill or path. |
| Root cause | Map generation had emitted placeholder variables instead of interpolating filesystem and frontmatter values. |
| Exact change | Added `tools/update-router-map.ps1`; regenerated `docs/router-map.md`; added its `-Check` mode to `tools/validate-doctrine.ps1`. The generator discovers `skills/**/SKILL.md`, reads `name` and scalar/block `description` frontmatter, sorts by path, rejects duplicate names, and checks exact generated output. |
| Hypothesis | A fresh agent will reach the intended skill from filesystem truth without manually repairing route names or paths. |
| Owner | Peter / Codex |
| Measure | 103 map rows, 0 placeholder rows, 0 duplicate names, and a passing route check. |
| Risk | A generated map can change route labels when a skill is renamed or its frontmatter changes. |
| Rollback | Restore only `docs/router-map.md` and remove the router-map gate if route precision regresses; retain the evidence of the regression. |
| Acceptance evidence | `tools/update-router-map.ps1 -Check -Json`: pass, `skill_count=103`, `placeholder_rows=0`, exit 0; principal gate also passes the router check. |
| Standardisation | Keep generation/check in the principal gate and require the map to be rebuilt after active-skill frontmatter or path changes. |
| Re-audit | 2026-08-18 |

### P0-02 — model-neutral discovery and thin Claude bridge

| Field | Wave 1 record |
|---|---|
| Gap | The repository had no root discovery file, so the README was the only controller and Claude/Codex discovery was not demonstrated consistently. |
| Root cause | Repository-wide routing, safety, evidence, and validation rules were not collected in a model-neutral root entry point. |
| Exact change | Added root `AGENTS.md` with discovery, accounting-control, source-state, validation, and handoff rules. Added a six-line `CLAUDE.md` bridge containing `@AGENTS.md`; it does not duplicate canonical doctrine. |
| Hypothesis | Codex, Claude, and a manually guided generic agent will receive the same canonical repository rules, subject to each runner's discovery behaviour. |
| Owner | Peter / Codex |
| Measure | Root discovery surface changed from 0 files to 2 files; bridge remains 6 lines and points to the canonical file. |
| Risk | A runner may not support `@AGENTS.md` import syntax or may discover neither file automatically. |
| Rollback | Remove only `CLAUDE.md` if its import syntax is rejected by a verified Claude run; keep `AGENTS.md` as the model-neutral entry point. |
| Acceptance evidence | Static inspection confirms `AGENTS.md` contains the canonical rules and `CLAUDE.md` contains only the import bridge. Actual Claude runtime discovery is `NOT ASSESSED`. |
| Standardisation | Treat `AGENTS.md` as canonical; adapters must import it rather than copy its logic. |
| Re-audit | 2026-08-18 |

### P0-03 — verified repair of the finance-module audit path

| Field | Wave 1 record |
|---|---|
| Gap | `finance-module-audit/SKILL.md` directed consumers to the stale `<engine-root>/skills/_doctrine/accounting-finance-doctrine.md` mirror. |
| Root cause | The skill retained an older consumer-specific path after the repository became the canonical accounting engine. |
| Exact change | Replaced the stale mirror instruction with active-repository resolution through `AGENTS.md`, `README.md`, or the global routing table, followed by `doctrine/accounting-finance-doctrine.md`; clarified the local references path. |
| Hypothesis | A fresh agent will load the canonical doctrine without depending on a retired private mirror. |
| Owner | Peter / Codex |
| Measure | Exact stale path scan: 1 pre-change pattern, 0 after change. |
| Risk | A consumer engine may have an undocumented local mirror. |
| Rollback | Restore the prior line only if an identified consumer proves it is still authoritative; otherwise add an explicit documented alias rather than restoring an unverified path. |
| Acceptance evidence | `rg` scan finds no `skills/_doctrine` or `<engine-root>/skills` reference in the audit skill; strict links and skill-contract gates pass. |
| Standardisation | Resolve canonical doctrine from the owning engine's declared router, not from device-specific mirror paths. |
| Re-audit | 2026-08-18 |

The changed audit skill also received the current portable metadata and
dual-compatibility contract. This was limited to the file already required for
the stale-path repair; it was not a repository-wide normalisation pass.

### P1-01 / P1-02 — executable duplicate, reversal, and source-state evidence

| Field | Wave 1 record |
|---|---|
| Gap | The documentation claimed reversal and duplicate coverage, while the runner materially checked key uniqueness only. The fixture state `verified-current-with-conflict-watch` was not in the source schema, and the VAT register entry is still draft. |
| Root cause | Fixture semantics mixed illustrative calculation state with final statutory authority, and duplicate/reversal cases were not represented as executable case types. |
| Exact change | Updated `Test-AccountingInvariants.ps1` to use the schema state set, distinguish illustrative calculations from `final-statutory-output`, require draft-source final output to fail, verify full reversal linkage and equal/opposite lines, and test changed-payload duplicate idempotency rejection. Added test-labelled cases to `retail-vat-pos.fixture.json`; aligned `tests/accounting-invariants/README.md`; added `RepoRoot` support so the runner can be called by the principal gate. |
| Hypothesis | The accounting gate will detect false source promotion, duplicate mutation, and unlinked or incorrectly signed reversals while preserving the distinction between fixture arithmetic and final statutory authority. |
| Owner | Peter / Codex |
| Measure | Assertions increased from 38 to 48; the fixture now uses schema state `draft`, reports final output as blocked, and proves the reversal and duplicate cases. |
| Risk | A fixture can overfit one posting architecture or be mistaken for proof of a production posting service. |
| Rollback | Revert the fixture additions and runner branch changes if a real consumer demonstrates incompatible case semantics; retain the original structural checks and document the missing case contract. |
| Acceptance evidence | Invariant runner: pass, 48 assertions, 0 failures, exit 0. Targeted results pass for `source-state-schema`, `statutory-output-gate`, `reversal-linkage`, `reversal-equal-opposite`, and `duplicate-idempotency-key-rejection`; the stale-source negative case records the expected `statutory-source` failure inside its negative-case result. |
| Standardisation | Keep duplicate, reversal, source-state, and negative-case evidence in the finance fixture; require the principal doctrine gate to execute the runner. |
| Re-audit | 2026-08-25 |

All fixture entity and case identifiers are fictional or explicitly
test-labelled. No source-register entry was changed or promoted.

## Before and after measures

| Measure | Before | After | Evidence |
|---|---:|---:|---|
| Filesystem-derived router rows | 103 rows, 102 with literal placeholders | 103 valid rows, 0 placeholders | `docs/router-map.md`; `tools/update-router-map.ps1 -Check -Json` |
| Root discovery files | 0 | 2 (`AGENTS.md`, `CLAUDE.md`) | Root inventory and file contents |
| Principal gate checks | 4 | 6 | `tools/validate-doctrine.ps1 -Strict` output |
| Invariant assertions | 38 | 48 | Runner JSON summaries |
| Finance audit stale mirror path | Present | 0 exact matches | `rg` scan of `finance-module-audit/` |
| VAT fixture source state | Unsupported custom state | `draft`, allowed by schema; final output blocked | `doctrine/source-register/schema.yaml`, fixture, runner |
| Changed audit skill portable validation | Failed for missing metadata/markers on first check | Pass | `quick_validate.py`, exit 0 |

## Validation and test evidence

### Structural and behavioural checks

| Command | Result and exit state |
|---|---|
| `.\tools\update-router-map.ps1` | Generated from filesystem; pass, exit 0. An initial attempt exposed an empty generic-list JSON reporting issue; the report collection was changed to `ArrayList` before acceptance. |
| `.\tools\update-router-map.ps1 -Check -Json` | Pass; 103 skills, 0 placeholder rows, exit 0. |
| `Get-Content -Raw tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json | ConvertFrom-Json` | JSON parse pass. |
| `.\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1 -Json` | Pass; 48 assertions, 0 failures, exit 0. |
| `.\tools\validate-doctrine.ps1 -Strict` | Pass; mojibake, skill-contracts, source-register, links, router-map, and accounting-invariants all pass; 0 blocker/high/medium/caveat findings; exit 0. |
| `.\scripts\fix-frontmatter-report.ps1 -Strict` | Pass; 103 skill files, 0 findings; exit 0. |
| `git diff --check` | Pass, exit 0 after removing an extra generated EOF blank line. |

### Changed-skill authoring and safety checks

| Command or review | Result and exit state |
|---|---|
| `python -X utf8 C:\wamp64\www\skills-web-dev\skills\sdlc-meta\skill-writing\scripts\quick_validate.py skills/06-close-consolidation-and-reporting/finance-module-audit` | Initial check failed because the pre-existing skill lacked portable metadata and dual-compatibility markers. After the bounded contract addition: pass, exit 0. |
| `python -X utf8 C:\wamp64\www\skills-web-dev\skills\sdlc-meta\skill-writing\scripts\contract_gate.py --skill skills/06-close-consolidation-and-reporting/finance-module-audit` | Pass; 0 errors, 0 warnings, 0 exemptions; exit 0. |
| Static safety scan of changed files for remote installers, credential collection, exfiltration, hidden destructive actions, and raw ebook formats | Zero matching findings. Changed skill and new scripts were read statically; no new dependency or network action was introduced. Safety status: Safe for inspected surfaces. |
| `python -X utf8 scripts/skill_catalog_guardrails.py --report-only` | `NOT ASSESSED`; the script is not present in this repository. |

### Evidence classification

| Evidence type | State | Boundary |
|---|---|---|
| Structural | PASS | Frontmatter, links, encoding, router generation/check, and principal wiring are executable. |
| Behavioural | PASS for the committed fixture | The runner proves named semantic cases, not a deployed posting service. |
| Render | NOT ASSESSED | No Office, PDF, screenshot, or rendered accounting artefact was supplied or produced. |
| System/integration | NOT ASSESSED | No consumer application, database, posting service, or external integration was in scope. |
| Production/operational | NOT ASSESSED | No deployment, live ledger, audit engagement, or production telemetry was supplied. |
| Current statutory source verification | NOT ASSESSED for this wave | The VAT and other draft entries remain draft; no source promotion was attempted. |

## Remaining backlog

### P0

- No assigned P0 repair remains unpatched: router-map generation/check,
  model-neutral root discovery, thin Claude bridge, stale audit path, and
  principal invariant integration are implemented and gated.
- Final statutory output remains blocked wherever the applicable source-register
  entry is not `verified-current` or reviewer-approved `verified-with-caveat`.
  This is a release constraint, not a defect silently closed by the fixture.

### P1

- Add an independent review of the new invariant fixture and a consumer-repo
  integration test against a real posting service when one is available.
- Add routing positive, near-neighbour negative, missing-input, and degraded-mode
  fixtures for this engine; the current wave repaired the catalogue artefact but
  did not create a full prompt-routing benchmark.
- Re-run the wave from a fresh Claude environment to verify actual `CLAUDE.md`
  import behaviour; keep unsupported discovery paths `NOT ASSESSED`.

### P2

- Route current statutory, tax, payroll, FX, and authority-template claims through
  the Digital Research Engine and update only the affected source-register entries
  after dated primary-source verification and reviewer approval.
- Add a small instruction-discovery matrix for Codex, Claude, and generic manual
  entry, recording runner version/date and limitations.
- Add outcome evidence for any downstream finance product: reconciliation,
  period lock, permissions, audit-log, export, accessibility, recovery, and
  production handoff checks as applicable.

## Compatibility

| Runner | Contract | Evidence state |
|---|---|---|
| Codex | Loads model-neutral `AGENTS.md`, then the README, doctrine, gate, applicable skill, and source register. | Static path and content check PASS; this worker executed the route. |
| Claude Code | Thin `CLAUDE.md` imports `AGENTS.md` with `@AGENTS.md`; no duplicate doctrine is maintained. | Bridge is present and syntactically reviewed; actual Claude runtime discovery is `NOT ASSESSED`. |
| Generic agent | Use `README.md`, `AGENTS.md`, `docs/router-map.md`, and explicit skill paths; there is no assumed universal automatic instruction-file mechanism. | Manual route is documented; automatic discovery is `NOT ASSESSED`. |

## Git review and unrelated changes

The baseline worktree was clean. The post-change worktree contains only the
files listed below; no pre-existing or unrelated changes were observed:

- `AGENTS.md`
- `CLAUDE.md`
- `docs/router-map.md`
- `docs/continuous-improvement/kaizen-wave-1-2026-08-11.md`
- `skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md`
- `tests/accounting-invariants/README.md`
- `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`
- `tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1`
- `tools/update-router-map.ps1`
- `tools/validate-doctrine.ps1`

No commit, push, fetch, pull, reset, broad deletion, or sibling-repository
change was performed.

## Next-wave recommendation

Keep this repository at L2 until an independent reviewer confirms the fixture
semantics and a consumer application supplies system-level posting evidence.
The next scheduled checks are the P0 re-audit on 2026-08-18, the independent
behavioural review on 2026-08-25, and the first statutory/source-currency review
on 2026-11-11. Do not award 95/100 before those evidence gaps are closed.
