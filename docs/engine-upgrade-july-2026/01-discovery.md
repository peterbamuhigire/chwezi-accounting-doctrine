# Discovery

Engine root: `C:\wamp64\www\chwezi-accounting-doctrine`
Discovery date: 2026-07-07

## What Was Read

I read the root router/controller files where present (`README.md`, `AGENTS.md`, `CLAUDE.md`) and read every discovered `SKILL.md` file in full. I also read every Markdown file matching governance, doctrine, standard, quality, anti-slop, architecture, router, guide, index, policy, protocol, or changelog naming patterns into the audit manifest. The full content inventory is in `10-appendix-file-inventory.md`.

## Tree Metrics

| Metric | Value |
| --- | --- |
| Files | 585 |
| Directories | 347 |
| Maximum directory depth | 5 |
| Total content size | 2.02 MB |
| SKILL.md files | 102 |
| Governance/doctrine/standard files read | 231 |

## Unusual Findings

- Frontmatter gaps: 76 missing name, 76 missing description.

## Architecture Map

This engine claims to be the canonical Chwezi Core Systems accounting and finance doctrine source for bookkeeping, IFRS/IAS, IFRS for SMEs, tax/statutory work, controls, close, consolidation, reporting, finance UX, and sector accounting. A world-class deliverable looks like IFRS-for-SMEs-compliant statutory-grade output from a Big 4 finance transformation team: technically accurate, jurisdiction-aware, control-tested, audit-evidenced, and clear enough for operators. Benchmark: IFRS Foundation/IFRS for SMEs technical compliance, Big 4 audit-ready working papers, and controller-grade finance operating manuals.

The engine is organized as a hierarchical skill engine with filesystem-discovered `SKILL.md` entrypoints, router/controller Markdown at the root, and supporting assets in references, templates, scripts, examples, docs, projects, fonts, or tools depending on the engine. The architecture is strongest where routers tell the agent to glob `SKILL.md` fresh and weakest where empty directories, local project workspaces, or missing frontmatter create false surfaces.

## Asset Catalogue

| Extension/type | Count |
| --- | --- |
| .md | 555 |
| .yaml | 12 |
| .ps1 | 9 |
| .csv | 3 |
| .json | 1 |
| .retired | 1 |
| .sql | 1 |
| .txt | 1 |
| .yml | 1 |
| [no extension] | 1 |

Supporting asset counts from path classification: references=243, templates=0, examples=133, scripts/script-like=9.

## Skill Frontmatter Quotation

The table quotes the discovered `name` and `description` frontmatter values. `[MISSING]` means the field was not present in the file frontmatter.

