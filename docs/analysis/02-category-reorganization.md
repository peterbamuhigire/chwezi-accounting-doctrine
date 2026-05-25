# Category Reorganization

The flat 25-skill catalogue under `skills/` has been re-organised into 17 numbered category folders. The numbering reflects dependency order: foundations first, then standards, then operating sub-processes, then close/reporting, then specialised pillars, then cross-cutting concerns (UX, AI/automation).

## Why 17, not 7 or 30

Three constraints shaped the choice:

1. **Reviewer ownership.** Each category needs a single named reviewer role (IFRS, tax, controls, treasury, sector specialist, etc.). Too few categories overload one reviewer; too many splinter ownership.
2. **Trigger granularity for consumer engines.** Each consumer engine's `CLAUDE.md` and `AGENTS.md` finance trigger block loads doctrine on detected scope. Categories must be coarse enough that a trigger lights up at most a handful, and fine enough that loading a category does not pull in unrelated noise.
3. **IFRS taxonomy.** IFRS itself groups standards into "high-frequency" recognition-and-measurement standards and "specialised / judgement-heavy" standards. Splitting category 02 from 03 mirrors this.

## The 17 categories

| # | Category | Theme | Existing skills moved here | Gap skills closed |
|---:|---|---|---:|---:|
| 01 | `01-foundations` | Ledger spine, CoA, dimensions, period state, currency | 2 | 3 |
| 02 | `02-ifrs-core-standards` | High-frequency IFRS / IFRS for SMEs | 4 | 5 |
| 03 | `03-ifrs-specialised-standards` | Specialised / judgement-heavy IFRS / IAS | 5 | 13 |
| 04 | `04-subledgers-and-operations` | Bank, momo, inventory, fixed assets, payroll, petty cash, POS, expenses | 4 | 3 |
| 05 | `05-receivables-payables-and-treasury` | AR, AP, treasury, FX, facilities | 0 | 5 |
| 06 | `06-close-consolidation-and-reporting` | Close, migration, consolidation, audit pack, finance-module audit | 5 | 2 |
| 07 | `07-financial-statements-and-disclosures` | Primary statements, cash-flow statement, notes, going concern, S1/S2 | 0 | 5 |
| 08 | `08-tax-and-statutory` | Source register, VAT/WHT mechanics, transfer pricing, e-invoicing | 1 | 4 |
| 09 | `09-budgeting-fpa-and-costing` | Budgets, forecasts, variance, KPI, costing methods, scenarios, pricing | 0 | 5 |
| 10 | `10-controls-governance-and-fraud` | Internal controls, engagement quality, anti-fraud, AML, whistleblowing, SOX-style ICFR, doctrine conformance scanning | 2 | 4 |
| 11 | `11-sector-and-fund-accounting` | NGO, schools, clinics, retail, agribusiness, hospitality, real estate, fintech | 0 | 8 |
| 12 | `12-public-sector-and-ipsas` | IPSAS overlay, public procurement, donor fiscal compliance | 0 | 3 |
| 13 | `13-project-and-contract-accounting` | POC/WIP, construction, professional services | 0 | 3 |
| 14 | `14-systems-integration-and-data` | ERP integration, bank feeds, data contracts, open banking | 0 | 4 |
| 15 | `15-security-privacy-and-continuity` | Privacy and retention, cybersecurity, BCP/DR | 0 | 3 |
| 16 | `16-ux-and-presentation` | UI pattern library, non-accountant UX, accessibility, mobile/offline | 2 | 2 |
| 17 | `17-ai-automation-and-emerging` | AI governance, RPA, digital assets, carbon | 0 | 4 |
| — | **Total** | — | **25** | **76** |

The category table records the 76 original gap skills closed in the hardening pass. The additional `finance-doctrine-conformance-scanner` skill was added as a new facility after gap closure, bringing the total catalogue to 102 active skills.

## Migration of the existing 25 skills

