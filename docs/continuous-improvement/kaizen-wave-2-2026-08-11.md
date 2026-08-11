# Chwezi Accounting Doctrine — Kaizen Wave 2 Re-audit

Repository: `C:\wamp64\www\chwezi-accounting-doctrine`
Audit date: 2026-08-11
Scope: adversarial router-map, accounting-invariant, source-state, and root-discovery checks only
Write boundary: this repository only

## Executive result

Wave 2 found a proof gap rather than a failing happy-path gate. The Wave 1
router check compared the committed map with the generator's output, but did
not separately report placeholder rows or malformed map row sets. The Wave 1
invariant runner checked a committed full reversal and a duplicate key case,
but did not cross-check source-register identity or exercise malformed reversal
linkage. These findings were confirmed by reading the implementation and then
challenged with deterministic negative fixtures.

The correction is accepted for the bounded scope. The live router map,
source-register scan, root discovery check, accounting fixture, and principal
strict gate pass. Expected negative child exits remain explicit evidence inside
the negative-control reports. No source-register entry was promoted; the
Uganda VAT entry remains `draft` and final statutory use remains blocked
(`doctrine/source-register/uganda/vat.yaml`, `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`).

No score uplift is claimed. The raw baseline remains 67.0/100 and the exercise
published score remains 55.0/100 under `min(raw, 55)` (`KAIZEN-INITIAL-ASSESSMENT.md`,
`docs/continuous-improvement/kaizen-wave-1-2026-08-11.md`). Render, system,
integration, production, and independent controller evidence remain
`NOT ASSESSED`.

## Fresh re-audit findings

### Router-map challenge

Wave 1 fixed the observed 102 placeholder rows and wired a filesystem-derived
generator into the strict gate (`docs/continuous-improvement/kaizen-wave-1-2026-08-11.md`).
The remaining assumption was that exact generated-text equality was sufficient
to detect all route corruption. It was not sufficient as an independently
named semantic check: the generator did not expose separate findings for
placeholder tokens, duplicate map rows, or missing filesystem-derived paths.

Wave 2 adds semantic row parsing, placeholder detection, duplicate name/path
detection, missing/unexpected path detection, and an injectable `-MapPath` for
fixture checks (`tools/update-router-map.ps1`). Three negative controls fail as
expected with child exit 1 for `ROUTER-003`, `ROUTER-004`, and `ROUTER-005`; the
negative-control wrapper itself passes with exit 0
(`tests/router-map/scripts/Test-RouterMapNegativeControls.ps1`). The live map
passes with 103 discovered skills and zero placeholder rows
(`tools/update-router-map.ps1 -Check -Json`).

### Accounting-invariant challenge

The Wave 1 runner's source states were a hard-coded copy of the schema, and
source-key identity was not checked against the register. Its reversal proof
covered the valid full reversal but had no malformed-linkage case. Its
idempotency signature did not include period or VAT/source-use fields
(`tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1`).

Wave 2 derives allowed source states from `doctrine/source-register/schema.yaml`,
loads source-register IDs and states, checks exactly one matching source ID and
state, detects duplicate source-register identities, includes `journal_id` and
case identity uniqueness, expands the duplicate signature, and adds negative
cases for draft final output and malformed reversal linkage. The runner passes
63 assertions with zero failed assertions; the negative cases record the
expected failures rather than turning them into positive cases
(`tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`, runner
JSON output).

### Root discovery and source promotion check

The Wave 1 root shape was manually inspected but was not an executable
principal check. Wave 2 adds a check that `AGENTS.md` contains the canonical
discovery markers and that `CLAUDE.md` imports `AGENTS.md` exactly once while
remaining a thin bridge (`tools/check-repository-discovery.ps1`). It passes
with exit 0. Actual Claude runtime discovery remains `NOT ASSESSED`.