| Skill path | name | description |
| --- | --- | --- |
| skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/01-foundations/functional-and-presentation-currency/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/01-foundations/ledger-posting-engine-core/SKILL.md | name: ledger-posting-engine-core | description: Use when designing, reviewing, or testing the canonical posting service, journal-entry schema, event-to-journal mapping, ledger invariants, reversals, idempotency, period locks, control-account tie-outs, and drilldown from source evidence to financial reports. |
| skills/01-foundations/management-accounting-dimensions/SKILL.md | name: management-accounting-dimensions | description: Governed dimensions (cost centre, project, grant, donor restriction, department, branch, product line, customer, supplier, activity, currency, book) and the budget / variance / allocation / contribution-margin / donor-grant reporting they support. Use when designing or implementing management reporting, KPI dashboards, budget vs actual, project profitability, grant utilisation, contribution-margin analysis, or allocation rules. Applies in software, SRS, SDS, test plan, proposal, and business-plan contexts. |
| skills/01-foundations/period-locking-and-data-immutability/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md | name: ifrs-financial-instruments | description: Financial-instrument classification, measurement, and impairment under IFRS 9 (full IFRS) and Sections 11 and 12 (IFRS for SMEs). Trade receivables, payables, bank balances, loans, deposits, debt and equity instruments, derivatives, expected credit loss (ECL), hedge accounting. Use when financial instruments are material. Tier-3 scope — Section 11 basic-instruments handling is built first; full IFRS 9 ECL deferred until a client materially requires it. |
| skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/SKILL.md | name: ifrs-for-smes-equivalents | description: Practical IFRS for SMEs equivalents to full IFRS standards. The default reporting framework for typical Chwezi clients (SMEs, schools, clinics, NGOs, retail, agribusiness, hospitality, family business). Cross-references each IFRS standard to its IFRS for SMEs section and notes the build implications. Use whenever generating finance content for SME clients, or when deciding whether full IFRS or IFRS for SMEs applies. |
| skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-leases/SKILL.md | name: ifrs-leases | description: Lease accounting under IFRS 16 (full IFRS) and Section 20 (IFRS for SMEs). Lessee single on-balance-sheet model under IFRS 16; lessee operating-vs-finance classification under Section 20. Short-term and low-value exemptions. Lessor classification. Sale-and-leaseback. Use when leases or rental arrangements are in scope. Tier-3 scope — full lessee build deferred until a client materially requires it; Section 20 short-term operating-lease handling and IFRS 16 exemption-test reference are built first. |
| skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md | name: ifrs-revenue-recognition | description: IFRS 15 (full IFRS) and Section 23 (IFRS for SMEs) revenue recognition for Chwezi systems. Covers contract identification, performance obligations, transaction price, allocation, timing of recognition, contract assets and liabilities, refunds, warranties, principal-vs-agent, and disclosures. Use when revenue, sales contracts, subscription billing, multi-element arrangements, deferred revenue, retention, percentage of completion, agency fees, or revenue disclosures are in scope. |
| skills/03-ifrs-specialised-standards/ias-agriculture/SKILL.md | name: ias-agriculture | description: Agriculture and biological-asset accounting under IAS 41 (full IFRS) and Section 34 (IFRS for SMEs). Recognition, measurement at fair value less costs to sell where reliably measurable, point-of-harvest treatment, bearer biological assets, government grants in agriculture, cost-model fallback, sector-specific build implications for BIRDC, agribusinesses, poultry, dairy, horticulture, plantation, and aquaculture. Use whenever biological assets, agricultural produce, or sector operations like BIRDC, dynagricug, or other Chwezi agribusiness clients are in scope. |
| skills/03-ifrs-specialised-standards/ias-government-grants/SKILL.md | name: ias-government-grants | description: Government grants and assistance under IAS 20 (full IFRS) and Section 24 (IFRS for SMEs). Recognition, measurement, presentation (gross vs net), conditions, repayable assistance, donor restrictions for NGOs, grant utilisation reporting. Use when government or donor grants are in scope, especially for NGOs, schools, agribusiness, and projects under restricted funding. |
| skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md | name: ias-impairment | description: Impairment of non-financial assets under IAS 36 (full IFRS) and Section 27 (IFRS for SMEs). Indicator-based testing, recoverable amount (higher of fair value less costs of disposal and value in use), cash-generating units, goodwill impairment, reversal. Use when material PPE, intangibles, goodwill, or investment property carrying amounts could be impaired. Tier-3 scope — indicator-based reference built first; full annual-test machinery deferred until a goodwill-heavy or asset-intensive client demands it. |
| skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/SKILL.md | name: ias-income-tax-deferred-tax | description: Income tax accounting under IFRS for SMEs Section 29 (practical default) and IAS 12 (full IFRS overlay). Current tax, deferred tax, temporary differences, recognition of deferred-tax assets, valuation allowance, tax-rate reconciliation, presentation. Use when corporate income tax, deferred tax, tax expense disclosure, or tax-rate reconciliation is in scope. |
| skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md | name: ias-provisions-contingencies | description: Provisions, contingent liabilities and contingent assets under IAS 37 (full IFRS) and Section 21 (IFRS for SMEs). Recognition criteria (present obligation, probable outflow, reliable estimate), measurement, onerous contracts, restructuring, warranties, contingent disclosures. Use when provisions, litigation, warranties, onerous contracts, restructuring, decommissioning, or guarantee disclosures are in scope. |
| skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/SKILL.md | name: bank-and-mobile-money-reconciliation | description: Bank-account, mobile-money (MTN MoMo, Airtel Money, equivalents), POS cash drawer, card settlement, and clearing-account reconciliation workflow design and implementation. Use whenever a software system, SRS, SDS, test plan, proposal, business plan, or strategy involves bank feeds, mobile-money statements, POS Z-reports, settlements, chargebacks, reversals, bank charges, unmatched deposits, or month-end reconciliation evidence packs. |
| skills/04-subledgers-and-operations/expense-management-and-staff-claims/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/04-subledgers-and-operations/fixed-assets-and-depreciation/SKILL.md | name: fixed-assets-and-depreciation | description: Use when designing, reviewing, or testing fixed-asset registers, capitalization policy, componentization, depreciation, useful-life review, disposals, revaluation caveats, impairment indicators, tax depreciation caveats, and asset-register to GL tie-outs. |
| skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/SKILL.md | name: inventory-costing-and-stock-accounting | description: Use when designing, reviewing, or testing stock accounting, SKU and location policy, FIFO or weighted-average costing, stock counts, shrinkage, wastage, expiry, NRV write-downs, COGS postings, and inventory control-account tie-outs. |
| skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/SKILL.md | name: payroll-and-statutory-postings-east-africa | description: Use when designing, reviewing, or testing gross-to-net payroll, PAYE, NSSF, LST, WHT, payroll clearing, employer and employee contribution splits, payslip-to-GL reconciliation, and statutory source gates for East Africa country packs. |
| skills/04-subledgers-and-operations/petty-cash-and-imprest-management/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/04-subledgers-and-operations/pos-and-cash-drawer-management/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/05-receivables-payables-and-treasury/fx-management-and-hedging/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md | name: audit-ready-reporting-pack | description: The audit-ready reporting pack standard for any Chwezi-grade entity. Defines the minimum reports, their content, the drilldown chain, the auditor-export index, the print fidelity, the sign-off, and the release governance. Use whenever a software system, SRS, SDS, test plan, proposal, or business plan involves financial statement preparation, monthly management accounts, donor reports, statutory reports, audit-ready exports, or external audit support. |
| skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/SKILL.md | name: consolidation-and-intercompany | description: Use when designing, reviewing, or testing group reporting, entity hierarchy, reporting currency, intercompany matching, elimination journals, group trial balances, non-controlling interest caveats, and foreign-operation translation caveats. |
| skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md | name: finance-module-audit | description: >- Use when auditing any software, SRS, proposal, POS, ERP, SaaS, mobile app, or workflow that touches money, billing, payments, tax, payroll, banking, mobile money, inventory, statutory compliance, financial reports, or accounting records. |
| skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/SKILL.md | name: month-end-and-year-end-close-playbook | description: Controlled month-end and year-end close workflow for any Chwezi-grade finance / accounting system. Covers task list, dependencies, evidence requirements, exception handling, reviewer sign-off, period-state transitions, retained-earnings close, lock and reopen governance, and release states. Use whenever a software system, SRS, SDS, test plan, proposal, or business plan touches month-end close, year-end close, period locking, or audit-period release. |
| skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/SKILL.md | name: opening-balances-and-migration-playbook | description: Cutover from legacy Excel / QuickBooks / Tally / Sage / POS / manual systems into Chwezi. Defines the conversion-date model, CoA mapping, opening trial balance, opening subledgers (AR / AP / Inventory / Fixed Assets / Payroll / Tax), bank / mobile-money / cash opening balances, migration suspense, reviewer sign-off, and acceptance evidence. Use whenever a software system, SRS, SDS, test plan, proposal, or business plan involves data migration, cutover, opening balances, or legacy-system replacement. |
| skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/07-financial-statements-and-disclosures/financial-statements-preparation/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/08-tax-and-statutory/indirect-tax-vat-mechanics/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md | name: tax-statutory-source-register-and-country-packs | description: Use when designing, reviewing, or validating tax, payroll, statutory, e-invoicing, exchange-rate, source-register, and country-pack behavior for Uganda, Kenya, Rwanda, Tanzania, South Africa, or future Chwezi country extensions. |
| skills/08-tax-and-statutory/transfer-pricing-documentation/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/08-tax-and-statutory/withholding-tax-and-treaties/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/09-budgeting-fpa-and-costing/cost-accounting-methods/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/SKILL.md | name: engagement-quality-and-plain-language-output | description: Use when preparing, reviewing, or approving client-facing finance outputs that need preparer-reviewer-approver governance, competence and independence checks, ethics caveats, assurance-quality gates, and mandatory business-language, accounting-policy, and evidence/caveat layers. |
| skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md | name: finance-doctrine-conformance-scanner | description: Use when scanning a software system, codebase, implementation plan, proposal, policy memo, business plan, blog post, SRS, or finance/accounting product specification against the Chwezi accounting and finance doctrine. Produces a deep gap analysis, risk-ranked findings, and detailed alignment instructions tied to the doctrine skills and source-register rules. |
| skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/10-controls-governance-and-fraud/internal-controls-library/SKILL.md | name: internal-controls-library | description: Library of internal controls embedded in finance / accounting workflows. Segregation of duties, maker-checker, approval thresholds, supplier and payroll master-data controls, petty cash and cash drawer controls, inventory master-data controls, tax / rate table controls, audit-log review, exception monitoring, fraud / error indicators. Use whenever designing or reviewing access control, approval, audit trail, fraud detection, or internal-control attestation in a finance / accounting context. |
| skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/fintech-and-payments-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/real-estate-and-property-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/13-project-and-contract-accounting/construction-contract-accounting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/13-project-and-contract-accounting/professional-services-time-and-materials/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/13-project-and-contract-accounting/project-and-contract-accounting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/16-ux-and-presentation/finance-ui-pattern-library/SKILL.md | name: finance-ui-pattern-library | description: Production UI patterns, design tokens, role-conditioned shells, drilldown primitives, reconciliation triage layout, print stylesheet patterns, status taxonomy components, and money-cell components for Chwezi finance and accounting products. Use when designing or building any finance / accounting screen, dashboard, report, print layout, mobile cashier flow, accountant ledger surface, reconciliation UI, close board, return-pack viewer, or audit-ready export across any consumer engine. Auto-load when the user requests UI / UX work that touches money, inventory, payroll, tax, banking, mobile money, POS, statutory compliance, or accounting records. |
| skills/16-ux-and-presentation/finance-ux-for-non-accountants/SKILL.md | name: finance-ux-for-non-accountants | description: Workflow-first UX for cashiers, clerks, managers, family-business users, and other non-accountants who must record sales, receive payments, buy stock, pay suppliers, run payroll, close drawers, and resolve exceptions safely while the underlying accounting stays clean. Use when designing any non-accountant-facing finance / accounting UI in a Chwezi product. Pairs with finance-ui-pattern-library, which provides the components and tokens. |
| skills/17-ai-automation-and-emerging/ai-in-finance-governance/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/SKILL.md | name: [MISSING] | description: [MISSING] |
| skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/SKILL.md | name: [MISSING] | description: [MISSING] |