| Old path | New path |
|---|---|
| `skills/ledger-posting-engine-core/` | `skills/01-foundations/ledger-posting-engine-core/` |
| `skills/management-accounting-dimensions/` | `skills/01-foundations/management-accounting-dimensions/` |
| `skills/ifrs-revenue-recognition/` | `skills/02-ifrs-core-standards/ifrs-revenue-recognition/` |
| `skills/ifrs-leases/` | `skills/02-ifrs-core-standards/ifrs-leases/` |
| `skills/ifrs-financial-instruments/` | `skills/02-ifrs-core-standards/ifrs-financial-instruments/` |
| `skills/ifrs-for-smes-equivalents/` | `skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/` |
| `skills/ias-agriculture/` | `skills/03-ifrs-specialised-standards/ias-agriculture/` |
| `skills/ias-government-grants/` | `skills/03-ifrs-specialised-standards/ias-government-grants/` |
| `skills/ias-impairment/` | `skills/03-ifrs-specialised-standards/ias-impairment/` |
| `skills/ias-income-tax-deferred-tax/` | `skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/` |
| `skills/ias-provisions-contingencies/` | `skills/03-ifrs-specialised-standards/ias-provisions-contingencies/` |
| `skills/bank-and-mobile-money-reconciliation/` | `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/` |
| `skills/fixed-assets-and-depreciation/` | `skills/04-subledgers-and-operations/fixed-assets-and-depreciation/` |
| `skills/inventory-costing-and-stock-accounting/` | `skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/` |
| `skills/payroll-and-statutory-postings-east-africa/` | `skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/` |
| `skills/month-end-and-year-end-close-playbook/` | `skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/` |
| `skills/opening-balances-and-migration-playbook/` | `skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/` |
| `skills/consolidation-and-intercompany/` | `skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/` |
| `skills/audit-ready-reporting-pack/` | `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/` |
| `skills/finance-module-audit/` | `skills/06-close-consolidation-and-reporting/finance-module-audit/` |
| `skills/tax-statutory-source-register-and-country-packs/` | `skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/` |
| `skills/internal-controls-library/` | `skills/10-controls-governance-and-fraud/internal-controls-library/` |
| `skills/engagement-quality-and-plain-language-output/` | `skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/` |
| `skills/finance-ui-pattern-library/` | `skills/16-ux-and-presentation/finance-ui-pattern-library/` |
| `skills/finance-ux-for-non-accountants/` | `skills/16-ux-and-presentation/finance-ux-for-non-accountants/` |

All moves were performed with `git mv` so git history is preserved.

## Tooling, manifest, and consumer-engine impact

| Touchpoint | Change |
|---|---|
| `tools/check-skill-contracts.ps1` | Recursive skill discovery; category folders recognised; 25-skill cap lifted to advisory 120 (caveat, not blocker). |
| `tools/validate-doctrine.ps1` | No change required. Result after reorg: `pass` with zero findings. |
| `integration/mirror.ps1` | No change required. The script copies `skills/` recursively with robocopy `/E`, so the new category structure mirrors unchanged. |
| `docs/reference-manifest.md` | All 25 skill paths and their declared references updated to category-nested form. |
| `docs/quality-gate-fixture-map.md` | Path columns updated for the 6 rows referencing skill paths. |
| `docs/fin-analysis/07-standards-and-source-references.md`, `08-target-90-evidence-package.md` | Path columns updated. |
| `doctrine/references/ledger-invariants.md` | Cross-reference to `internal-controls-library` updated. |
| `governance/how-to-reference-this-doctrine.md` | Narrative references updated where category-coupled. |
| `README.md` | Tree diagram replaced with the 17-category structure. |

## What this does *not* change

- The doctrine version (`accounting-finance-doctrine.md`) is unchanged. A minor version bump is appropriate at the next release cut to record the structural change.
- The mirrored finance-skills path under each consumer engine (`skills/finance/` or `skills/` for web-dev) is unchanged. Consumer-engine code that loads a specific skill by name will continue to work after the next mirror because the SKILL.md filenames are unchanged; only the *path to the SKILL.md* changed. Consumer-engine triggers that hard-code old paths will need to be updated when the consumer engine is next touched.
- No content was lost. Every existing reference, example, and SKILL.md body is intact at its new location.

Last reviewed: 2026-05-25. Next review due: 2026-08-25.
