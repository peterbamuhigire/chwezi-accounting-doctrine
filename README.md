# Chwezi Accounting Doctrine

Chwezi Accounting Doctrine is the cross-cutting finance and accounting engine of the Chwezi skills portfolio. It holds a canonical accounting doctrine and routed skills for AI agents. They cover ledger design, IFRS treatment, period close, East African tax, controls and finance-system integration.

Use it if you are an accountant, finance manager, auditor, reviewer or consultant, or if you build software that handles money. Other Chwezi engines call on it whenever their work touches money, inventory, payroll, tax, grants or banking.

Every output states its reporting basis and cites current support for statutory values. It keeps an audit trail from source document to report and corrects posted history only by reversal.

Anything not verified is marked `NOT ASSESSED`. Final statutory output needs a named human reviewer under the finance quality gate.

## At a glance

- **108 skills in 17 categories.** Each is a `SKILL.md` under `skills/<category>/<skill>/`.
- **30 source-register entries** for Uganda, Kenya, Rwanda, Tanzania and South Africa: 28 `draft`, 1 `verified-current` and 1 `superseded`. A draft entry cannot support final statutory output.
- **56 unit tests and 17 PowerShell gate checks.** The Python and Node checks run without PowerShell.
- **Published score 58.2/100** on 31 October 2026 (raw and capped). The weakest dimension is standards currency, at 48/100.
- **Runs in Claude Code and Codex.** The checks need Git, Node.js 18 or later, and Python 3.11 or later with PyYAML.
- **Next date gate: 2026-11-17.** The NSSF register entry passes its recheck date and two tests start to fail.

## Start here