## Governance/Doctrine/Standard Files Read

| Path | Lines | SHA-256 prefix | First heading |
| --- | --- | --- | --- |
| README.md | 156 | 6a87869112ca | Chwezi Accounting & Finance Doctrine |
| docs/quality-gate-fixture-map.md | 61 | e1828ee2c8b5 | Coverage Summary |
| docs/analysis/00-index.md | 37 | 77e00313d128 | Chwezi Accounting Doctrine — Reorganization and Gap Analysis |
| docs/audit-export-sample/00-index.md | 35 | a35794255f91 | Audit Export Sample Index |
| docs/audit-export-sample/evidence/bank-statements/README.md | 8 | f1a5be5fd36a | Bank Statement Evidence Placeholder |
| docs/audit-export-sample/evidence/invoices/README.md | 17 | 27588c3662bf | Invoice Evidence Placeholder |
| docs/audit-export-sample/evidence/receipts/README.md | 8 | 51aa27af3432 | Receipt Evidence Placeholder |
| docs/audit-export-sample/hashes/README.md | 22 | 116b6cd22e3d | Hashes README |
| docs/fin-analysis/00-index.md | 54 | 456d3a5d4daf | Finance Analysis Report Pack |
| docs/fin-analysis/06-implementation-standards-and-snippets.md | 98 | c921ae60fd1b | Implementation Standards And Snippets |
| docs/fin-analysis/07-standards-and-source-references.md | 50 | ea588a9b67e8 | Standards Posture |
| docs/quality-gate-fixtures/control-account-tieout-fixture.md | 37 | 0ff3cc541181 | Control Account Tie-Out Fixture |
| docs/quality-gate-fixtures/framework-selection-checks.md | 106 | f0e9372c23b3 | Framework Selection Checks |
| docs/quality-gate-fixtures/journal-balance-and-audit-fixtures.md | 68 | 08353229778b | Journal Balance And Audit Fixtures |
| docs/quality-gate-fixtures/ledger-boundary-and-lock-fixtures.md | 62 | 8e69b57741ca | Ledger Boundary And Lock Fixtures |
| docs/quality-gate-fixtures/migration-cutover-fixtures.md | 93 | b0291162439f | Migration Cutover Fixtures |
| docs/quality-gate-fixtures/reconciliation-triage-fixture.md | 47 | 886d3f7b49fb | Reconciliation Triage Fixture |
| docs/quality-gate-fixtures/return-template-version-check.md | 36 | 9ffe786f6c1c | Return Template Version Check |
| docs/quality-gate-fixtures/reviewer-signoff-fixtures.md | 67 | 40ed852aca23 | Reviewer Sign-Off Fixtures |
| docs/quality-gate-fixtures/unsupported-costing-method-rejection.md | 34 | 07b9e9b082ab | Unsupported Costing Method Rejection |
| docs/quality-gate-fixtures/source-register-evidence/uganda-nssf-membership-2026-05-15.md | 28 | a759606bdd4d | Uganda NSSF Membership Evidence |
| doctrine/accounting-finance-doctrine.md | 163 | 5b302d12fe94 | Chwezi Accounting & Finance Doctrine |
| doctrine/examples/coa-seed-uganda-sme.md | 157 | 67c16cafc9d2 | Seed CoA — Uganda SME (Limited Company) |
| doctrine/examples/reconciliation-evidence-pack.md | 104 | b85fa0a71c25 | Worked Example — Reconciliation Evidence Pack |
| doctrine/examples/reporting-basis-2026.md | 54 | d7dc05a81a31 | Reporting Basis Fixture - 2026 Baseline |
| doctrine/examples/reporting-basis-2027-ifrs18.md | 54 | 08d2d2bc2ae0 | Reporting Basis Fixture - 2027 Full IFRS With IFRS 18 Transition |
| doctrine/examples/reporting-basis-2027-smes-third-edition.md | 53 | 9147ab921416 | Reporting Basis Fixture - 2027 IFRS for SMEs Third Edition Transition |
| doctrine/examples/reversal-pattern.md | 91 | 87641343fc87 | Worked Example — Reversal Pattern |
| doctrine/examples/vat-inclusive-posting.md | 87 | c46cc4f79ff4 | Worked Example — VAT-Inclusive Posting |
| doctrine/references/chart-of-accounts.md | 121 | 1a08f9a52bb7 | Chart of Accounts Backbone |
| doctrine/references/country-extension-framework.md | 53 | 84f2b3711811 | Country Extension Framework |
| doctrine/references/design-anti-patterns.md | 125 | a8a0ae0ba635 | Design Anti-Patterns |
| doctrine/references/design-system-finance-accounting.md | 173 | a79089d04907 | Design System — Finance & Accounting UI |
| doctrine/references/forbidden-patterns.md | 84 | b0f2835b1665 | Forbidden Patterns |
| doctrine/references/full-ifrs-overlay.md | 77 | 288b85415dfe | Full IFRS Overlay |
| doctrine/references/ifrs-18-presentation-transition.md | 55 | eebe4fc56115 | IFRS 18 Presentation Transition |
| doctrine/references/ifrs-for-smes-default.md | 81 | 479f00cf96e3 | IFRS for SMEs — Practical Default |
| doctrine/references/ifrs-for-smes-third-edition-transition.md | 55 | 82286b540cfb | IFRS for SMEs Third Edition Transition |
| doctrine/references/ledger-invariants.md | 101 | 95de18568d11 | 1. Posting boundary |
| doctrine/references/live-rate-verification-protocol.md | 113 | 69bcf5f75c16 | Live-Rate Verification Protocol |
| doctrine/references/policy-hierarchy.md | 60 | 5dcb924b0bd9 | Policy Hierarchy |
| doctrine/references/print-fidelity.md | 71 | 30dc91e1aac1 | Print Fidelity |
| doctrine/references/required-patterns.md | 98 | 4326f5bedeed | Required Patterns |
| doctrine/references/requirement-id-library.md | 84 | 73ebf45e8704 | Finance Requirement-ID Library |
| doctrine/references/role-conditioned-shell.md | 82 | 6ae6f6fdca79 | Role-Conditioned Shell |
| doctrine/references/standards-transition-2027.md | 91 | acfdc816d11b | Standards Transition 2027 |
| doctrine/references/status-taxonomy.md | 66 | f7c8b2ecb35c | Status Taxonomy |
| doctrine/references/tax-vat-and-returns.md | 95 | a7c1b7a70e22 | Tax, VAT-Inclusive Posting, and Return-Ready Packs |
| doctrine/references/terminology-glossary.md | 56 | baea39e39512 | Terminology Glossary |
| doctrine/references/uganda-compliance-caveats.md | 82 | f3dc041a048e | Uganda Compliance Caveats |
| doctrine/references/uganda-ngo-financial-management-patterns.md | 91 | bdb58975ee52 | Uganda NGO / CSO Financial-Management Patterns |
| doctrine/references/uganda-public-sector-pfm.md | 100 | 46757cbcccc3 | Uganda Public-Sector PFM Framework |
| doctrine/references/versioning-and-changelog.md | 64 | 2e37355c51fc | Versioning and Changelog |
| doctrine/source-register/README.md | 71 | a3514f084390 | Source Register |
| doctrine/source-register/kenya/README.md | 19 | bab9df6f8d6d | Kenya Source Register Skeleton |
| doctrine/source-register/rwanda/README.md | 19 | ec495e9e40fe | Rwanda Source Register Skeleton |
| doctrine/source-register/south-africa/README.md | 19 | 70f76e86bfda | South Africa Source Register Skeleton |
| doctrine/source-register/tanzania/README.md | 19 | 8341f27da6f1 | Tanzania Source Register Skeleton |
| doctrine/source-register/uganda/README.md | 25 | 52569303b180 | Uganda Source Register Seed Pack |
| governance/cleanup-backlog.md | 116 | 45ef9d14b8df | Cleanup Backlog |
| governance/finance-accounting-quality-gate.md | 179 | 394c6a3f83cd | Finance & Accounting Quality Gate |
| governance/how-to-reference-this-doctrine.md | 109 | d2753b583ff4 | Common Pattern Across All Four Engines |
| integration/changelog-entries.md | 131 | e1a0d9184edb | Changelog Entries |
| skills/01-foundations/README.md | 17 | 0c8a8ec14ae6 | Skills in this category |
| skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md | 123 | e1a8cd771378 | Chart Of Accounts Design And Governance |
| skills/01-foundations/chart-of-accounts-design-and-governance/examples/worked-example.md | 42 | 5ad44b74680c | Scenario |
| skills/01-foundations/chart-of-accounts-design-and-governance/references/implementation-rules.md | 49 | e1ceb030e4eb | Doctrine Boundary |
| skills/01-foundations/chart-of-accounts-design-and-governance/references/source-basis.md | 24 | e389c4bc82e9 | Evidence Discipline |
| skills/02-ifrs-core-standards/README.md | 21 | ae35e807ebe4 | Skills in this category |
| skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md | 123 | f5d2f19090ca | IFRS Borrowing Costs Ias23 |
| skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/examples/worked-example.md | 42 | 0f73b38a6eeb | Scenario |
| skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/references/implementation-rules.md | 49 | 305a41859dc9 | Doctrine Boundary |
| skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/references/source-basis.md | 26 | 1edc7c96a4ab | Evidence Discipline |
| skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/SKILL.md | 123 | b0c04ba36cf1 | IFRS Employee Benefits Ias19 |
| skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/examples/worked-example.md | 42 | a7d47e67d539 | Scenario |
| skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/references/implementation-rules.md | 49 | c9999bf39875 | Doctrine Boundary |
| skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/references/source-basis.md | 26 | e730ff54b87c | Evidence Discipline |
| skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md | 146 | 6a63a788713b | Financial Instruments (IFRS 9 / Sections 11 and 12) |
| skills/02-ifrs-core-standards/ifrs-financial-instruments/references/effective-interest-schedule.md | 35 | 539edb8bc83a | Effective-Interest Schedule |
| skills/02-ifrs-core-standards/ifrs-financial-instruments/references/ifrs-9-ecl-simplified-trade-receivables.md | 41 | b19df3951dd6 | IFRS 9 Simplified ECL for Trade Receivables |
| skills/02-ifrs-core-standards/ifrs-financial-instruments/references/section-11-impairment.md | 42 | f003a873a6e6 | Section 11 Impairment for Basic Financial Instruments |
| skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/SKILL.md | 155 | a4dfd6237551 | IFRS for SMEs Equivalents |
| skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/references/client-profile-decision-tree.md | 32 | 76bff8787abb | Client Profile Decision Tree |
| skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/references/full-ifrs-to-sme-mapping.md | 34 | d8cc768b681e | Full IFRS to IFRS for SMEs Mapping |
| skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/SKILL.md | 123 | 258c5a4b7d4c | IFRS Foreign Currency Translation Ias21 |
| skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/examples/worked-example.md | 42 | 0be25331b678 | Scenario |
| skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/references/implementation-rules.md | 49 | 2249643f2ba5 | Doctrine Boundary |
| skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/references/source-basis.md | 26 | 28e284efeaef | Evidence Discipline |
| skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/SKILL.md | 123 | a50951d80eda | IFRS Intangible Assets Ias38 |
| skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/examples/worked-example.md | 42 | c70b910ebc54 | Scenario |
| skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/references/implementation-rules.md | 49 | 2167b031f2f1 | Doctrine Boundary |
| skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/references/source-basis.md | 26 | b7279e322ce2 | Evidence Discipline |
| skills/02-ifrs-core-standards/ifrs-leases/SKILL.md | 134 | 5eae98309464 | Leases (IFRS 16 / Section 20) |
| skills/02-ifrs-core-standards/ifrs-leases/references/exemption-test.md | 37 | 8ee6ca249e7f | IFRS 16 Exemption Test |
| skills/02-ifrs-core-standards/ifrs-leases/references/full-ifrs-16-lessee-model.md | 47 | d6ce0547f68d | Full IFRS 16 Lessee Model |
| skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md | 123 | 041c17b6ef32 | IFRS Property Plant Equipment Ias16 |
| skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/examples/worked-example.md | 42 | 2a40d1d9ce50 | Scenario |
| skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/references/implementation-rules.md | 49 | 31c2d980586a | Doctrine Boundary |
| skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/references/source-basis.md | 26 | 63682a250283 | Evidence Discipline |
| skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md | 210 | 6cd07d54b6e5 | IFRS Revenue Recognition (IFRS 15 / Section 23) |
| skills/02-ifrs-core-standards/ifrs-revenue-recognition/examples/multi-element-software-licence-plus-support.md | 51 | ff0c32cdb71e | Example: Multi-Element Software Licence Plus Support |
| skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/ifrs-15-five-step.md | 47 | 26ea524ed028 | IFRS 15 Five-Step Model |
| skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/section-23-summary.md | 45 | 401c75142c5a | Section 23 Revenue Summary |
| skills/03-ifrs-specialised-standards/README.md | 30 | 01d11d23ba39 | Skills in this category |
| skills/03-ifrs-specialised-standards/ias-agriculture/SKILL.md | 217 | c7c32971989e | Agriculture (Section 34 / IAS 41) |
| skills/03-ifrs-specialised-standards/ias-agriculture/examples/birdc-layer-flock-q2-2026.md | 46 | fe95eb6417b1 | Example: BIRDC Layer Flock Q2 2026 |
| skills/03-ifrs-specialised-standards/ias-agriculture/references/cohort-data-model.md | 48 | 193d4bb8e3c1 | Biological-Asset Cohort Data Model |
| skills/03-ifrs-specialised-standards/ias-agriculture/references/fair-value-methodology.md | 48 | 890ae8cf19ef | Fair-Value Methodology for Biological Assets |
| skills/03-ifrs-specialised-standards/ias-government-grants/SKILL.md | 139 | cd44ecacecd8 | Government Grants and Donor Assistance (Section 24 / IAS 20) |
| skills/03-ifrs-specialised-standards/ias-government-grants/examples/ngo-restricted-grant-cycle.md | 41 | 8d5d0f646693 | Example: NGO Restricted Grant Cycle |
| skills/03-ifrs-specialised-standards/ias-government-grants/references/donor-restriction-pattern.md | 39 | d57b4e849027 | Donor Restriction Pattern |
| skills/03-ifrs-specialised-standards/ias-government-grants/references/grant-register-schema.md | 44 | 3657c0ff05f1 | Grant Register Schema |
| skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md | 150 | 175643abb943 | Impairment of Assets (IAS 36 / Section 27) |
| skills/03-ifrs-specialised-standards/ias-impairment/references/indicator-checklist.md | 37 | 7086e13d4303 | Impairment Indicator Checklist |
| skills/03-ifrs-specialised-standards/ias-impairment/references/value-in-use-workpaper-template.md | 50 | f1db0661815d | Value-in-Use Workpaper Template |
| skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/SKILL.md | 192 | ad17492967b5 | Income Tax and Deferred Tax (Section 29 / IAS 12) |
| skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/examples/sme-tax-provision-2026-04.md | 47 | a0227d0add5d | Example: SME Tax Provision April 2026 |
| skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/references/recognition-checklist.md | 37 | d8f1f4df5780 | Deferred-Tax Recognition Checklist |
| skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/references/temporary-difference-catalog.md | 35 | 981471d7d799 | Temporary-Difference Catalog |
| skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md | 142 | d7a2afb24109 | Provisions and Contingencies (Section 21 / IAS 37) |
| skills/03-ifrs-specialised-standards/ias-provisions-contingencies/references/onerous-contract-test.md | 38 | 74ca498a19a0 | Onerous Contract Test |
| skills/03-ifrs-specialised-standards/ias-provisions-contingencies/references/recognition-decision-tree.md | 33 | 4c64dc565e05 | Provision Recognition Decision Tree |
| skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md | 123 | 4e0192acbd71 | IFRS Accounting Policies Changes Errors Ias8 |
| skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/examples/worked-example.md | 42 | 008e6ce12466 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/references/implementation-rules.md | 49 | ec15b7bc7132 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/references/source-basis.md | 26 | 80d8ad7e4356 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/SKILL.md | 123 | fedd23fb7229 | IFRS Associates And Joint Arrangements |
| skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/examples/worked-example.md | 42 | 34c0eb219020 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/references/implementation-rules.md | 49 | 56076c172131 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/references/source-basis.md | 26 | 2ee6db2ee432 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/SKILL.md | 123 | 6001e20b3596 | IFRS Business Combinations Ifrs3 |
| skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/examples/worked-example.md | 42 | 2db7976bca52 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/references/implementation-rules.md | 49 | 229f83d946fd | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/references/source-basis.md | 26 | 99148227dddf | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/SKILL.md | 123 | 39396cfb88bf | IFRS Discontinued Operations Ifrs5 |
| skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/examples/worked-example.md | 42 | 25efe74cc371 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/references/implementation-rules.md | 49 | 79d4235595fd | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/references/source-basis.md | 26 | bd07827814ea | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/SKILL.md | 123 | e66352e35ef8 | IFRS Earnings Per Share Ias33 |
| skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/examples/worked-example.md | 42 | a4b0d1f4e6ab | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/references/implementation-rules.md | 49 | d7c972e5586c | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/references/source-basis.md | 26 | 7e1fa552a430 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md | 123 | 9383a071e22d | IFRS Events After Reporting Period Ias10 |
| skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/examples/worked-example.md | 42 | 1b87356aca89 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/references/implementation-rules.md | 49 | bac5d40b8e8a | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/references/source-basis.md | 26 | 96ac8b64d247 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md | 123 | 8fd0c3a247c9 | IFRS Fair Value Measurement Ifrs13 |
| skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/examples/worked-example.md | 42 | f18f36fd4596 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/references/implementation-rules.md | 49 | 4b44436aa707 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/references/source-basis.md | 26 | 379fda6b75dd | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/SKILL.md | 123 | d81b0c89994c | IFRS First Time Adoption Ifrs1 |
| skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/examples/worked-example.md | 42 | 9840ff273f31 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/references/implementation-rules.md | 49 | 482ce90e6b69 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/references/source-basis.md | 26 | 69143e5c8bf2 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/SKILL.md | 123 | 4db53c0c0e13 | IFRS Insurance Contracts Ifrs17 |
| skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/examples/worked-example.md | 42 | 1e78c4a37fad | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/references/implementation-rules.md | 49 | 01d75ba08216 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/references/source-basis.md | 26 | 9dc914082c88 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/SKILL.md | 123 | fa13abb60b36 | IFRS Investment Property Ias40 |
| skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/examples/worked-example.md | 42 | 6f7e96e700ee | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/references/implementation-rules.md | 49 | 237665fee4ff | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/references/source-basis.md | 26 | 8d0b13eae681 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/SKILL.md | 123 | 02e3a83ec580 | IFRS Related Party Disclosures Ias24 |
| skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/examples/worked-example.md | 42 | 15b190a415f4 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/references/implementation-rules.md | 49 | 2b4e4c289b88 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/references/source-basis.md | 26 | 216bc2eddd71 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/SKILL.md | 123 | 6d5963238228 | IFRS Segment Reporting Ifrs8 |
| skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/examples/worked-example.md | 42 | 8065aa27e974 | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/references/implementation-rules.md | 49 | 72cdecfd1c99 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/references/source-basis.md | 26 | 4de536410192 | Evidence Discipline |
| skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/SKILL.md | 123 | f9eaefb3bca1 | IFRS Share Based Payment Ifrs2 |
| skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/examples/worked-example.md | 42 | b3e3688d678b | Scenario |
| skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/references/implementation-rules.md | 49 | 5fac53842642 | Doctrine Boundary |
| skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/references/source-basis.md | 26 | ca99b7c978d5 | Evidence Discipline |
| skills/04-subledgers-and-operations/README.md | 19 | 1b4b13f5b3b3 | Skills in this category |
| skills/05-receivables-payables-and-treasury/README.md | 17 | 51e9c25748b0 | Skills in this category |
| skills/06-close-consolidation-and-reporting/README.md | 19 | c64604a4e3db | Skills in this category |
| skills/06-close-consolidation-and-reporting/finance-module-audit/references/audit-protocol.md | 102 | 5a6882be01ec | Audit Protocol |
| skills/07-financial-statements-and-disclosures/README.md | 17 | e42268f8384b | Skills in this category |
| skills/08-tax-and-statutory/README.md | 17 | ee9289ba251f | Skills in this category |
| skills/09-budgeting-fpa-and-costing/README.md | 17 | 1d3719846c1a | Skills in this category |
| skills/10-controls-governance-and-fraud/README.md | 18 | c65af88726a2 | Skills in this category |
| skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/SKILL.md | 123 | fe68f9c624fb | AML KYC And Suspicious Transaction Reporting |
| skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/examples/worked-example.md | 42 | a93a4f2a4641 | Scenario |
| skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/references/implementation-rules.md | 49 | 8ea66cbc460b | Doctrine Boundary |
| skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/references/source-basis.md | 25 | 9665b2e85c62 | Evidence Discipline |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/SKILL.md | 131 | 4ce6582e8d42 | Engagement Quality and Plain-Language Output |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/examples/independence-ethics-caveat-template.md | 14 | b27912a60b8a | Example: Independence and Ethics Caveat |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/examples/rejected-missing-plain-language-layer.md | 18 | 578a9d8938bd | Fixture: Rejected Output Missing Plain-Language Layer |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/examples/sign-off-template.md | 27 | cf6106a1883d | Example: Sign-Off Template |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/references/plain-language-output-pattern.md | 39 | 06f413557c33 | Plain-Language Output Pattern |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/references/quality-and-ethics-gates.md | 28 | 58241f93801c | Quality and Ethics Gates |
| skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/references/reviewer-matrix.md | 21 | 02f38bc27cd7 | Reviewer Matrix |
| skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md | 124 | 104473588850 | Finance Doctrine Conformance Scanner |
| skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/examples/sample-scan-report.md | 29 | c9f0230ab3d1 | Sample Scan Report |
| skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/references/output-template.md | 55 | 12ed8dcb0270 | Output Template |
| skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/references/review-rubric.md | 43 | 488d09535891 | Review Rubric |
| skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/SKILL.md | 123 | 8e23546e5915 | Forensic Accounting And Anti Fraud |
| skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/examples/worked-example.md | 42 | 86960163a513 | Scenario |
| skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/references/implementation-rules.md | 49 | bda71c72fa89 | Doctrine Boundary |
| skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/references/source-basis.md | 26 | 0ef4de3eb6f7 | Evidence Discipline |
| skills/10-controls-governance-and-fraud/internal-controls-library/SKILL.md | 244 | 2f46ab0a7fe4 | Internal Controls Library |
| skills/10-controls-governance-and-fraud/internal-controls-library/examples/payment-approval-flow.md | 49 | c20e4e794fed | Example - Payment Approval Flow |
| skills/10-controls-governance-and-fraud/internal-controls-library/examples/uganda-worked-example.md | 62 | dc0472beea31 | Uganda Worked Example - Internal Controls Library |
| skills/10-controls-governance-and-fraud/internal-controls-library/references/exception-indicators.md | 49 | 57c23455fec6 | Exception Indicators |
| skills/10-controls-governance-and-fraud/internal-controls-library/references/sod-conflict-matrix.md | 52 | 823560ff3e88 | Segregation of Duties Conflict Matrix |
| skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/SKILL.md | 123 | 3719e5a72682 | Sox Style Icfr Documentation |
| skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/examples/worked-example.md | 42 | aae8d93c4842 | Scenario |
| skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/references/implementation-rules.md | 49 | 87cd0899fe19 | Doctrine Boundary |
| skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/references/source-basis.md | 26 | 8b037725ac70 | Evidence Discipline |
| skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/SKILL.md | 123 | b1f7c1c63781 | Whistleblowing And Finance Ethics |
| skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/examples/worked-example.md | 42 | d84ce4c15642 | Scenario |
| skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/references/implementation-rules.md | 49 | c8d8089742ed | Doctrine Boundary |
| skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/references/source-basis.md | 26 | 1912074c5f44 | Evidence Discipline |
| skills/11-sector-and-fund-accounting/README.md | 20 | 694a56d245a2 | Skills in this category |
| skills/12-public-sector-and-ipsas/README.md | 15 | 17520f54c2a9 | Skills in this category |
| skills/13-project-and-contract-accounting/README.md | 15 | 19430dddb413 | Skills in this category |
| skills/14-systems-integration-and-data/README.md | 16 | 4993593c3b00 | Skills in this category |
| skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/SKILL.md | 123 | ae61939e50f4 | Finance Data Contracts And Warehouse Models |
| skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/examples/worked-example.md | 42 | bc251b638062 | Scenario |
| skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/references/implementation-rules.md | 49 | 124e767c3348 | Doctrine Boundary |
| skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/references/source-basis.md | 25 | a7c12c115e05 | Evidence Discipline |
| skills/15-security-privacy-and-continuity/README.md | 15 | c30d8110388c | Skills in this category |
| skills/16-ux-and-presentation/README.md | 16 | 5e9f843b8941 | Skills in this category |
| skills/16-ux-and-presentation/finance-ui-pattern-library/references/print-stylesheet-template.md | 177 | 9dfb9d649479 | Print Stylesheet Template |
| skills/16-ux-and-presentation/finance-ux-for-non-accountants/references/microcopy-style.md | 66 | 60fc491464c5 | Microcopy Style |
| skills/17-ai-automation-and-emerging/README.md | 16 | 449a1fe37478 | Skills in this category |
| skills/17-ai-automation-and-emerging/ai-in-finance-governance/SKILL.md | 123 | 9b0c7919009a | AI In Finance Governance |
| skills/17-ai-automation-and-emerging/ai-in-finance-governance/examples/worked-example.md | 42 | 0c64cea86ca2 | Scenario |
| skills/17-ai-automation-and-emerging/ai-in-finance-governance/references/implementation-rules.md | 49 | 88654c400c37 | Doctrine Boundary |
| skills/17-ai-automation-and-emerging/ai-in-finance-governance/references/source-basis.md | 25 | aa72cb0066ce | Evidence Discipline |