The source-register checker now detects duplicate IDs and missing entry
identities (`tools/check-source-register.ps1`). The live register scan passes
with 10 parsed source entries, one `verified-current` entry, eight `draft`
entries, and zero duplicate IDs (command JSON evidence). The duplicate/missing-ID
negative fixture produces `SRC-008` and `SRC-009` with child exit 1; its wrapper
passes with exit 0. `git diff --name-only HEAD -- doctrine/source-register` returns no
paths, and no Wave 2 change promotes a draft source.

## Wave 1 challenge and result

| Wave 1 assumption challenged | Wave 2 challenge | Result |
|---|---|---|
| Exact generated map text was enough to detect route corruption | Ran placeholder, duplicate-row, and incomplete-map fixtures through `-Check -MapPath` | Expected child exits 1 with `ROUTER-003`, `ROUTER-004`, and `ROUTER-005`; wrapper exit 0; live map exit 0 |
| The fixture's valid reversal demonstrated reversal protection | Added a wrong original journal link and non-opposite line amounts | `REJECT-MALFORMED-REVERSAL` records `reversal-linkage` and `reversal-equal-opposite` failures inside an expected negative case |
| A source state string was enough for fixture semantics | Matched fixture source key and state to the live source register and introduced a duplicate-ID fixture | Live identity scan passes; duplicate fixture returns `SRC-008`; draft final output remains rejected |
| Static root inspection was enough for discovery shape | Added an executable root bridge and canonical-marker check | `repository-discovery` exit 0; actual Claude auto-discovery remains `NOT ASSESSED` |

## Wave 2 actions

### W2-01 — Router-map semantic gate and negative controls

| Contract field | Wave 2 record |
|---|---|
| Gap | Placeholder, duplicate, and missing route corruption had only an exact-text mismatch path, even though Wave 1 had repaired a placeholder incident (`docs/continuous-improvement/kaizen-wave-1-2026-08-11.md`). |
| Root cause | The generator emitted and compared a complete map but did not expose an independent semantic row-set audit or a test seam for alternate map text. |
| Change | Extended `tools/update-router-map.ps1` with `-MapPath`, row parsing, placeholder findings, duplicate name/path findings, missing/unexpected path findings, and structured failure codes. Added `tests/router-map/scripts/Test-RouterMapNegativeControls.ps1` and three test-labelled Markdown fixtures. Wired the wrapper into `tools/validate-doctrine.ps1`. |
| Hypothesis | A map with plausible Markdown structure but corrupted route rows will fail for a named reason before a human relies on it (inference). |
| Owner | Accounting engine maintainer. |
| Measure | Live `skill_count=103`, `placeholder_rows=0`, router exit 0; three negative controls each require child exit 1 and the expected finding code (`tools/update-router-map.ps1 -Check -Json`, negative-control JSON). |
| Risk | The row parser is intentionally limited to the router table shape; a future format change could require a parser update. The generator remains filesystem-derived, so it does not prove prompt-level routing precision. |
| Rollback | Revert the semantic branch and negative-control wiring while retaining the Wave 1 generator, or update the parser and fixtures together if the map format changes. Do not bypass a failing route check. |
| Acceptance | Full strict doctrine validation passes; the three negative fixtures produce `ROUTER-003`, `ROUTER-004`, and `ROUTER-005` with child exit 1; current map check exits 0. |
| Standardisation | Keep named route findings and the negative-control wrapper in the principal gate. Rebuild the map after active skill path/frontmatter changes. |
| Re-audit | 2026-08-25, or immediately after a router-table format change. |

### W2-02 — Source-register identity and root discovery controls