1. **Install in Claude Code.** For Codex, the installer script or manual use, see [Installation](#installation).

```text
/plugin marketplace add peterbamuhigire/chwezi-accounting-doctrine
/plugin install accounting@chwezi-accounting
```

2. **Check a clone.** Expect `Ran 56 tests` and exit 0. This needs PyYAML.

```sh
python3 -m unittest discover -s tests -p 'test_*.py'
```

3. **Use it.** Start from [`AGENTS.md`](AGENTS.md), then route the task as in [Routing and use](#routing-and-use). Before you quote a statutory value, look it up. Exit 3 means the entry cannot support final output; here it is a draft.

```sh
python3 tools/source_register_lookup.py --jurisdiction UG --register vat --date 2026-10-15
```

**Contents**

- [Routing and use](#routing-and-use): find a skill, the five routing steps, boundaries, prompt handoff
- [Capabilities](#capabilities): the 17 skill groups, what the engine produces, the frameworks it applies
- Skill catalogue:
  - [Foundations and IFRS standards](#catalogue-foundations-and-ifrs-standards)
  - [Operations, treasury, close and statements](#catalogue-operations-treasury-close-and-statements)
  - [Tax, planning, controls and sectors](#catalogue-tax-planning-controls-and-sectors)
  - [Public sector, projects, systems and AI](#catalogue-public-sector-projects-systems-and-ai)
- [Installation](#installation): Claude Code, installer scripts, Codex, manual use
- [Validation](#validation): every check, what it needs and what it returns
- [Quality and improvement](#quality-and-improvement): score, open findings and date gates
- [What the October 2026 kaizen improved](#what-the-october-2026-kaizen-improved)
- [References](#references) and [Contributing and licence](#contributing-and-licence)

## Routing and use

This README is the engine's router in the portfolio routing table.

### Find the right skill

| You need to | Use |
|---|---|
| Correct a material prior-period error found after close | [`ifrs-accounting-policies-changes-errors-ias8`](skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md) |
| Design reversal and correction postings with idempotency | [`ledger-posting-engine-core`](skills/01-foundations/ledger-posting-engine-core/SKILL.md) |
| Decide whether an event after the reporting date adjusts the statements | [`ifrs-events-after-reporting-period-ias10`](skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md) |
| Design account-code segments and approval controls | [`chart-of-accounts-design-and-governance`](skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md) |
| Reconcile mobile-money settlements to a provider statement | [`bank-and-mobile-money-reconciliation`](skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/SKILL.md) |
| Compute gross-to-net pay with PAYE and NSSF and post it | [`payroll-and-statutory-postings-east-africa`](skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/SKILL.md) |
| Work out input and output VAT and complete the return | [`indirect-tax-vat-mechanics`](skills/08-tax-and-statutory/indirect-tax-vat-mechanics/SKILL.md) |
| Find which register entry applies on a date, and whether it can support final output | [`tax-statutory-source-register-and-country-packs`](skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md) |
| Run the month-end or year-end close | [`month-end-and-year-end-close-playbook`](skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/SKILL.md) |
| Audit software, a specification or a workflow that touches money | [`finance-module-audit`](skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md) |
| Scan a system, plan or document against the doctrine | [`finance-doctrine-conformance-scanner`](skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md) |
| Account for restricted funds and report to donors | [`ngo-and-fund-accounting`](skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/SKILL.md) |

For any other task, choose from the [skill catalogue](#catalogue-foundations-and-ifrs-standards) or the filesystem-derived [router map](docs/router-map.md).

### Route a request in five steps

Route every finance request in this order:

1. **Doctrine first.** Read [`AGENTS.md`](AGENTS.md) and the [accounting and finance doctrine](doctrine/accounting-finance-doctrine.md). The doctrine is the authority for recognition, measurement, posting, reporting basis, controls and professional review. If the working project root holds a `PROJECT.md` with `project_schema: 1`, read it before planning.
2. **Select the skill.** Use the filesystem-derived [router map](docs/router-map.md), or the [skill catalogue](#catalogue-foundations-and-ifrs-standards), to choose the skill by transaction and reporting question, starting from the current entries in the [skills directory](skills/). Load [`rules/common/core.md`](rules/common/core.md) alongside it for any non-trivial task.
3. **Fix the reporting basis.** Every finance artefact names its framework. Under the [policy hierarchy](doctrine/references/policy-hierarchy.md) the client's selection prevails; otherwise SMEs, NGOs and micro-enterprises default to IFRS for SMEs, public-interest entities to full IFRS, and public-sector bodies follow the [IPSAS overlay](skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/SKILL.md). With no basis, final output is refused.
4. **Verify statutory values.** Tax, payroll, e-invoicing and exchange-rate values come only from [`doctrine/source-register/`](doctrine/source-register/) and the [IFRS, tax and statutory source register](docs/source-registers/ifrs-tax-statutory-2026.md). Entries in `draft`, `stale`, `superseded` or `no-source-found` state cannot support final statutory output.
5. **Apply the gate.** Apply the [finance and accounting quality gate](governance/finance-accounting-quality-gate.md) whenever the work has finance scope. It returns `pass`, `pass-with-caveats` (internal drafts only) or `fail`; missing verification is `NOT ASSESSED`.

### Boundaries

- The engine gives no professional tax or audit opinion. It does not post to live ledgers, file returns or change controls without explicit approval. It never treats books as authority for current standards, rates or law.
- The visual presentation of finance artefacts follows the design engine (`chwezi-design-engine`, formerly the local directory `design-system-skills`).
- Evidence for current facts follows the digital research engine (catalogue id `digital-research-skills`; its GitHub repository is `chwezi-research-engine`).
- Resolve both engines through the active engine-routing table or `chwezi-engine-agents/catalog/engines.yaml`, not through a fixed path.
- For multi-phase work, follow the [runtime-agnostic orchestration contract](docs/operations/runtime-agnostic-orchestration-2026-09-07.md): bounded work packages, accounting checkpoints, context hygiene and sanitised handling of imported content.

### DOMAIN PROMPT GENERATION CONTRACT

For a prompt handoff, read the local [domain prompt contract](docs/ai-prompting/domain-prompt-compilation-contract.md). Generate a ready-to-paste finance prompt with these parts:

- Entity, period and jurisdiction.
- Reporting basis and source documents.
- Accounting question and treatment.
- Controls, audit trail and reconciliation.
- Reviewer and acceptance checks.

Never invent rates, standards, statutory values, or assurance.

- **Ready-to-paste prompt:** include source/period assumptions and NOT ASSESSED gaps.
- **Failure action:** stop and obtain the missing source or reviewer, or revise one treatment field.

## Capabilities

The engine has 108 active skills in 17 categories, discovered from `skills/<category>/<skill>/SKILL.md`. There are no alias or template entries. The catalogue sections below list every skill.

### Skill groups

| Category | Skills |
|---|---:|
| [Foundations](skills/01-foundations/) | 5 |
| [IFRS core standards](skills/02-ifrs-core-standards/) | 10 |
| [IFRS specialised standards](skills/03-ifrs-specialised-standards/) | 19 |
| [Subledgers and operations](skills/04-subledgers-and-operations/) | 7 |
| [Receivables, payables and treasury](skills/05-receivables-payables-and-treasury/) | 5 |
| [Close, consolidation and reporting](skills/06-close-consolidation-and-reporting/) | 8 |
| [Financial statements and disclosures](skills/07-financial-statements-and-disclosures/) | 6 |
| [Tax and statutory](skills/08-tax-and-statutory/) | 6 |
| [Budgeting, FP&A and costing](skills/09-budgeting-fpa-and-costing/) | 5 |
| [Controls, governance and fraud](skills/10-controls-governance-and-fraud/) | 8 |
| [Sector and fund accounting](skills/11-sector-and-fund-accounting/) | 8 |
| [Public sector and IPSAS](skills/12-public-sector-and-ipsas/) | 3 |
| [Project and contract accounting](skills/13-project-and-contract-accounting/) | 3 |
| [Systems integration and data](skills/14-systems-integration-and-data/) | 4 |
| [Security, privacy and continuity](skills/15-security-privacy-and-continuity/) | 3 |
| [UX and presentation](skills/16-ux-and-presentation/) | 4 |
| [AI, automation and emerging practice](skills/17-ai-automation-and-emerging/) | 4 |
| **Total** | **108** |

### What it produces

- Accounting treatment analyses and judgement memos.
- Accounting policy and chart-of-accounts designs.
- Posting rules and journal packs.
- Reconciliation and close playbooks.
- Financial-statement and note-disclosure packs.
- Audit-ready reporting packs with PBC evidence indexes.
- Tax and payroll computations tied to source keys.
- Internal-control libraries and risk-control matrices.
- Finance-module audits, and doctrine conformance scans of software, specifications and plans.
- Ready-to-paste finance prompts.

### Frameworks it applies

- **Reporting:** the IFRS Accounting Standards (IAS and IFRS, including IFRS 18); the IFRS for SMEs Accounting Standard (third edition), the default framework for small and medium entities; IFRS S1 and S2; IPSAS.
- **Audit and ethics:** the IAASB International Standards on Auditing and ISQM; the IESBA Code of Ethics.
- **Controls and risk:** the COSO Internal Control - Integrated Framework; the IIA Three Lines Model; the NIST Cybersecurity Framework and AI Risk Management Framework.
- **Other:** WCAG 2.2; the FATF Recommendations; the OECD Transfer Pricing Guidelines; the GHG Protocol Corporate Standard.

Jurisdiction-dependent values come only from a dated source register covering Uganda, Kenya, Rwanda, Tanzania and South Africa. Such values include VAT, PAYE, NSSF, withholding tax, Local Service Tax and EFRIS requirements.

## Catalogue: foundations and IFRS standards

Categories 1 to 3. Each row links to the skill's `SKILL.md`.

### Foundations

| Skill | What it does |
|---|---|
| [`chart-of-accounts-design-and-governance`](skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md) | Account taxonomy, normal balances, control-account ownership and CoA change control. |
| [`functional-and-presentation-currency`](skills/01-foundations/functional-and-presentation-currency/SKILL.md) | Functional and presentation currency, translation method and FX gain/loss under IAS 21 and Section 30. |
| [`ledger-posting-engine-core`](skills/01-foundations/ledger-posting-engine-core/SKILL.md) | Canonical posting service, journal schema, ledger invariants, reversals, idempotency and drilldown. |
| [`management-accounting-dimensions`](skills/01-foundations/management-accounting-dimensions/SKILL.md) | Governed dimensions (cost centre, project, grant, branch) for budget, variance and allocation reporting. |
| [`period-locking-and-data-immutability`](skills/01-foundations/period-locking-and-data-immutability/SKILL.md) | Period state machine, immutability of posted journals and audit-evidence retention. |

### IFRS core standards

| Skill | What it does |
|---|---|
| [`ifrs-borrowing-costs-ias23`](skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md) | Capitalisation of borrowing costs on qualifying assets under IAS 23 and Section 25. |
| [`ifrs-conceptual-framework-and-accounting-judgements`](skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/SKILL.md) | Conceptual Framework, materiality and judgement documentation where no Standard applies directly. |
| [`ifrs-employee-benefits-ias19`](skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/SKILL.md) | Short-term, post-employment, long-term and termination benefits under IAS 19 and Section 28. |
| [`ifrs-financial-instruments`](skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md) | Classification, measurement, ECL impairment, derecognition and hedge accounting under IFRS 9 and IFRS 7. |
| [`ifrs-for-smes-equivalents`](skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/SKILL.md) | IFRS for SMEs as the default framework, cross-referenced to each full IFRS standard. |
| [`ifrs-foreign-currency-translation-ias21`](skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/SKILL.md) | Foreign-currency transactions and foreign operations, monetary items and CTA reserve under IAS 21. |
| [`ifrs-intangible-assets-ias38`](skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/SKILL.md) | Research versus development, internally generated intangibles and amortisation under IAS 38 and Section 18. |
| [`ifrs-leases`](skills/02-ifrs-core-standards/ifrs-leases/SKILL.md) | Lease identification, measurement, modification, sale-and-leaseback and lessor accounting under IFRS 16. |
| [`ifrs-property-plant-equipment-ias16`](skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md) | Componentisation, cost versus revaluation model, subsequent costs and derecognition under IAS 16. |
| [`ifrs-revenue-recognition`](skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md) | Five-step revenue recognition, contract balances, refunds and principal/agent under IFRS 15 and Section 23. |

### IFRS specialised standards

| Skill | What it does |
|---|---|
| [`ias-agriculture`](skills/03-ifrs-specialised-standards/ias-agriculture/SKILL.md) | Biological assets and agricultural produce under IAS 41 and Section 34. |
| [`ias-government-grants`](skills/03-ifrs-specialised-standards/ias-government-grants/SKILL.md) | Government grants and assistance, conditions and donor restrictions under IAS 20 and Section 24. |
| [`ias-impairment`](skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md) | CGU allocation, goodwill, value in use, reversals and disclosure under IAS 36 and Section 27. |
| [`ias-income-tax-deferred-tax`](skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/SKILL.md) | Current and deferred tax, temporary differences and tax-rate reconciliation under Section 29 and IAS 12. |
| [`ias-provisions-contingencies`](skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md) | Provisions, onerous contracts, restructuring and contingencies under IAS 37 and Section 21. |
| [`ifrs-18-presentation-and-disclosures`](skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/SKILL.md) | IFRS 18 categories, required subtotals, management-defined performance measures and aggregation. |
| [`ifrs-accounting-policies-changes-errors-ias8`](skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md) | Policy changes, estimate changes and prior-period errors, including material errors discovered after close; read its worked example and canonical reversal pattern. |
| [`ifrs-associates-and-joint-arrangements`](skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/SKILL.md) | Equity method, joint operations and joint ventures under IAS 28 and IFRS 11. |
| [`ifrs-business-combinations-ifrs3`](skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/SKILL.md) | Acquisition method, goodwill, NCI measurement and bargain purchases under IFRS 3 and Section 19. |
| [`ifrs-discontinued-operations-ifrs5`](skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/SKILL.md) | Held-for-sale classification and discontinued-operation presentation under IFRS 5. |
| [`ifrs-earnings-per-share-ias33`](skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/SKILL.md) | Basic and diluted earnings per share under IAS 33. |
| [`ifrs-events-after-reporting-period-ias10`](skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md) | Adjusting and non-adjusting events and going-concern reassessment under IAS 10 and Section 32. |
| [`ifrs-fair-value-measurement-ifrs13`](skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md) | Valuation techniques, fair-value hierarchy and disclosures under IFRS 13. |
| [`ifrs-first-time-adoption-ifrs1`](skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/SKILL.md) | Opening IFRS balance sheet, exceptions, exemptions and reconciliations under IFRS 1. |
| [`ifrs-insurance-contracts-ifrs17`](skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/SKILL.md) | GMM, PAA and VFA measurement and CSM mechanics under IFRS 17. |
| [`ifrs-investment-property-ias40`](skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/SKILL.md) | Cost versus fair-value model, transfers and disclosure under IAS 40 and Section 16. |
| [`ifrs-related-party-disclosures-ias24`](skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/SKILL.md) | Related-party identification, balances and key management compensation under IAS 24. |
| [`ifrs-segment-reporting-ifrs8`](skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/SKILL.md) | CODM identification, aggregation criteria and segment reconciliations under IFRS 8. |
| [`ifrs-share-based-payment-ifrs2`](skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/SKILL.md) | Equity- and cash-settled share-based payments, vesting and modifications under IFRS 2. |

## Catalogue: operations, treasury, close and statements

Categories 4 to 7.

### Subledgers and operations

| Skill | What it does |
|---|---|
| [`bank-and-mobile-money-reconciliation`](skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/SKILL.md) | Bank, mobile-money, card settlement and clearing-account reconciliation workflows. |
| [`expense-management-and-staff-claims`](skills/04-subledgers-and-operations/expense-management-and-staff-claims/SKILL.md) | Staff expense, advance and claim workflows with VAT recovery and reimbursement posting. |
| [`fixed-assets-and-depreciation`](skills/04-subledgers-and-operations/fixed-assets-and-depreciation/SKILL.md) | Fixed-asset register, capitalisation policy, depreciation, disposals and GL tie-out. |
| [`inventory-costing-and-stock-accounting`](skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/SKILL.md) | FIFO or weighted-average costing, counts, shrinkage, NRV write-downs and COGS postings. |
| [`payroll-and-statutory-postings-east-africa`](skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/SKILL.md) | Gross-to-net payroll, PAYE, NSSF, LST and payroll-to-GL reconciliation for East Africa. |
| [`petty-cash-and-imprest-management`](skills/04-subledgers-and-operations/petty-cash-and-imprest-management/SKILL.md) | Petty-cash and imprest floats, replenishment, surprise counts and postings. |
| [`pos-and-cash-drawer-management`](skills/04-subledgers-and-operations/pos-and-cash-drawer-management/SKILL.md) | Opening float, X/Z reads, blind cash-up, variance triage and POS-to-GL reconciliation. |

### Receivables, payables and treasury

| Skill | What it does |
|---|---|
| [`accounts-payable-and-supplier-management`](skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/SKILL.md) | Supplier master data, three-way match, payment runs and AP control tie-out. |
| [`accounts-receivable-and-credit-management`](skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/SKILL.md) | Credit limits, ageing, dunning, write-off and simplified ECL on trade receivables. |
| [`banking-facilities-and-covenants`](skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/SKILL.md) | Debt facilities, drawdowns, interest accrual, covenant tests and breach disclosure. |
| [`cash-flow-forecasting-and-treasury`](skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/SKILL.md) | 13-week and longer cash forecasts, cash positioning, sweeps and cash pooling. |
| [`fx-management-and-hedging`](skills/05-receivables-payables-and-treasury/fx-management-and-hedging/SKILL.md) | FX exposure, forwards, hedge documentation and hedge-accounting eligibility under IFRS 9. |

### Close, consolidation and reporting

| Skill | What it does |
|---|---|
| [`advanced-ifrs-consolidated-statements-review`](skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md) | Review of consolidated statements under IFRS 10, 11, 12 and IAS 28, including NCI and eliminations. |
| [`audit-pbc-and-evidence-management`](skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/SKILL.md) | Auditor PBC request log, evidence index, sampling support and reviewer trail. |
| [`audit-ready-reporting-pack`](skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md) | Minimum audit-ready report set, drilldown chain, auditor export, sign-off and release governance. |
| [`consolidation-and-intercompany`](skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/SKILL.md) | Entity hierarchy, intercompany matching, elimination journals and group trial balance. |
| [`continuous-close-and-flash-reporting`](skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/SKILL.md) | Continuous-close cadence, subledger locks, flash P&L and exception escalation. |
| [`finance-module-audit`](skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md) | Audit of any software, SRS or workflow that touches money, tax, payroll or accounting records. |
| [`month-end-and-year-end-close-playbook`](skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/SKILL.md) | Close task list, evidence, reviewer sign-off, period transitions and retained-earnings close. |
| [`opening-balances-and-migration-playbook`](skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/SKILL.md) | Cutover from legacy systems: conversion date, CoA mapping, opening TB and subledgers. |

### Financial statements and disclosures

| Skill | What it does |
|---|---|
| [`cash-flow-statement-ias7`](skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/SKILL.md) | Statement of cash flows, direct and indirect methods and non-cash transactions under IAS 7. |
| [`financial-statements-preparation`](skills/07-financial-statements-and-disclosures/financial-statements-preparation/SKILL.md) | The four primary statements, IFRS 18 categories, comparatives and restatements. |
| [`going-concern-and-viability-assessment`](skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/SKILL.md) | Going-concern and viability assessments, sensitivities and emphasis-of-matter triggers. |
| [`integrated-and-sustainability-reporting-s1-s2`](skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/SKILL.md) | Sustainability and climate disclosures under IFRS S1 and IFRS S2. |
| [`notes-and-disclosure-pack`](skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/SKILL.md) | Accounting policies, judgements, estimates and standard-specific note disclosures. |
| [`published-ifrs-financial-statement-analysis`](skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md) | Analysis of published IFRS statements for performance, liquidity, gearing and accounting risk. |

## Catalogue: tax, planning, controls and sectors

Categories 8 to 11.

### Tax and statutory

| Skill | What it does |
|---|---|
| [`e-invoicing-and-fiscal-device-integration`](skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/SKILL.md) | Legacy e-invoicing and fiscal-device route that forwards to electronic fiscal taxing. |
| [`electronic-fiscal-taxing`](skills/08-tax-and-statutory/electronic-fiscal-taxing/SKILL.md) | E-invoicing, e-receipting and fiscal-device controls, with Uganda EFRIS references. |
| [`indirect-tax-vat-mechanics`](skills/08-tax-and-statutory/indirect-tax-vat-mechanics/SKILL.md) | Place of supply, reverse charge, input VAT recovery and partial exemption. |
| [`tax-statutory-source-register-and-country-packs`](skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md) | Source-register and country-pack behaviour for Uganda, Kenya, Rwanda, Tanzania and South Africa. |
| [`transfer-pricing-documentation`](skills/08-tax-and-statutory/transfer-pricing-documentation/SKILL.md) | Master file, local file, CbC thresholds and benchmarking evidence. |
| [`withholding-tax-and-treaties`](skills/08-tax-and-statutory/withholding-tax-and-treaties/SKILL.md) | Domestic withholding rates, treaty relief, certificates and supplier gross-up. |

### Budgeting, FP&A and costing

| Skill | What it does |
|---|---|
| [`budgeting-and-rolling-forecasts`](skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/SKILL.md) | Annual budgets, rolling and driver-based forecasts and budget-versus-actual. |
| [`cost-accounting-methods`](skills/09-budgeting-fpa-and-costing/cost-accounting-methods/SKILL.md) | Standard, job-order, process, ABC and absorption versus marginal costing. |
| [`pricing-discounts-rebates-and-refunds`](skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/SKILL.md) | Pricing, discount, rebate, refund and chargeback mechanics under IFRS 15. |
| [`scenario-and-sensitivity-modelling`](skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/SKILL.md) | Scenario, sensitivity and stress modelling with an assumption catalogue. |
| [`variance-analysis-and-kpi-reporting`](skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/SKILL.md) | Price, volume, mix and efficiency variances, KPI cascades and management commentary. |

### Controls, governance and fraud

| Skill | What it does |
|---|---|
| [`aml-kyc-and-suspicious-transaction-reporting`](skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/SKILL.md) | Customer due diligence, sanctions screening and suspicious-transaction reporting. |
| [`engagement-quality-and-plain-language-output`](skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/SKILL.md) | Preparer-reviewer-approver governance, independence checks and plain-language client output. |
| [`finance-doctrine-conformance-scanner`](skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md) | Scans systems, code, plans and documents against the doctrine and ranks gaps by risk. |
| [`forensic-accounting-and-anti-fraud`](skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/SKILL.md) | Red-flag library, Benford analysis, journal-entry testing and incident response. |
| [`internal-controls-library`](skills/10-controls-governance-and-fraud/internal-controls-library/SKILL.md) | Segregation of duties, maker-checker, approval thresholds and master-data controls. |
| [`kaizen-engine-and-product-improvement`](skills/10-controls-governance-and-fraud/kaizen-engine-and-product-improvement/SKILL.md) | Kaizen audit and improvement of this engine and the finance products it produces. |
| [`sox-style-icfr-documentation`](skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/SKILL.md) | Process narratives, risk-control matrices, walkthroughs and ICFR testing. |
| [`whistleblowing-and-finance-ethics`](skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/SKILL.md) | Whistleblowing intake, ethics escalation, conflict registers and code attestation. |

### Sector and fund accounting

| Skill | What it does |
|---|---|
| [`agribusiness-and-cooperative-pack`](skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/SKILL.md) | Out-grower schemes, cooperatives, member equity, patronage refunds and crop costing. |
| [`clinic-and-healthcare-accounting-pack`](skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/SKILL.md) | Patient accounts, payer mix, claim adjudication and healthcare revenue. |
| [`fintech-and-payments-pack`](skills/11-sector-and-fund-accounting/fintech-and-payments-pack/SKILL.md) | Float and trust accounts, settlement, scheme fees and customer-money safeguarding. |
| [`hospitality-and-restaurant-pack`](skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/SKILL.md) | Room nights, packages, recipe costing, service charges and daily hospitality close. |
| [`ngo-and-fund-accounting`](skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/SKILL.md) | Restricted and unrestricted funds, multi-currency grants and donor reporting. |
| [`real-estate-and-property-pack`](skills/11-sector-and-fund-accounting/real-estate-and-property-pack/SKILL.md) | Deposits, lease incentives, service charges and IAS 40/16/2 classification. |
| [`retail-and-pos-accounting-pack`](skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/SKILL.md) | Multi-outlet retail: day-end, settlement, markdowns, returns, loyalty and shrinkage. |
| [`school-and-education-accounting-pack`](skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/SKILL.md) | Fee billing, bursaries, term accruals, capitation grants and parent statements. |

## Catalogue: public sector, projects, systems and AI

Categories 12 to 17: public sector, project and contract accounting, systems integration, security and privacy, UX, and AI and automation.

### Public sector and IPSAS

| Skill | What it does |
|---|---|
| [`donor-funded-project-fiscal-compliance`](skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/SKILL.md) | Donor eligibility, ineligible-cost recovery, audit clauses and donor templates. |
| [`government-procurement-and-fiscal-controls`](skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/SKILL.md) | PPDA procurement, vote books, commitment accounting and treasury single account. |
| [`ipsas-public-sector-overlay`](skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/SKILL.md) | IPSAS accrual and cash basis, IPSAS-to-IFRS deltas and budget reporting. |

### Project and contract accounting

| Skill | What it does |
|---|---|
| [`construction-contract-accounting`](skills/13-project-and-contract-accounting/construction-contract-accounting/SKILL.md) | Retentions, variations, claims, advances and milestone certificates. |
| [`professional-services-time-and-materials`](skills/13-project-and-contract-accounting/professional-services-time-and-materials/SKILL.md) | Utilisation, realisation, WIP and unbilled receivables for services firms. |
| [`project-and-contract-accounting`](skills/13-project-and-contract-accounting/project-and-contract-accounting/SKILL.md) | Over-time and point-in-time recognition, input and output methods and contract balances. |

### Systems integration and data

| Skill | What it does |
|---|---|
| [`bank-feed-and-payment-gateway-integration`](skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/SKILL.md) | Bank feeds, gateways and mobile-money APIs with replay, deduplication and posting safety. |
| [`erp-and-finance-system-integration-patterns`](skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/SKILL.md) | Master-data sync, event versus batch, idempotency and reconciliation watchers. |
| [`finance-data-contracts-and-warehouse-models`](skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/SKILL.md) | Conformed dimensions, slowly changing CoA and warehouse reconciliation to the GL. |
| [`open-banking-and-direct-debit-mandates`](skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/SKILL.md) | Open-banking aggregators, direct-debit mandates and recurring authorisations. |

### Security, privacy and continuity

| Skill | What it does |
|---|---|
| [`business-continuity-and-disaster-recovery-finance`](skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/SKILL.md) | RPO/RTO per finance system, payroll and payment fallback and tabletop tests. |
| [`finance-cybersecurity-controls`](skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/SKILL.md) | Identity, MFA, privileged posting access, secret rotation and payment hardening. |
| [`finance-data-privacy-and-retention`](skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/SKILL.md) | Finance data classification, retention, lawful basis and cross-border transfer. |

### UX and presentation

| Skill | What it does |
|---|---|
| [`finance-accessibility-and-inclusive-design`](skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/SKILL.md) | Keyboard parity, screen-reader ledger tables and colour-independent states. |
| [`finance-mobile-and-offline-patterns`](skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/SKILL.md) | Deferred posting queues, conflict resolution and offline evidence capture. |
| [`finance-ui-pattern-library`](skills/16-ux-and-presentation/finance-ui-pattern-library/SKILL.md) | Finance UI tokens, role-conditioned shell, drilldown, money cells and print styles. |
| [`finance-ux-for-non-accountants`](skills/16-ux-and-presentation/finance-ux-for-non-accountants/SKILL.md) | Workflow-first UX for cashiers, clerks and managers with safe exception handling. |

### AI, automation and emerging practice

| Skill | What it does |
|---|---|
| [`ai-in-finance-governance`](skills/17-ai-automation-and-emerging/ai-in-finance-governance/SKILL.md) | Model registry, human-in-the-loop checkpoints, evaluation and audit trail for AI in finance. |
| [`carbon-and-emissions-accounting`](skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/SKILL.md) | Carbon allowances, offsets and Scope 1/2/3 emissions data for disclosures. |
| [`digital-assets-and-crypto-accounting`](skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/SKILL.md) | Digital-asset classification, measurement, custody and disclosure. |
| [`rpa-and-automation-controls-for-finance`](skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/SKILL.md) | Bot identity, segregation of duties, kill-switch and exception routing for automations. |

## Installation

Prerequisites:

- Git.
- Node.js 18 or later, for the installer scripts and the hook tests.
- Python 3.11 or later with PyYAML, for the Python checks, the test suite and the Codex model-policy helper. Use `python3` on Linux and macOS.
- Windows PowerShell 5.1 or PowerShell 7 (`pwsh`), for the principal doctrine gate only. The Python checks do not need PowerShell.

[Validation](#validation) lists what each command needs.

### Claude Code plugin (recommended)

Run the two commands in step 1 of [Start here](#start-here). The repository ships a marketplace and plugin manifest in `.claude-plugin/`.

### Installer scripts

Clone the repository and run the installer. It delegates to `scripts/install-engine.js`.

- `--scope user` (the default) installs into `~/.claude`. `--scope project` installs into `.claude` under the current directory.
- `--dry-run` prints the plan without writing. `--json` gives machine-readable output.

```sh
git clone https://github.com/peterbamuhigire/chwezi-accounting-doctrine
cd chwezi-accounting-doctrine
bash install.sh --scope project --dry-run
bash install.sh --scope project
```

- `install.sh` is committed without the executable bit, so run it through `bash`. `./install.sh` fails with "Permission denied".
- On Windows PowerShell, run `./install.ps1 --scope project`.
- Installed files are recorded in `.chwezi/install-state.json` under the target root. `node scripts/install-engine.js doctor --scope project` checks an installation.

### Codex

Codex reads [`AGENTS.md`](AGENTS.md) at the repository root. To install the local Codex plugin, run these commands from the repository root:

```sh
codex plugin marketplace add .
codex plugin add accounting@chwezi-accounting-doctrine-local
```

- The local Codex catalogue name is `chwezi-accounting-doctrine-local`; the plugin name is `accounting`. Both differ from the Claude marketplace name `chwezi-accounting`.
- The Codex-only model-policy helper lives in [`.codex/`](.codex/README.md). Run `python3 <engine-root>/.codex/ensure_model_policy.py --runtime codex --check`. It exits 1 with a `DRIFT` line when the Codex configuration is missing or differs.
- Use `--apply` only when the check reports drift. Claude and other runners skip this step.

### Manual use

Clone the repository and point the agent at this README and [`AGENTS.md`](AGENTS.md); `CLAUDE.md` imports `AGENTS.md`. Select skills through the [router map](docs/router-map.md) and read the chosen `SKILL.md` directly. To confirm a checkout is sound, follow [Validation](#validation).

## Validation

- Run every command from the repository root. None of them modifies a tracked file.
- Every Python check needs PyYAML (`python3 -m pip install pyyaml`), except `tools/check_machine_paths.py`, which uses only the standard library.
- The suite uses `unittest`, so `pytest` is optional: `python3 -m pytest tests` collects the same 56 tests.
- No registered check needs Pandoc, Mermaid, a browser or LibreOffice. The 16 PowerShell checks that do not call Python passed with the network disabled.

### Python and Node checks (no PowerShell)

Verified on Linux on 2026-10-31.

| Command | What it checks | Passes when |
|---|---|---|
| `python3 -m unittest discover -s tests -p 'test_*.py'` | 56 tests: source-register tools, machine-path guard, routing proxy, skill frontmatter, approval adapter, orchestration guidance, Section 10 example, source-to-report fixture. | Exit 0. |
| `python3 tools/check_frontmatter_yaml.py --root .` | YAML frontmatter of all 108 skills. | Exit 0 and `"state": "pass"`. |
| `python3 tools/source_register_integrity.py` | Each register entry (fields, state, recheck date, archive file) and every cited source key. | Exit 0: no errors. Exit 1: errors. Exit 2: unreadable. |
| `python3 tools/check_machine_paths.py` | No drive letter, home directory or mount path in active content. | Exit 0. |
| `python3 tools/route_proxy.py --fixture tests/router-map/fixtures/section10-after-close.json` (and `source-register-skill.json`) | Tier-2 lexical routing regression over labelled queries. A guard, not live routing. | Exit 0: every case ranks its expected skill first by a margin of at least 0.05. |
| `python3 tools/source_register_lookup.py --jurisdiction UG --register paye --date 2026-10-15` | Which register entry applies on a date, and whether it may support final output. | Exit 0 final use allowed, 3 refused, 2 no entry, 1 unreadable. The PAYE example exits 3 today because that entry is `draft`. |
| `python3 tests/agent-integration/test_accounting_agent_contract.py` | The `.skills-engine/engine-manifest.yaml` contract. It looks for a sibling `chwezi-engine-agents/catalog/engines.yaml` and prints `NOT ASSESSED` when that is absent. | Exit 0. |
| `node hooks/test-destructive-bash-gate.js` and `node hooks/test-plugin-hook-config.js` | The destructive-command gate (61 cases) and the hook configuration (7 cases). | Exit 0. |
| `node scripts/generate-plugin-manifest.js --engine . --check` | The Claude plugin manifest is current with the `skills/` directory (108 skills). | Exit 0. |

Notes on the table:

- `source_register_integrity.py` lists attention items but does not fail on them. `--as-of YYYY-MM-DD` tests a future date and `--json` prints JSON.
- `source_register_lookup.py` takes `--as-of DATE` to set the date of use. Exit 3 is a hard stop for statutory output.

### The principal gate (PowerShell)

`pwsh -NoProfile -File tools/validate-doctrine.ps1 -Strict` runs 17 registered checks. On Windows PowerShell 5.1, use `powershell -NoProfile -File tools/validate-doctrine.ps1 -Strict`.

The gate fails closed on a non-zero exit or missing JSON. `-Json` prints the report as JSON and `-ReportPath <file>` writes it.

- **Nine content checks:** mojibake, skill contracts, frontmatter YAML, advanced IFRS readiness, source register, links, repository discovery, router-map sync and accounting invariants.
- **Two packaging checks:** package file count and plugin packaging.
- **Six negative controls:** router map, source register, validation state, mojibake, package file count and plugin packaging.

Limits that apply:

- The frontmatter check calls `python` (not `python3`) and needs PyYAML. A host that has only `python3` fails the aggregate script at that check. Provide a `python` command, or run `python3 tools/check_frontmatter_yaml.py --root .` directly.
- On Linux, install PowerShell 7, or run the checks in the `mcr.microsoft.com/powershell` image with the checkout mounted read-only. That image has no Python.
- On 2026-10-31 the 16 checks other than the frontmatter wrapper each ran in that image one by one with `-Json -Strict` and exited 0. The aggregate script was not run end to end on Linux, and Windows PowerShell 5.1 was not run in that cycle.
- CI (`.github/workflows/doctrine-validation.yml`) runs the unit tests and the strict gate on `windows-latest` with Python 3.12 and PyYAML. `.skills-engine/engine-manifest.yaml` registers only the strict gate, for Windows. The Python checks above are not registered there.

## Quality and improvement

The engine improves through dated kaizen cycles. Each cycle keeps its evidence in seven files: scope and evidence, baseline scorecard, backlog, experiment log, validation record, final report and next cycle.

### Where the records are

- [`docs/kaizen/2026-10-engine-kaizen-pass-2/`](docs/kaizen/2026-10-engine-kaizen-pass-2/) holds the latest cycle (31 October 2026). Start with its [final report](docs/kaizen/2026-10-engine-kaizen-pass-2/05-final-report.md) and [next cycle](docs/kaizen/2026-10-engine-kaizen-pass-2/06-next-cycle.md).
- [`docs/kaizen/2026-10-engine-kaizen/`](docs/kaizen/2026-10-engine-kaizen/) holds the cycle of 29 October 2026.
- Earlier records are in [`docs/kaizen/2026-08-27-advanced-ifrs/`](docs/kaizen/2026-08-27-advanced-ifrs/), [`docs/audits/`](docs/audits/) and [`docs/continuous-improvement/`](docs/continuous-improvement/). The [documentation index](docs/README.md) lists the rest of `docs/`.
- What the two October cycles changed is under [What the October 2026 kaizen improved](#what-the-october-2026-kaizen-improved).

### Latest published score

- At the end of pass 2 the raw mean is 58.2/100 and the published capped score is 58.2/100 (`min(raw, 65)`).
- On 29 October the raw mean was 57.3/100 and the capped score 57.3/100.
- These are the cycle owner's evidence-bounded assessment, not an independent audit. The cap does not clear any source, legal, financial or release blocker.
- The weakest dimension is standards currency (48/100).

### Open findings that matter to a user

- **Register state.** 30 entries: 28 `draft`, 1 `superseded` and 1 `verified-current`. Draft entries cannot support final statutory output.
- **Open Uganda items.** Local service tax, withholding tax, the VAT registration threshold, PAYE (reviewer and archive) and the FY2026-27 EFRIS handbook. The Kenya, Rwanda, Tanzania and South Africa packs are skeletons.
- **Overdue rechecks.** Seven draft entries are past their recheck date. A recheck date moves only after the source has been read again.
  - Dated 2026-08-14: `KE-ETIMS-SKELETON`, `KE-VAT-SKELETON`, `UG-EFRIS-HANDBOOK-2024-25`, `UG-EXCHANGE-RATE-SOURCE-HIERARCHY`, `UG-INCOME-TAX-RULES` and `UG-VAT-RETURN-PACK-SOURCE`.
  - Dated 2026-10-27: `UG-LST-RATES`.
- **NSSF.** `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` is `verified-current`, but its `verifier` text records a page re-read and names no reviewer. The schema requires a named reviewer for that state. Until that changes, the lookup tool answers "final use allowed" for NSSF.
- **NSSF decision, still open.** Name a reviewer, or demote the entry to `verified-with-caveat` (item D5 in `06-next-cycle.md` of pass 2).
- **Not run.** Live-model routing, a Tier 3 behavioural run, a controller or professional review, Windows PowerShell 5.1, remote CI and a public marketplace test.

### Date-triggered gates

Checked on 2026-10-31 by running the checkers with a later date and by moving the entry's recheck date in a scratch copy.

| Date | What changes |
|---|---|
| 2026-11-17 | The NSSF entry passes its recheck date (2026-11-16). The integrity tool exits 1, two tests fail and the lookup refuses final use for NSSF. |
| 2026-11-29, 2026-12-26 and 2026-12-29 | Seven more draft entries pass their recheck dates (two, one and four entries). They add attention items only. |

- **2026-11-17 detail.** `python3 tools/source_register_integrity.py` exits 1 with `INT-008`. `test_live_register_has_no_integrity_errors` and `test_cli_exit_codes` in `tests/test_source_register_integrity.py` fail. `source_register_lookup.py` returns exit 3 (final use refused) for NSSF.
- **The PowerShell check was not run with a future date.** `tools/check-source-register.ps1` raises `SRC-005` in strict mode by its code. That code reads the system date and has no `--as-of` option.
- **Action for 2026-11-17.** Re-read the NSSF membership page, resolve the reviewer decision above, then move the recheck date.
- **Later dates.** With `--as-of 2026-12-30` the integrity tool reports no error other than the NSSF one. The lookup tool already refuses final use of any draft entry. Recheck each source before its date.
- 2026-12-29 is also the internal re-audit date of pass 2. It is not a statutory deadline.

## What the October 2026 kaizen improved

Two kaizen cycles ran in October 2026, on 29 October and on 31 October (pass 2). Both final reports record that no kept change was reverted. Every commit hash below was confirmed on `main` with `git show --stat`.

Unless an item says otherwise, its before and after counts were re-measured on 2026-10-31. The method was to run the stated command on the current tree and on archived copies of earlier commits. The [full account](docs/kaizen/2026-10-31-october-changes-detail.md) keeps the longer notes behind each item.

### Correctness and safety, most serious first

1. **The strict gate judges each register entry.** It read one state per file, so a `verified-current` entry nine months overdue passed with 0 findings. It now adds `SRC-010` and `SRC-011`, and register negative controls rose from 1 to 3 ([validation record](docs/kaizen/2026-10-engine-kaizen-pass-2/04-validation-record.md); PowerShell, not re-run here). `90323f5`
2. **The Uganda VAT threshold is corrected.** URA now states UGX 300,000,000 a year, not the UGX 150,000,000 of the July snapshot. The amending Act was not located, so `UG-VAT-REG-THRESHOLD` stays `draft`. A recheck date before its access date on `UG-VAT-STANDARD-RATE` is fixed. `666655c`
3. **Source keys resolve.** `references/uganda-statutory.md` cited 7 keys absent from the register, and the retail VAT and POS example mislabelled two entries. The integrity tool found 10 errors before pass 2 and 0 now. `cfed502`, `74df846`
4. **Damaged data-contract rows are restored (29 October).** Control bytes had replaced letters in four field names in 75 reference files. `tools/check-mojibake.ps1` now rejects them (`MOJIBAKE-003`). Scanning git trees found 75 damaged rows before and 0 after. `34a0874`
5. **Machine-specific paths are gone from active content.** Six lines in three files named drive-letter checkout paths. They now use catalogue wording, and `tools/check_machine_paths.py` guards active content. Dated records keep such paths by design (see [`docs/README.md`](docs/README.md)). `43e6fc5`, `f405a5b`, `dc8bd25`

### Skills and routing

6. **A worked example for an error found after close (29 October).** The IAS 8 and Section 10 skill holds a four-journal synthetic case: original entry, linked reversal, corrected posting and profit normalisation. A test checks that the journals balance. Amounts are fixture assumptions, tax and materiality are `NOT_ASSESSED`, and no IFRS professional reviewed it. `dba156a`, `9857cbb`, `7bc6a02`
7. **A better routing margin on the Section 10 skill.** A labelled fixture (`59ef4c0`) ranked the wrong skill first on its first run (margin -0.005). A clearer skill description raised that margin to +0.145. The proxy is a regression guard, not live routing. `3530f82`
8. **The source-register skill states the rules.** `tax-statutory-source-register-and-country-packs` gained four decision rules, a degraded-mode table and a fixture of 3 positive and 2 negative queries. Margins of +0.058 and +0.035 became +0.218 and +0.171. Skills fully compliant with the portable skill contract rose from 1 to 2 of 108. `dc592e7`

### New checks and tests

9. **Three Python checks run without PowerShell (pass 2).** `tools/source_register_integrity.py` (17 tests), `tools/check_machine_paths.py` (10) and `tools/route_proxy.py` (6) cover source keys, machine paths and routing labels. With item 1, they found four defects in live content (items 2, 3, 5 and 7). They are not registered in `.skills-engine/engine-manifest.yaml` or in CI. `cfed502`, `43e6fc5`, `3530f82`
10. **Packaging checks for Claude and Codex (29 October).** The cycle added Codex metadata, factual Claude plugin metadata, `tools/check-plugin-packaging.ps1` and `tools/check-package-file-count.ps1` (5,000-entry cap), each with negative controls. The evidence files record local installs that exposed 108 skills in both runtimes. Public marketplace acceptance was not tested. `3abc9b8`, `5f17618`
11. **Source observations were refreshed twice and nothing was promoted.** Notes were recorded on 29 October (`5048265`). The Uganda VAT, PAYE, WHT and NSSF pages and the IFRS pages were read again on 31 October (`666655c`). Entries past their recheck date fell from 10 to 8 in any state, and from 9 to 7 among drafts. `5048265`

### Documentation and handoff

12. **A Validation section and a corrected install command (31 October).** The README lists each check with its dependencies and the date-triggered gates (`4553cd5`, `d5113bb`). `bash install.sh` replaces `./install.sh`, which fails with "Permission denied" because the file has no executable bit.
13. **Guidance a fresh agent can follow.** `AGENTS.md` and the router explain how to run the Python checks without PowerShell (`2d0ed36`, `ca7140b`). [`docs/README.md`](docs/README.md) separates current documents from dated records (`b34416d`). [`07-docs-followups.md`](docs/kaizen/2026-10-engine-kaizen-pass-2/07-docs-followups.md) records eight follow-up items for their owners (`0041616`).

### Before and after

| Measure | 29 Oct start | 31 Oct start | Now | Basis |
|---|---:|---:|---:|---|
| Unit tests (`python3 -m unittest discover -s tests -p 'test_*.py'`) | 20 | 23 | 56 | Re-measured on archived `ff33ff1`, `7bc6a02` and the current tree. |
| Registered strict-gate checks | 12 | 17 | 17 | Re-measured: entries in `tools/validate-doctrine.ps1`. |
| Source-register negative-control fixtures | 1 | 1 | 3 | Re-measured: fixture directories. Results are in the evidence files. |
| Text rows with control bytes | 75 | 0 | 0 | Re-measured by scanning git trees. |
| Integrity errors (current tool over each tree) | 9 | 10 | 0 | Re-measured. The tool did not exist before pass 2. |
| Machine-specific path lines in active content | 6 | 6 | 0 | Re-measured with the current guard. |
| Register entries (draft among them) | 27 (25) | 29 (27) | 30 (28) | Re-measured. |
| Labelled routing cases (skills covered) | 0 | 5 (1) | 12 (2) | Re-measured by counting fixture cases. |
| Skills fully compliant with the portable contract | 1 of 108 | 1 of 108 | 2 of 108 | Re-measured with the read-only scanner of the skill-engine audit. |
| Active skills | 108 | 108 | 108 | Re-measured. |

How to read the scores:

- Scores are the cycle owner's evidence-bounded assessment, not an independent audit. In every case the raw mean is below 65, so raw and `min(raw, 65)` are equal.
- On 29 October the raw mean rose from 51.5 to 57.3 (capped: 51.5 to 57.3). That day's report also gives a separate initial-baseline cap of 45.
- The pass-2 baseline, frozen before any edit, was 56.4 raw and 56.4 capped. It ended at 58.2 and 58.2.
- The pass-2 baseline sits below the 29 October final because it measured things the earlier cycle had not checked (items 1 to 3, and the NSSF reviewer gap listed above).
- The means were recomputed from the dimension tables in the scorecards and final reports. None of this clears an open finding above: source, reviewer, live-routing, Tier 3 and CI gaps stand.

## References

The books, repositories, standards and official sources cited in this repository are listed in [`docs/cited-sources.md`](docs/cited-sources.md). Books are concept inputs only; no book content is stored here. Statutory values come from the source register, not from that list.

Internal doctrine sources: the [accounting and finance doctrine](doctrine/accounting-finance-doctrine.md), the [ledger invariants](doctrine/references/ledger-invariants.md), the [source-register schema](doctrine/source-register/schema.yaml) and the [reference manifest](docs/reference-manifest.md).

## Contributing and licence

Changes follow the working rules in [`AGENTS.md`](AGENTS.md) and the always-on rules in [`rules/`](rules/README.md). Run the checks in [Validation](#validation) before you propose a change.

Improvement work follows the cycle Observe, Baseline, Select, Experiment, Check, Standardise, Teach, Re-measure.

The licence is MIT; see [`LICENSE`](LICENSE). The author is Peter Bamuhigire of Chwezi Core Systems.
