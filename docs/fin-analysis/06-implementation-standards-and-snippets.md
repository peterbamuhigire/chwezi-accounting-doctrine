# Implementation Standards And Snippets

Assessment date: 2026-05-16

These are the standards that now govern the doctrine package after the 94/100 reassessment.

## Validator Command

Run before every release:

```powershell
powershell -ExecutionPolicy Bypass -File tools\validate-doctrine.ps1 -ReportPath docs\validation-report-current.json
```

Acceptance state:

```yaml
doctrine_validation: pass
blocker_findings: 0
high_findings: 0
medium_findings: 0
caveat_findings: 0
```

## Source-Register Rule

Final statutory output may use only entries with one of these states:

```yaml
state: verified-current
```

or:

```yaml
state: verified-with-caveat
reviewer_approval: "<name, date, scope>"
```

Draft entries can support planning, SRS, proposals, and internal architecture, but not final rates, filings, or statutory calculations.

## Current Verified-Current Example

```yaml
id: UG-NSSF-MEMBERSHIP-CONTRIBUTIONS
jurisdiction: UG
state: verified-current
source_url_or_doc: "https://www.nssfug.org/about-us/membership/"
archive_snapshot: "docs/quality-gate-fixtures/source-register-evidence/uganda-nssf-membership-2026-05-15.md"
scope: "Mandatory contribution split, age band, Government Pensions exception, and monthly remittance due date only."
```

## Quality-Gate Evidence Rule

Every blocker in `governance/finance-accounting-quality-gate.md` must map to present evidence in `docs/quality-gate-fixture-map.md`.

Current acceptance state:

```yaml
blockers_in_quality_gate: 40
mapped_rows: 40
present_evidence_rows: 40
planned_evidence_rows: 0
```

## Skill Reference Rule

Every path declared in a skill `## Files` section must exist or be intentionally classified. Current release evidence requires existence.

Current acceptance state:

```yaml
active_finance_skills: 25
declared_references: 69
missing_declared_references: 0
```

## Client-Facing Output Pattern

Every client-facing finance output should keep three layers:

| Layer | Required content |
|---|---|
| Business meaning | What happened in plain operational language. |
| Accounting treatment | Journal, account, recognition, measurement, and report effect. |
| Evidence and caveat | Source document, source-register state, reviewer state, and open caveats. |

## Consumer-Repository Enforcement

When a consumer application adopts this doctrine, add executable tests for:

- Direct journal-line writes rejected.
- Balanced posting-service entries accepted.
- Locked-period postings rejected unless reopened under policy.
- Draft source-register entries blocked from final statutory output.
- Posted records corrected by reversal, not edit/delete.
- Report output includes framework, drilldown, print fidelity, and caveats.