| Contract field | Wave 2 record |
|---|---|
| Gap | Source-register duplicate identity and root instruction shape were manually reviewed rather than independently executable. A source key could be syntactically known without proving that exactly one live register entry carried the same state. |
| Root cause | `check-source-register.ps1` validated file-level state but did not index entry IDs; no principal check covered the model-neutral root file and thin Claude bridge. |
| Change | Extended `tools/check-source-register.ps1` with entry identity extraction, duplicate-ID finding `SRC-008`, missing-ID finding `SRC-009`, `-RegisterRoot` fixture support, and summary counts. Added `tools/check-repository-discovery.ps1`; wired both it and `tests/source-register/scripts/Test-SourceRegisterNegativeControls.ps1` into `tools/validate-doctrine.ps1`. Added three test-labelled source-identity YAML fixtures. |
| Hypothesis | Register identity collisions and discovery drift will be rejected before a source or instruction surface is treated as canonical (inference). |
| Owner | Accounting engine maintainer. |
| Measure | Live source-register scan: 10 entries, one `verified-current`, eight `draft`, zero duplicate IDs; duplicate/missing-identity fixture child exit 1 with `SRC-008` and `SRC-009`; discovery check exit 0 (command JSON evidence). |
| Risk | The source-register identity parser supports the repository's documented YAML sequence shape, not arbitrary YAML or every possible JSON encoding. The discovery check intentionally enforces the current thin bridge wording. |
| Rollback | Revert only the new identity/discovery checks and fixtures if the documented register or bridge contract changes; keep draft final-output blocking and record the contract change before adapting tests. |
| Acceptance | Strict doctrine gate passes with source-register and repository-discovery checks; source-identity wrapper exits 0 while retaining child exit 1 evidence for `SRC-008` and `SRC-009`; no source-register entry is changed in the Wave 2 diff. |
| Standardisation | Treat source-register `id` as unique identity, retain duplicate-ID negative controls, and keep `AGENTS.md` canonical with `CLAUDE.md` as a thin adapter. |
| Re-audit | 2026-08-25, with actual Claude runtime discovery still separately unassessed. |

### W2-03 — Accounting invariant adversarial cases

| Contract field | Wave 2 record |
|---|---|
| Gap | The existing fixture did not prove malformed reversal rejection, draft-source final-output rejection as a named negative case, schema/register identity alignment, or journal identity uniqueness. |
| Root cause | Wave 1 added valid reversal and duplicate examples but did not include a deliberately malformed reversal or an independent source-register index in the runner. |
| Change | Extended `tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1` to load schema states and source-register entries, compare source identity/state, check case and journal identity, and use a broader duplicate payload signature. Added `REJECT-DRAFT-FINAL-OUTPUT` and `REJECT-MALFORMED-REVERSAL` to `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`; updated `tests/accounting-invariants/README.md`. |
| Hypothesis | Accounting fixtures will detect false source promotion and malformed reversal lineage while continuing to distinguish illustrative arithmetic from final statutory authority (inference). |
| Owner | Accounting engine maintainer, with controller review required for production adoption. |
| Measure | Runner JSON: 63 total assertions, zero failed assertions, valid full reversal pass, draft final-output negative pass, malformed reversal negative pass, and duplicate idempotency negative pass. |
| Risk | A fixture proves the named fixture contract, not a deployed posting service, database transaction, permissions model, or subledger tie-out. The source-register parser remains format-scoped. |
| Rollback | Revert the new fixture cases and runner branches if a consumer contract proves incompatible; retain the original balance, period, evidence, and uniqueness checks and document the missing consumer contract. |
| Acceptance | `Test-AccountingInvariants.ps1 -Json` exits 0; expected negative results include `statutory-source` for draft final output and `reversal-linkage`/`reversal-equal-opposite` for malformed reversal; principal validator executes the runner. |
| Standardisation | Keep negative cases test-labelled, require source-register lineage for VAT cases, and do not describe fixture evidence as production posting-service evidence. |
| Re-audit | 2026-08-25, or when a real posting-service consumer is available. |

## Measures

