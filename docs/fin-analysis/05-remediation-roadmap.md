# Remediation Roadmap

## Phase 1: Stabilize The Doctrine Package

Target duration: 1 to 2 weeks.
Target score after phase: **80 / 100**.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Fix mojibake and encoding artifacts | Doctrine maintainer | Scan returns no corrupted glyphs. |
| Fix mirror source path | Tooling owner | `integration/mirror.ps1 -DryRun` works from repo root. |
| Add reference manifest | Doctrine maintainer | Every declared reference is present/planned/external/deprecated. |
| Add validation harness | Tooling owner | Validator runs locally and emits structured pass/fail output. |
| Add quality-gate fixture map | Finance reviewer + engineer | Every blocker maps to at least one fixture/check. |

## Phase 2: Build Missing Core Skills

Target duration: 2 to 4 weeks.
Target score after phase: **86 / 100**.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Add `ledger-posting-engine-core` | Accounting systems architect | Service contract, schema contract, event map, posting fixtures, invariant tests. |
| Add `tax-statutory-source-register-and-country-packs` | Tax reviewer + doctrine owner | Source-register schema and Uganda draft pack. |
| Add `inventory-costing-and-stock-accounting` | Inventory/accounting specialist | FIFO/weighted-average fixtures, NRV tests, stock variance postings. |
| Add `fixed-assets-and-depreciation` | Accounting specialist | Asset lifecycle examples, depreciation fixtures, disposal journals. |
| Add `payroll-and-statutory-postings-east-africa` | Payroll/tax reviewer | Payroll-to-GL examples and statutory verification rules. |
| Add `consolidation-and-intercompany` | Financial reporting specialist | Elimination journals, intercompany matching, group pack skeleton. |
| Add `engagement-quality-and-plain-language-output` | Delivery lead | Reviewer roles, client explanation pattern, professional caveats. |

## Phase 3: Standards And Country Updates

Target duration: 2 to 6 weeks.
Target score after phase: **91 / 100**.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| IFRS for SMEs third edition transition | IFRS reviewer | Transition reference with effective date and affected sections. |
| IFRS 18 transition | IFRS reviewer | Reporting templates and quality-gate checks updated. |
| Uganda statutory pack | Tax reviewer | URA/NSSF/BoU/ICPAU source-register entries with state and expiry. |
| Kenya pack skeleton | Tax reviewer | KRA/eTIMS/CBK/ICPAK source hierarchy and draft register. |
| Country-pack validator | Tooling owner | Missing final rates block final output. |

## Phase 4: Productize For Premium Client Work

Target duration: ongoing.
Target score after phase: **95+ / 100**.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Auditor export sample bundle | Reporting owner | Sample export with index, hashes, reports, source docs, audit log. |
| Proposal/SRS/business-plan templates | Delivery lead | Templates consume doctrine and show caveats plainly. |
| Client assurance pack | Delivery lead | Executive summary, scope, assumptions, evidence, sign-offs, residual risk. |
| Training examples | Doctrine owner | Examples for owner-manager, cashier, accountant, auditor. |

## Report-V2 Release Evidence Track

The report-v2 uplift narrows the immediate release-evidence work to:

| Work item | Evidence now expected |
|---|---|
| Target 90+ evidence package | `docs/fin-analysis/08-target-90-evidence-package.md`. |
| Finding closure matrix | `docs/fin-analysis/09-finding-closure-matrix.md`. |
| Implementation backlog | `docs/fin-analysis/10-implementation-backlog.md`. |
| Definition of done and re-score narrative | `docs/fin-analysis/11-definition-of-done-and-rescore.md`. |
| Release manifest | `docs/release-manifest-template.yaml`, completed per release. |
| Audit export sample | `docs/audit-export-sample/` skeleton, later populated with sample values and hashes. |

This track supports re-score preparation. It does not remove the need for the Phase 1 to Phase 3 implementation work.
