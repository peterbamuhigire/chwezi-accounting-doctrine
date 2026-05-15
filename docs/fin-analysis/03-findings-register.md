# Findings Register

Assessment date: 2026-05-16
Current validator state: `pass`

## Findings

| ID | Severity | Area | Current state | Evidence | Remaining action |
|---|---|---|---|---|---|
| F-001 | Low | Current standards | Ready for reviewer | 2027 transition references and 2026/2027 fixtures exist. | Obtain IFRS reviewer sign-off. |
| F-002 | Closed | Executability | Closed | `tools/validate-doctrine.ps1` reports `pass` with zero findings. | Keep validator running in CI and before releases. |
| F-003 | Medium | Source verification | Partially closed | Source register exists; Uganda NSSF is `verified-current`; validator passes. | Verify VAT, PAYE, WHT, income-tax, EFRIS, and FX entries before final statutory output. |
| F-004 | Low | Core accounting engine | Ready for reviewer | `ledger-posting-engine-core` skill, references, examples, and ledger quality-gate fixtures exist. | Add consumer-repo executable posting tests. |
| F-005 | Closed | Reference completeness | Closed | `missing_declared_references: 0`; reference manifest updated. | Maintain manifest discipline for future references. |
| F-006 | Closed | Presentation quality | Closed | Mojibake scan reports zero matches. | Keep scan in validation. |
| F-007 | Closed | Integration | Closed | Repo-relative `integration/mirror.ps1 -DryRun` succeeds. | Mirror only during approved releases. |
| F-008 | Closed | Skill composition | Closed | 25 active skills; skill-contract validation passes. | Keep skill cap and section contract. |
| F-009 | Low | Country coverage | Ready for reviewer | Country skeletons exist and block final rates. | Verify each country before final use. |
| F-010 | Low | Domain coverage | Ready for reviewer | Inventory, fixed assets, payroll, consolidation, engagement-quality, and other skills exist with references/examples. | Add real implementation tests in consumer systems. |
| F-011 | Low | Layman usability | Ready for reviewer | UX skills, microcopy references, and three-layer quality-gate fixtures exist. | Enforce in client-facing templates. |
| F-012 | Low | Quality management | Ready for reviewer | Engagement quality skill, reviewer role fixtures, and sign-off templates exist. | Record named release sign-offs. |

## Open Risks

| Risk | Severity | Why it remains |
|---|---|---|
| Draft statutory surfaces used as final values | High if ignored | Validator mechanics exist, but source entries for VAT/PAYE/WHT/income-tax/EFRIS/FX remain draft. |
| Consumer implementation bypasses doctrine | Medium | This repository has fixtures; consuming applications still need executable enforcement. |
| Reviewer sign-off missing for scored release | Medium | Evidence exists, but professional review must be named and dated. |

## Closure Rule

A finding is closed only when evidence exists, validation passes, and any required reviewer approval is recorded. Current repository evidence supports **94 / 100**. It does not support final statutory claims for draft source-register entries.