| Measure | Before Wave 1 | After Wave 1 | After Wave 2 | Evidence |
|---|---:|---:|---:|---|
| Active `SKILL.md` catalogue | 103 | 103 | 103 | Initial assessment; Wave 1 report; `update-router-map.ps1 -Check -Json` |
| Router placeholder rows | 102 | 0 | 0, with named negative-control detection | Wave 1 report; router JSON and negative-control JSON |
| Principal doctrine checks | 4 | 6 | 9 | Wave 1 report; `validate-doctrine.ps1 -Strict` output |
| Invariant assertions | 38 | 48 | 63 | Wave 1 report; runner JSON |
| Root discovery files | 0 | 2 | 2, now independently checked | Wave 1 report; `check-repository-discovery.ps1 -Json -Strict` |
| Source-register identity collision check | `NOT ASSESSED` | `NOT ASSESSED` | 0 live duplicates; negative fixture detects `SRC-008` | Source checker JSON and negative-control JSON |
| Exercise raw score | 67.0 | 67.0 | 67.0; no uplift claimed | Initial assessment; Wave 1 re-score; this report |
| Exercise published score | 55.0 | 55.0 | 55.0 | `min(raw, 55)` policy in assignment and prior reports |

The row values above are historical or executable measures, not claims of
production quality. The Wave 2 evidence improves structural and fixture
coverage only. It does not close the system, render, production, current
statutory-verification, or professional-review gaps.

## Validation evidence

| Command | Exit | Result |
|---|---:|---|
| `\.\tools\update-router-map.ps1 -Check -Json` | 0 | Live filesystem-derived map passes; 103 skills; zero placeholder rows. |
| `\.\tests\router-map\scripts\Test-RouterMapNegativeControls.ps1 -RepoRoot .` | 0 | Three wrapper controls pass; each child malformed-map check exits 1 with its expected code. |
| `\.\tools\check-source-register.ps1 -Json -Strict` | 0 | Live register passes; 10 entries; one verified-current; eight draft; zero duplicate IDs. |
| `\.\tests\source-register\scripts\Test-SourceRegisterNegativeControls.ps1 -RepoRoot .` | 0 | Wrapper passes; duplicate/missing-ID child check exits 1 with `SRC-008` and `SRC-009`. |
| `\.\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1 -Json` | 0 | 63 assertions; zero failures; expected negative cases remain explicit in the JSON results. |
| `\.\tools\check-repository-discovery.ps1 -Json -Strict` | 0 | Canonical `AGENTS.md`, thin `CLAUDE.md` bridge, and README controller shape pass. |
| `\.\tools\validate-doctrine.ps1 -Strict` | 0 | All 9 principal checks pass with zero blocker, high, medium, or caveat findings. |
| `\.\scripts\fix-frontmatter-report.ps1 -Strict` | 0 | 103 skill files and zero frontmatter findings (Wave 1 skill surface rechecked). |
| `git diff --check` | 0 | No whitespace errors. |
| `Get-Content -Raw tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json \| ConvertFrom-Json` | 0 | Fixture parses. |

Expected negative child exits are not suppressed: the router wrapper records
three child exit 1 results, and the source-register wrapper records one child
exit 1 result. The wrappers exit 0 only when the expected finding and failure
state are observed.

## Safety and anti-slop review

### Safety

Inspected Wave 2 scripts, fixtures, the changed invariant README, the existing
Wave 1 changed finance audit skill, root bridges, and the complete generated
report. No new remote installer, fetched execution, credential request,
secret collection, exfiltration path, hidden destructive operation, or new
dependency was found. The changed scripts operate on repository-local files
and test-labelled fixtures. Safety verdict: Safe for inspected surfaces. The
repository does not contain the optional
`scripts/skill_catalog_guardrails.py`; source-ingestion guardrail status is
`NOT ASSESSED`, not pass (`docs/continuous-improvement/kaizen-wave-1-2026-08-11.md`).

### Anti-slop

The report uses repository paths and command outputs as evidence. Fixture
entities and identifiers remain explicitly test-labelled; no client name,
reviewer, statutory rate, external URL, or direct quote was added. Draft
statutory source state remains visible and final use remains blocked. Claims
about production posting, current statutory verification, render fidelity,
and runtime discovery are labelled `NOT ASSESSED`. This is a scope-bound
evidence statement, not a certification.

## Portability

