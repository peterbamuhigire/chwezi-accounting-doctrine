# Implementation Backlog

Prepared: 2026-05-15
Source: `.codex-report-v2-extract.md`

## Priority Backlog

| ID | Priority | Task | Owner role | Evidence |
|---|---|---|---|---|
| S90-001 | P0 | Add validation harness and local command. | Tooling owner | Saved validation report. |
| S90-002 | P0 | Add reference manifest and classify all missing references. | Doctrine owner | Manifest shows no undeclared missing release-required files. |
| S90-003 | P0 | Fix mojibake in README, docs, and skill files. | Doctrine maintainer | Mojibake scan clean. |
| S90-004 | P0 | Fix `integration/mirror.ps1` default master path and dry-run log. | Tooling owner | Dry-run from repo root succeeds. |
| S90-005 | P0 | Add source-register schema. | Tax/tooling owner | Schema validates. |
| S90-006 | P0 | Add Uganda source-register seed pack. | Tax reviewer | Entries have state, source, verifier, recheck date. |
| S90-007 | P0 | Add stale-source and missing-source blocker tests. | Tooling owner | Test fixture fails as expected. |
| S90-008 | P1 | Add IFRS 18 transition reference. | IFRS reviewer | Fixture and reviewer note. |
| S90-009 | P1 | Add IFRS for SMEs third edition transition reference. | IFRS reviewer | Fixture and reviewer note. |
| S90-010 | P1 | Add standards-transition decision tree. | Doctrine owner | 2026 and 2027 basis fixtures. |
| S90-011 | P1 | Add `ledger-posting-engine-core`. | Accounting systems architect | Skill plus fixtures. |
| S90-012 | P1 | Add inventory costing skill. | Accounting specialist | Inventory fixtures. |
| S90-013 | P1 | Add fixed assets skill. | Accounting specialist | Asset fixtures. |
| S90-014 | P1 | Add payroll statutory postings skill. | Payroll/tax reviewer | Payroll fixtures. |
| S90-015 | P1 | Add consolidation/intercompany skill. | Reporting specialist | Group pack fixture. |
| S90-016 | P1 | Add engagement quality and plain-language output skill. | Delivery lead | Reviewer matrix and template. |
| S90-017 | P2 | Normalize all existing skills to Inputs/Outputs contract. | Doctrine maintainer | Composition validator pass. |
| S90-018 | P2 | Build audit-export sample bundle. | Reporting owner | Sample pack with hashes and sign-offs. |
| S90-019 | P2 | Add country skeletons for Kenya, Rwanda, Tanzania, and South Africa. | Tax reviewer | Skeletons block final rates. |
| S90-020 | P2 | Update consumer-engine integration documentation. | Integration owner | Release ledger and mirror documentation. |

## Current Burn-Down Status

After the 2026-05-15 implementation pass:

- `S90-001` through `S90-005` are implemented and validator-backed.
- `S90-006` is partially implemented: the Uganda source-register pack exists and the NSSF mandatory-contribution entry is verified-current; VAT, PAYE, WHT, income-tax, EFRIS, and exchange-rate entries remain draft.
- `S90-007` is implemented through source-register validation and quality-gate fixtures.
- `S90-008` through `S90-017` are implemented and validator-backed, pending human reviewer sign-off.
- `S90-018` is implemented as a sample evidence bundle and quality-gate fixture set; sample values and release hashes still need release-specific review.
- `S90-019` is implemented as draft/skeleton country packs that block final rates until verified.
- `S90-020` is implemented to the dry-run evidence level; actual consumer-engine mirroring remains a release action.

## Backlog Burn-Down Rule

An item can move from backlog to closure only when its evidence exists and is referenced from the release manifest. For example, `S90-018` can be marked complete when the audit-export sample is inspectable, has report placeholders, ledger CSV headers, sign-off templates, and hash instructions. It still requires sample values and real hashes before it can support a client release.
