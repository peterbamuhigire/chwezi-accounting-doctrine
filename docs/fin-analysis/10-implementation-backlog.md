# Implementation Backlog

Assessment date: 2026-05-16

## Burn-Down

| ID | Task | Current state | Evidence |
|---|---|---|---|
| S90-001 | Add validation harness and local command. | Done | Validator passes. |
| S90-002 | Add reference manifest and classify references. | Done | `missing_declared_references: 0`. |
| S90-003 | Fix mojibake. | Done | Mojibake scan passes. |
| S90-004 | Fix mirror default path and dry-run. | Done | Dry-run succeeds. |
| S90-005 | Add source-register schema. | Done | Source-register validator passes. |
| S90-006 | Add Uganda source-register seed pack. | Partial | Pack exists; NSSF verified-current; other Uganda entries draft. |
| S90-007 | Add stale/missing-source checks. | Done | Source-register validator and quality-gate fixtures present. |
| S90-008 | Add IFRS 18 transition reference. | Done | Transition reference and fixture exist. |
| S90-009 | Add IFRS for SMEs third-edition transition reference. | Done | Transition reference and fixture exist. |
| S90-010 | Add standards-transition decision tree. | Done | Standards transition reference exists. |
| S90-011 | Add `ledger-posting-engine-core`. | Done | Skill and references exist. |
| S90-012 | Add inventory costing skill. | Done | Skill and fixtures exist. |
| S90-013 | Add fixed assets skill. | Done | Skill and fixtures exist. |
| S90-014 | Add payroll statutory postings skill. | Done | Skill and source gates exist. |
| S90-015 | Add consolidation/intercompany skill. | Done | Skill and examples exist. |
| S90-016 | Add engagement quality/plain-language skill. | Done | Skill and reviewer fixtures exist. |
| S90-017 | Normalize all existing skills. | Done | Skill-contract validator passes. |
| S90-018 | Build audit-export sample bundle. | Done | Sample bundle and fixtures exist. |
| S90-019 | Add country skeletons. | Done | Skeletons exist and block final rates. |
| S90-020 | Update integration documentation. | Done to dry-run level | Mirror dry-run succeeds. |

## Remaining Backlog To Reach 97-98

| ID | Priority | Task | Owner role | Acceptance evidence |
|---|---|---|---|---|
| N95-001 | P0 | Verify Uganda VAT source entries. | Tax reviewer | `vat.yaml` verified-current or approved caveat. |
| N95-002 | P0 | Verify Uganda PAYE source entries. | Payroll tax reviewer | `paye.yaml` verified-current or approved caveat. |
| N95-003 | P0 | Verify Uganda WHT source entries. | Tax reviewer | `wht.yaml` verified-current or approved caveat. |
| N95-004 | P0 | Verify Uganda income-tax entries. | Tax reviewer | `income-tax.yaml` verified-current or approved caveat. |
| N95-005 | P0 | Verify EFRIS and exchange-rate source entries. | Tax systems/controller reviewers | `efris.yaml` and `exchange-rates.yaml` verified-current or approved caveat. |
| N95-006 | P1 | Complete release manifest for tagged release. | Doctrine owner | Filled release manifest with validation state and caveats. |
| N95-007 | P1 | Record named reviewer sign-offs. | Delivery lead | Doctrine, accounting, tax, tooling, and delivery signatures. |
| N95-008 | P1 | Add consumer-repo executable tests. | Engineering owner | Posting, source-register, and quality-gate enforcement tests pass in adopters. |

## Current Recommendation

The 90+ backlog is complete enough for re-score. The new backlog should focus on statutory verification and release sign-off, not new doctrine breadth.