| Runner | Status | Boundary |
|---|---|---|
| Codex | PASS for this audit's static route and executed repository checks | This run loaded `AGENTS.md`, README, doctrine, source register, applicable skill, and gates. This does not prove every Codex configuration auto-discovers the files. |
| Claude Code | Bridge shape PASS; runtime `NOT ASSESSED` | `CLAUDE.md` imports `@AGENTS.md` once and contains no copied doctrine. An actual Claude session was not run. |
| Generic agent | Manual route PASS; automatic discovery `NOT ASSESSED` | Load README, `AGENTS.md`, `docs/router-map.md`, the applicable skill, source register, and principal gates explicitly. |

Canonical contracts remain in `AGENTS.md`, README, `SKILL.md`, the source
register, and repository-native scripts. No vendor-specific finance doctrine
was added.

## Evidence classification and residual states

| Evidence class | State | Limitation |
|---|---|---|
| Structural | PASS | Frontmatter, links, encoding, router generation/check, source-register scan, discovery shape, and principal wiring execute successfully. |
| Behavioural fixture | PASS | Named accounting cases and router/source negative controls pass; this is fixture-level evidence. |
| Render | NOT ASSESSED | No rendered accounting report, Office artefact, PDF, or visual review was in scope. |
| System/integration | NOT ASSESSED | No consumer posting service, database, permission model, or subledger integration was supplied. |
| Production/operational | NOT ASSESSED | No deployment, live ledger, audit engagement, or production telemetry was supplied. |
| Current statutory verification | NOT ASSESSED | No draft VAT source was promoted; current source review and professional approval were not performed. |
| Independent controller review | NOT ASSESSED | The report records the requested repository audit but not a separate controller sign-off. |

### Residual P0

- Final statutory output remains blocked for draft, stale, superseded, or
  no-source-found entries. This is an active release constraint, not a closed
  source-verification defect (`doctrine/source-register/schema.yaml`).
- No Wave 2 P0 code defect remains within the assigned router/invariant scope
  after the strict gate passes. This does not authorise production release.

### Residual P1

- Obtain an independent controller review of the fixture semantics.
- Add a consumer-repository integration test against a real posting service
  when one exists.
- Add prompt-level routing benchmarks covering positive, neighbour, ambiguous,
  missing-input, and degraded-mode prompts.
- Re-run the root bridge from a real Claude environment.

### Residual P2

- Verify current Uganda VAT, payroll, FX, EFRIS, and other statutory sources
  through the Digital Research Engine and required reviewer route before any
  source-register state change.
- Add production and render evidence for downstream finance artefacts when
  supplied.
- Revisit the YAML parser if the documented source-register shape changes or
  JSON entries become active.

## Exact Wave 2 files

Wave 2 touched or added these files in this repository:

- `docs/continuous-improvement/kaizen-wave-2-2026-08-11.md`
- `tools/update-router-map.ps1` (Wave 1 generator extended with Wave 2 semantic checks)
- `tools/check-source-register.ps1`
- `tools/check-repository-discovery.ps1`
- `tools/validate-doctrine.ps1`
- `tests/accounting-invariants/README.md`
- `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`
- `tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1`
- `tests/router-map/scripts/Test-RouterMapNegativeControls.ps1`
- `tests/router-map/fixtures/placeholder-router-map.md`
- `tests/router-map/fixtures/duplicate-router-map.md`
- `tests/router-map/fixtures/missing-router-map.md`
- `tests/source-register/scripts/Test-SourceRegisterNegativeControls.ps1`
- `tests/source-register/fixtures/duplicate-source-state-id/first.yaml`
- `tests/source-register/fixtures/duplicate-source-state-id/second.yaml`
- `tests/source-register/fixtures/duplicate-source-state-id/missing-id.yaml`

Wave 1 files not requiring a Wave 2 correction were preserved, including the
root `AGENTS.md`/`CLAUDE.md` bridges, `docs/router-map.md`, and the changed
`finance-module-audit/SKILL.md`.

No commit, push, fetch, pull, reset, publish, sibling-repository, or
workspace-report modification was performed.
