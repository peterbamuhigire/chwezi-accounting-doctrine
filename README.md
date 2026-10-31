# Chwezi Accounting Doctrine

Chwezi Accounting Doctrine is the cross-cutting finance and accounting engine of the Chwezi skills portfolio. It holds a canonical accounting doctrine and 108 routed skills covering ledger design, IFRS and IFRS for SMEs recognition and measurement, subledgers, period close and consolidation, financial statements and disclosures, East African tax and statutory work, budgeting and costing, internal controls and fraud, sector and fund accounting, public-sector accounting, finance-system integration, security and continuity, and the controlled use of automation and AI in finance. It applies the IFRS Accounting Standards (IAS and IFRS, including IFRS 18), the IFRS for SMEs Accounting Standard (third edition) as the default framework for small and medium entities, IFRS S1 and S2, IPSAS, the IAASB International Standards on Auditing and ISQM, the IESBA Code of Ethics, the COSO Internal Control - Integrated Framework, the IIA Three Lines Model, the NIST Cybersecurity Framework and AI Risk Management Framework, WCAG 2.2, the FATF Recommendations, the OECD Transfer Pricing Guidelines and the GHG Protocol Corporate Standard. Jurisdiction-dependent values such as VAT, PAYE, NSSF, withholding tax, Local Service Tax and EFRIS requirements come only from a dated source register covering Uganda, Kenya, Rwanda, Tanzania and South Africa.

The engine produces accounting treatment analyses and judgement memos, accounting policy and chart-of-accounts designs, posting rules and journal packs, reconciliation and close playbooks, financial-statement and note-disclosure packs, audit-ready reporting packs with PBC evidence indexes, tax and payroll computations tied to source keys, internal-control libraries and risk-control matrices, finance-module audits and doctrine conformance scans of software, specifications and plans, and ready-to-paste finance prompts. It serves accountants, finance managers, auditors and reviewers, consultants, and the product and engineering teams who build systems that touch money, inventory, payroll, tax, grants or banking; other Chwezi engines call on it whenever their work has finance scope. Every output states its reporting basis, cites current support for statutory values, keeps an audit trail from source document to report, and corrects posted history only by reversal. Anything not verified is marked `NOT ASSESSED`, and final statutory output requires a named human reviewer under the finance quality gate.

## Installation

Prerequisites: Git; Node.js 18 or later for the installer scripts and the hook tests; Python 3.11 or later with PyYAML for the Python checks, the test suite and the Codex model-policy helper (use `python3` on Linux and macOS); Windows PowerShell 5.1 or PowerShell 7 (`pwsh`) for the principal doctrine gate. The Python checks do not need PowerShell. See [Validation](#validation) for what each command needs.

**Claude Code plugin (recommended).** The repository ships a marketplace and plugin manifest in `.claude-plugin/`:

```text
/plugin marketplace add peterbamuhigire/chwezi-accounting-doctrine
/plugin install accounting@chwezi-accounting
```

**Installer scripts.** Clone the repository and run the installer, which delegates to `scripts/install-engine.js`. It installs into `~/.claude` with `--scope user` (the default) or into `.claude` under the current directory with `--scope project`; `--dry-run` prints the plan without writing and `--json` gives machine-readable output.

```sh
git clone https://github.com/peterbamuhigire/chwezi-accounting-doctrine
cd chwezi-accounting-doctrine
bash install.sh --scope project --dry-run
bash install.sh --scope project
```

`install.sh` is committed without the executable bit, so run it through `bash`; `./install.sh` fails with "Permission denied". On Windows PowerShell, run `./install.ps1 --scope project`. Installed files are recorded in `.chwezi/install-state.json` under the target root, and `node scripts/install-engine.js doctor --scope project` checks an installation.

**Codex.** Codex reads [`AGENTS.md`](AGENTS.md) at the repository root. To install the local Codex plugin, run these commands from the repository root:

```sh
codex plugin marketplace add .
codex plugin add accounting@chwezi-accounting-doctrine-local
```

The local Codex catalogue name is `chwezi-accounting-doctrine-local`; the
plugin name is `accounting`. These are distinct from the Claude marketplace
name `chwezi-accounting` shown above. The Codex-only model-policy helper lives
in [`.codex/`](.codex/README.md): run `python3 <engine-root>/.codex/ensure_model_policy.py --runtime codex --check` (exit 1 with a `DRIFT` line when the Codex configuration is missing or differs), and use `--apply` only when it reports drift. Claude and other runners skip this step.

**Manual use.** Clone the repository and point the agent at this README and [`AGENTS.md`](AGENTS.md); `CLAUDE.md` imports `AGENTS.md`. Select skills through the [router map](docs/router-map.md) and read the chosen `SKILL.md` directly. To confirm a checkout is sound, follow [Validation](#validation).

## Validation

Run every command from the repository root; none of them modifies a tracked file. Every Python check needs PyYAML (`python3 -m pip install pyyaml`) except `tools/check_machine_paths.py`, which uses only the standard library. The suite is `unittest`-based, so `pytest` is optional: `python3 -m pytest tests` collects the same 56 tests. No registered check needs Pandoc, Mermaid, a browser or LibreOffice, and the 16 PowerShell checks that do not call Python passed with the network disabled.

**Python and Node checks (no PowerShell).** Verified on Linux on 2026-10-31.

| Command | What it checks | Passes when |
|---|---|---|
| `python3 -m unittest discover -s tests -p 'test_*.py'` | 56 tests over the source-register lookup and integrity tools, the machine-path guard, the routing proxy and its fixtures, skill frontmatter, the approval adapter, runtime orchestration guidance, the Section 10 example and the source-to-report fixture. | Exit 0. |
| `python3 tools/check_frontmatter_yaml.py --root .` | YAML frontmatter of all 108 skills. | Exit 0 and `"state": "pass"`. |
| `python3 tools/source_register_integrity.py` | Every register entry judged on its own (fields, state, recheck date, archive file) and every cited source key resolving. `--as-of YYYY-MM-DD` tests a future date; `--json` prints JSON. | Exit 0 means no errors; attention items are listed but do not fail. Exit 1 errors; exit 2 unreadable. |
| `python3 tools/check_machine_paths.py` | No drive letter, home directory or mount path in active content. | Exit 0. |
| `python3 tools/route_proxy.py --fixture tests/router-map/fixtures/section10-after-close.json` (and `source-register-skill.json`) | Tier-2 lexical routing regression over labelled queries. It is a regression guard, not live routing. | Exit 0: every case ranks its expected skill first by a margin of at least 0.05. |
| `python3 tools/source_register_lookup.py --jurisdiction UG --register paye --date 2026-10-15` | Which register entry applies on a date, and whether it may support final output. `--as-of DATE` sets the date of use. | Exit 0 final use allowed; 3 final use refused (a hard stop for statutory output); 2 no entry; 1 unreadable. The PAYE example exits 3 today because that entry is `draft`. |
| `python3 tests/agent-integration/test_accounting_agent_contract.py` | The `.skills-engine/engine-manifest.yaml` contract. It looks for a sibling `chwezi-engine-agents/catalog/engines.yaml` and prints `NOT ASSESSED` when that is absent. | Exit 0. |
| `node hooks/test-destructive-bash-gate.js` and `node hooks/test-plugin-hook-config.js` | The destructive-command gate (61 cases) and the hook configuration (7 cases). | Exit 0. |
| `node scripts/generate-plugin-manifest.js --engine . --check` | The Claude plugin manifest is current with the `skills/` directory (108 skills). | Exit 0. |

**The principal gate (PowerShell).** `pwsh -NoProfile -File tools/validate-doctrine.ps1 -Strict` (Windows PowerShell 5.1: `powershell -NoProfile -File tools/validate-doctrine.ps1 -Strict`) runs 17 registered checks and fails closed on a non-zero exit or missing JSON. They are mojibake, skill contracts, frontmatter YAML, advanced IFRS readiness, source register, links, repository discovery, router-map sync, accounting invariants, and negative controls for the router map, source register, validation state, mojibake, package file count and plugin packaging, plus the package-file-count and plugin-packaging checks themselves. `-Json` prints the report as JSON and `-ReportPath <file>` writes it.

- The frontmatter check calls `python` (not `python3`) and needs PyYAML. A host that has only `python3` fails the aggregate script at that check; provide a `python` command, or run `python3 tools/check_frontmatter_yaml.py --root .` directly.
- On Linux, install PowerShell 7, or run the checks in the `mcr.microsoft.com/powershell` image with the checkout mounted read-only. That image has no Python. On 2026-10-31 the 16 checks other than the frontmatter wrapper each ran there one by one with `-Json -Strict` and exited 0. The aggregate script itself was not run end to end on Linux, and Windows PowerShell 5.1 was not run in that cycle.
- CI (`.github/workflows/doctrine-validation.yml`) runs the unit tests and the strict gate on `windows-latest` with Python 3.12 and PyYAML. `.skills-engine/engine-manifest.yaml` registers only the strict gate, for Windows; the Python checks above are not registered there.

## Capabilities

The engine has 108 active skills in 17 categories, discovered from `skills/<category>/<skill>/SKILL.md`. There are no alias or template entries.

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

| Category | Skill | What it does |
|---|---|---|
| Foundations | [`chart-of-accounts-design-and-governance`](skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md) | Account taxonomy, normal balances, control-account ownership and CoA change control. |
| Foundations | [`functional-and-presentation-currency`](skills/01-foundations/functional-and-presentation-currency/SKILL.md) | Functional and presentation currency, translation method and FX gain/loss under IAS 21 and Section 30. |
| Foundations | [`ledger-posting-engine-core`](skills/01-foundations/ledger-posting-engine-core/SKILL.md) | Canonical posting service, journal schema, ledger invariants, reversals, idempotency and drilldown. |
| Foundations | [`management-accounting-dimensions`](skills/01-foundations/management-accounting-dimensions/SKILL.md) | Governed dimensions (cost centre, project, grant, branch) for budget, variance and allocation reporting. |
| Foundations | [`period-locking-and-data-immutability`](skills/01-foundations/period-locking-and-data-immutability/SKILL.md) | Period state machine, immutability of posted journals and audit-evidence retention. |
| IFRS core standards | [`ifrs-borrowing-costs-ias23`](skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md) | Capitalisation of borrowing costs on qualifying assets under IAS 23 and Section 25. |
| IFRS core standards | [`ifrs-conceptual-framework-and-accounting-judgements`](skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/SKILL.md) | Conceptual Framework, materiality and judgement documentation where no Standard applies directly. |
| IFRS core standards | [`ifrs-employee-benefits-ias19`](skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/SKILL.md) | Short-term, post-employment, long-term and termination benefits under IAS 19 and Section 28. |
| IFRS core standards | [`ifrs-financial-instruments`](skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md) | Classification, measurement, ECL impairment, derecognition and hedge accounting under IFRS 9 and IFRS 7. |
| IFRS core standards | [`ifrs-for-smes-equivalents`](skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/SKILL.md) | IFRS for SMEs as the default framework, cross-referenced to each full IFRS standard. |
| IFRS core standards | [`ifrs-foreign-currency-translation-ias21`](skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/SKILL.md) | Foreign-currency transactions and foreign operations, monetary items and CTA reserve under IAS 21. |
| IFRS core standards | [`ifrs-intangible-assets-ias38`](skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/SKILL.md) | Research versus development, internally generated intangibles and amortisation under IAS 38 and Section 18. |
| IFRS core standards | [`ifrs-leases`](skills/02-ifrs-core-standards/ifrs-leases/SKILL.md) | Lease identification, measurement, modification, sale-and-leaseback and lessor accounting under IFRS 16. |
| IFRS core standards | [`ifrs-property-plant-equipment-ias16`](skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md) | Componentisation, cost versus revaluation model, subsequent costs and derecognition under IAS 16. |
| IFRS core standards | [`ifrs-revenue-recognition`](skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md) | Five-step revenue recognition, contract balances, refunds and principal/agent under IFRS 15 and Section 23. |
| IFRS specialised standards | [`ias-agriculture`](skills/03-ifrs-specialised-standards/ias-agriculture/SKILL.md) | Biological assets and agricultural produce under IAS 41 and Section 34. |
| IFRS specialised standards | [`ias-government-grants`](skills/03-ifrs-specialised-standards/ias-government-grants/SKILL.md) | Government grants and assistance, conditions and donor restrictions under IAS 20 and Section 24. |
| IFRS specialised standards | [`ias-impairment`](skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md) | CGU allocation, goodwill, value in use, reversals and disclosure under IAS 36 and Section 27. |
| IFRS specialised standards | [`ias-income-tax-deferred-tax`](skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/SKILL.md) | Current and deferred tax, temporary differences and tax-rate reconciliation under Section 29 and IAS 12. |
| IFRS specialised standards | [`ias-provisions-contingencies`](skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md) | Provisions, onerous contracts, restructuring and contingencies under IAS 37 and Section 21. |
| IFRS specialised standards | [`ifrs-18-presentation-and-disclosures`](skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/SKILL.md) | IFRS 18 categories, required subtotals, management-defined performance measures and aggregation. |
| IFRS specialised standards | [`ifrs-accounting-policies-changes-errors-ias8`](skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md) | Policy changes, estimate changes and prior-period errors, including material errors discovered after close; read its worked example and canonical reversal pattern. |
| IFRS specialised standards | [`ifrs-associates-and-joint-arrangements`](skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/SKILL.md) | Equity method, joint operations and joint ventures under IAS 28 and IFRS 11. |
| IFRS specialised standards | [`ifrs-business-combinations-ifrs3`](skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/SKILL.md) | Acquisition method, goodwill, NCI measurement and bargain purchases under IFRS 3 and Section 19. |
| IFRS specialised standards | [`ifrs-discontinued-operations-ifrs5`](skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/SKILL.md) | Held-for-sale classification and discontinued-operation presentation under IFRS 5. |
| IFRS specialised standards | [`ifrs-earnings-per-share-ias33`](skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/SKILL.md) | Basic and diluted earnings per share under IAS 33. |
| IFRS specialised standards | [`ifrs-events-after-reporting-period-ias10`](skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md) | Adjusting and non-adjusting events and going-concern reassessment under IAS 10 and Section 32. |
| IFRS specialised standards | [`ifrs-fair-value-measurement-ifrs13`](skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md) | Valuation techniques, fair-value hierarchy and disclosures under IFRS 13. |
| IFRS specialised standards | [`ifrs-first-time-adoption-ifrs1`](skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/SKILL.md) | Opening IFRS balance sheet, exceptions, exemptions and reconciliations under IFRS 1. |
| IFRS specialised standards | [`ifrs-insurance-contracts-ifrs17`](skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/SKILL.md) | GMM, PAA and VFA measurement and CSM mechanics under IFRS 17. |
| IFRS specialised standards | [`ifrs-investment-property-ias40`](skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/SKILL.md) | Cost versus fair-value model, transfers and disclosure under IAS 40 and Section 16. |
| IFRS specialised standards | [`ifrs-related-party-disclosures-ias24`](skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/SKILL.md) | Related-party identification, balances and key management compensation under IAS 24. |
| IFRS specialised standards | [`ifrs-segment-reporting-ifrs8`](skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/SKILL.md) | CODM identification, aggregation criteria and segment reconciliations under IFRS 8. |
| IFRS specialised standards | [`ifrs-share-based-payment-ifrs2`](skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/SKILL.md) | Equity- and cash-settled share-based payments, vesting and modifications under IFRS 2. |
| Subledgers and operations | [`bank-and-mobile-money-reconciliation`](skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/SKILL.md) | Bank, mobile-money, card settlement and clearing-account reconciliation workflows. |
| Subledgers and operations | [`expense-management-and-staff-claims`](skills/04-subledgers-and-operations/expense-management-and-staff-claims/SKILL.md) | Staff expense, advance and claim workflows with VAT recovery and reimbursement posting. |
| Subledgers and operations | [`fixed-assets-and-depreciation`](skills/04-subledgers-and-operations/fixed-assets-and-depreciation/SKILL.md) | Fixed-asset register, capitalisation policy, depreciation, disposals and GL tie-out. |
| Subledgers and operations | [`inventory-costing-and-stock-accounting`](skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/SKILL.md) | FIFO or weighted-average costing, counts, shrinkage, NRV write-downs and COGS postings. |
| Subledgers and operations | [`payroll-and-statutory-postings-east-africa`](skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/SKILL.md) | Gross-to-net payroll, PAYE, NSSF, LST and payroll-to-GL reconciliation for East Africa. |
| Subledgers and operations | [`petty-cash-and-imprest-management`](skills/04-subledgers-and-operations/petty-cash-and-imprest-management/SKILL.md) | Petty-cash and imprest floats, replenishment, surprise counts and postings. |
| Subledgers and operations | [`pos-and-cash-drawer-management`](skills/04-subledgers-and-operations/pos-and-cash-drawer-management/SKILL.md) | Opening float, X/Z reads, blind cash-up, variance triage and POS-to-GL reconciliation. |
| Receivables, payables and treasury | [`accounts-payable-and-supplier-management`](skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/SKILL.md) | Supplier master data, three-way match, payment runs and AP control tie-out. |
| Receivables, payables and treasury | [`accounts-receivable-and-credit-management`](skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/SKILL.md) | Credit limits, ageing, dunning, write-off and simplified ECL on trade receivables. |
| Receivables, payables and treasury | [`banking-facilities-and-covenants`](skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/SKILL.md) | Debt facilities, drawdowns, interest accrual, covenant tests and breach disclosure. |
| Receivables, payables and treasury | [`cash-flow-forecasting-and-treasury`](skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/SKILL.md) | 13-week and longer cash forecasts, cash positioning, sweeps and cash pooling. |
| Receivables, payables and treasury | [`fx-management-and-hedging`](skills/05-receivables-payables-and-treasury/fx-management-and-hedging/SKILL.md) | FX exposure, forwards, hedge documentation and hedge-accounting eligibility under IFRS 9. |
| Close, consolidation and reporting | [`advanced-ifrs-consolidated-statements-review`](skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md) | Review of consolidated statements under IFRS 10, 11, 12 and IAS 28, including NCI and eliminations. |
| Close, consolidation and reporting | [`audit-pbc-and-evidence-management`](skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/SKILL.md) | Auditor PBC request log, evidence index, sampling support and reviewer trail. |
| Close, consolidation and reporting | [`audit-ready-reporting-pack`](skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md) | Minimum audit-ready report set, drilldown chain, auditor export, sign-off and release governance. |
| Close, consolidation and reporting | [`consolidation-and-intercompany`](skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/SKILL.md) | Entity hierarchy, intercompany matching, elimination journals and group trial balance. |
| Close, consolidation and reporting | [`continuous-close-and-flash-reporting`](skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/SKILL.md) | Continuous-close cadence, subledger locks, flash P&L and exception escalation. |
| Close, consolidation and reporting | [`finance-module-audit`](skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md) | Audit of any software, SRS or workflow that touches money, tax, payroll or accounting records. |
| Close, consolidation and reporting | [`month-end-and-year-end-close-playbook`](skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/SKILL.md) | Close task list, evidence, reviewer sign-off, period transitions and retained-earnings close. |
| Close, consolidation and reporting | [`opening-balances-and-migration-playbook`](skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/SKILL.md) | Cutover from legacy systems: conversion date, CoA mapping, opening TB and subledgers. |
| Financial statements and disclosures | [`cash-flow-statement-ias7`](skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/SKILL.md) | Statement of cash flows, direct and indirect methods and non-cash transactions under IAS 7. |
| Financial statements and disclosures | [`financial-statements-preparation`](skills/07-financial-statements-and-disclosures/financial-statements-preparation/SKILL.md) | The four primary statements, IFRS 18 categories, comparatives and restatements. |
| Financial statements and disclosures | [`going-concern-and-viability-assessment`](skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/SKILL.md) | Going-concern and viability assessments, sensitivities and emphasis-of-matter triggers. |
| Financial statements and disclosures | [`integrated-and-sustainability-reporting-s1-s2`](skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/SKILL.md) | Sustainability and climate disclosures under IFRS S1 and IFRS S2. |
| Financial statements and disclosures | [`notes-and-disclosure-pack`](skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/SKILL.md) | Accounting policies, judgements, estimates and standard-specific note disclosures. |
| Financial statements and disclosures | [`published-ifrs-financial-statement-analysis`](skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md) | Analysis of published IFRS statements for performance, liquidity, gearing and accounting risk. |
| Tax and statutory | [`e-invoicing-and-fiscal-device-integration`](skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/SKILL.md) | Legacy e-invoicing and fiscal-device route that forwards to electronic fiscal taxing. |
| Tax and statutory | [`electronic-fiscal-taxing`](skills/08-tax-and-statutory/electronic-fiscal-taxing/SKILL.md) | E-invoicing, e-receipting and fiscal-device controls, with Uganda EFRIS references. |
| Tax and statutory | [`indirect-tax-vat-mechanics`](skills/08-tax-and-statutory/indirect-tax-vat-mechanics/SKILL.md) | Place of supply, reverse charge, input VAT recovery and partial exemption. |
| Tax and statutory | [`tax-statutory-source-register-and-country-packs`](skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md) | Source-register and country-pack behaviour for Uganda, Kenya, Rwanda, Tanzania and South Africa. |
| Tax and statutory | [`transfer-pricing-documentation`](skills/08-tax-and-statutory/transfer-pricing-documentation/SKILL.md) | Master file, local file, CbC thresholds and benchmarking evidence. |
| Tax and statutory | [`withholding-tax-and-treaties`](skills/08-tax-and-statutory/withholding-tax-and-treaties/SKILL.md) | Domestic withholding rates, treaty relief, certificates and supplier gross-up. |
| Budgeting, FP&A and costing | [`budgeting-and-rolling-forecasts`](skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/SKILL.md) | Annual budgets, rolling and driver-based forecasts and budget-versus-actual. |
| Budgeting, FP&A and costing | [`cost-accounting-methods`](skills/09-budgeting-fpa-and-costing/cost-accounting-methods/SKILL.md) | Standard, job-order, process, ABC and absorption versus marginal costing. |
| Budgeting, FP&A and costing | [`pricing-discounts-rebates-and-refunds`](skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/SKILL.md) | Pricing, discount, rebate, refund and chargeback mechanics under IFRS 15. |
| Budgeting, FP&A and costing | [`scenario-and-sensitivity-modelling`](skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/SKILL.md) | Scenario, sensitivity and stress modelling with an assumption catalogue. |
| Budgeting, FP&A and costing | [`variance-analysis-and-kpi-reporting`](skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/SKILL.md) | Price, volume, mix and efficiency variances, KPI cascades and management commentary. |
| Controls, governance and fraud | [`aml-kyc-and-suspicious-transaction-reporting`](skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/SKILL.md) | Customer due diligence, sanctions screening and suspicious-transaction reporting. |
| Controls, governance and fraud | [`engagement-quality-and-plain-language-output`](skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/SKILL.md) | Preparer-reviewer-approver governance, independence checks and plain-language client output. |
| Controls, governance and fraud | [`finance-doctrine-conformance-scanner`](skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md) | Scans systems, code, plans and documents against the doctrine and ranks gaps by risk. |
| Controls, governance and fraud | [`forensic-accounting-and-anti-fraud`](skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/SKILL.md) | Red-flag library, Benford analysis, journal-entry testing and incident response. |
| Controls, governance and fraud | [`internal-controls-library`](skills/10-controls-governance-and-fraud/internal-controls-library/SKILL.md) | Segregation of duties, maker-checker, approval thresholds and master-data controls. |
| Controls, governance and fraud | [`kaizen-engine-and-product-improvement`](skills/10-controls-governance-and-fraud/kaizen-engine-and-product-improvement/SKILL.md) | Kaizen audit and improvement of this engine and the finance products it produces. |
| Controls, governance and fraud | [`sox-style-icfr-documentation`](skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/SKILL.md) | Process narratives, risk-control matrices, walkthroughs and ICFR testing. |
| Controls, governance and fraud | [`whistleblowing-and-finance-ethics`](skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/SKILL.md) | Whistleblowing intake, ethics escalation, conflict registers and code attestation. |
| Sector and fund accounting | [`agribusiness-and-cooperative-pack`](skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/SKILL.md) | Out-grower schemes, cooperatives, member equity, patronage refunds and crop costing. |
| Sector and fund accounting | [`clinic-and-healthcare-accounting-pack`](skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/SKILL.md) | Patient accounts, payer mix, claim adjudication and healthcare revenue. |
| Sector and fund accounting | [`fintech-and-payments-pack`](skills/11-sector-and-fund-accounting/fintech-and-payments-pack/SKILL.md) | Float and trust accounts, settlement, scheme fees and customer-money safeguarding. |
| Sector and fund accounting | [`hospitality-and-restaurant-pack`](skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/SKILL.md) | Room nights, packages, recipe costing, service charges and daily hospitality close. |
| Sector and fund accounting | [`ngo-and-fund-accounting`](skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/SKILL.md) | Restricted and unrestricted funds, multi-currency grants and donor reporting. |
| Sector and fund accounting | [`real-estate-and-property-pack`](skills/11-sector-and-fund-accounting/real-estate-and-property-pack/SKILL.md) | Deposits, lease incentives, service charges and IAS 40/16/2 classification. |
| Sector and fund accounting | [`retail-and-pos-accounting-pack`](skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/SKILL.md) | Multi-outlet retail: day-end, settlement, markdowns, returns, loyalty and shrinkage. |
| Sector and fund accounting | [`school-and-education-accounting-pack`](skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/SKILL.md) | Fee billing, bursaries, term accruals, capitation grants and parent statements. |
| Public sector and IPSAS | [`donor-funded-project-fiscal-compliance`](skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/SKILL.md) | Donor eligibility, ineligible-cost recovery, audit clauses and donor templates. |
| Public sector and IPSAS | [`government-procurement-and-fiscal-controls`](skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/SKILL.md) | PPDA procurement, vote books, commitment accounting and treasury single account. |
| Public sector and IPSAS | [`ipsas-public-sector-overlay`](skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/SKILL.md) | IPSAS accrual and cash basis, IPSAS-to-IFRS deltas and budget reporting. |
| Project and contract accounting | [`construction-contract-accounting`](skills/13-project-and-contract-accounting/construction-contract-accounting/SKILL.md) | Retentions, variations, claims, advances and milestone certificates. |
| Project and contract accounting | [`professional-services-time-and-materials`](skills/13-project-and-contract-accounting/professional-services-time-and-materials/SKILL.md) | Utilisation, realisation, WIP and unbilled receivables for services firms. |
| Project and contract accounting | [`project-and-contract-accounting`](skills/13-project-and-contract-accounting/project-and-contract-accounting/SKILL.md) | Over-time and point-in-time recognition, input and output methods and contract balances. |
| Systems integration and data | [`bank-feed-and-payment-gateway-integration`](skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/SKILL.md) | Bank feeds, gateways and mobile-money APIs with replay, deduplication and posting safety. |
| Systems integration and data | [`erp-and-finance-system-integration-patterns`](skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/SKILL.md) | Master-data sync, event versus batch, idempotency and reconciliation watchers. |
| Systems integration and data | [`finance-data-contracts-and-warehouse-models`](skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/SKILL.md) | Conformed dimensions, slowly changing CoA and warehouse reconciliation to the GL. |
| Systems integration and data | [`open-banking-and-direct-debit-mandates`](skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/SKILL.md) | Open-banking aggregators, direct-debit mandates and recurring authorisations. |
| Security, privacy and continuity | [`business-continuity-and-disaster-recovery-finance`](skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/SKILL.md) | RPO/RTO per finance system, payroll and payment fallback and tabletop tests. |
| Security, privacy and continuity | [`finance-cybersecurity-controls`](skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/SKILL.md) | Identity, MFA, privileged posting access, secret rotation and payment hardening. |
| Security, privacy and continuity | [`finance-data-privacy-and-retention`](skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/SKILL.md) | Finance data classification, retention, lawful basis and cross-border transfer. |
| UX and presentation | [`finance-accessibility-and-inclusive-design`](skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/SKILL.md) | Keyboard parity, screen-reader ledger tables and colour-independent states. |
| UX and presentation | [`finance-mobile-and-offline-patterns`](skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/SKILL.md) | Deferred posting queues, conflict resolution and offline evidence capture. |
| UX and presentation | [`finance-ui-pattern-library`](skills/16-ux-and-presentation/finance-ui-pattern-library/SKILL.md) | Finance UI tokens, role-conditioned shell, drilldown, money cells and print styles. |
| UX and presentation | [`finance-ux-for-non-accountants`](skills/16-ux-and-presentation/finance-ux-for-non-accountants/SKILL.md) | Workflow-first UX for cashiers, clerks and managers with safe exception handling. |
| AI, automation and emerging practice | [`ai-in-finance-governance`](skills/17-ai-automation-and-emerging/ai-in-finance-governance/SKILL.md) | Model registry, human-in-the-loop checkpoints, evaluation and audit trail for AI in finance. |
| AI, automation and emerging practice | [`carbon-and-emissions-accounting`](skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/SKILL.md) | Carbon allowances, offsets and Scope 1/2/3 emissions data for disclosures. |
| AI, automation and emerging practice | [`digital-assets-and-crypto-accounting`](skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/SKILL.md) | Digital-asset classification, measurement, custody and disclosure. |
| AI, automation and emerging practice | [`rpa-and-automation-controls-for-finance`](skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/SKILL.md) | Bot identity, segregation of duties, kill-switch and exception routing for automations. |

## Routing and use

This README is the engine's router in the portfolio routing table. Route every finance request in this order:

1. **Doctrine first.** Read [`AGENTS.md`](AGENTS.md) and the [accounting and finance doctrine](doctrine/accounting-finance-doctrine.md). The doctrine is the authority for recognition, measurement, posting, reporting basis, controls and professional review. If the working project root holds a `PROJECT.md` with `project_schema: 1`, read it before planning.
2. **Select the skill.** Use the filesystem-derived [router map](docs/router-map.md), or the table above, to choose the skill by transaction and reporting question, starting from the current entries in the [skills directory](skills/). Load [`rules/common/core.md`](rules/common/core.md) alongside it for any non-trivial task.
3. **Fix the reporting basis.** Every finance artefact names its framework. Under the [policy hierarchy](doctrine/references/policy-hierarchy.md) the client's selection prevails; otherwise SMEs, NGOs and micro-enterprises default to IFRS for SMEs, public-interest entities to full IFRS, and public-sector bodies follow the [IPSAS overlay](skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/SKILL.md). With no basis, final output is refused.
4. **Verify statutory values.** Tax, payroll, e-invoicing and exchange-rate values come only from [`doctrine/source-register/`](doctrine/source-register/) and the [IFRS, tax and statutory source register](docs/source-registers/ifrs-tax-statutory-2026.md). Entries in `draft`, `stale`, `superseded` or `no-source-found` state cannot support final statutory output.
5. **Apply the gate.** Apply the [finance and accounting quality gate](governance/finance-accounting-quality-gate.md) whenever the work has finance scope. It returns `pass`, `pass-with-caveats` (internal drafts only) or `fail`; missing verification is `NOT ASSESSED`.

Boundaries: the engine gives no professional tax or audit opinion; it does not post to live ledgers, file returns or change controls without explicit approval; and it never treats books as authority for current standards, rates or law. The visual presentation of finance artefacts follows the design engine (`chwezi-design-engine`, formerly the local directory `design-system-skills`), and evidence for current facts follows the digital research engine (catalogue id `digital-research-skills`; its GitHub repository is `chwezi-research-engine`). Resolve both through the active engine-routing table or `chwezi-engine-agents/catalog/engines.yaml`, not through a fixed path. For multi-phase work, follow the [runtime-agnostic orchestration contract](docs/operations/runtime-agnostic-orchestration-2026-09-07.md): bounded work packages, accounting checkpoints, context hygiene and sanitised handling of imported content.

## DOMAIN PROMPT GENERATION CONTRACT

For a prompt handoff, read the local [domain prompt contract](docs/ai-prompting/domain-prompt-compilation-contract.md). Generate a ready-to-paste finance prompt with entity, period, jurisdiction, reporting basis, source documents, accounting question, treatment, controls, audit trail, reconciliation, reviewer, and acceptance checks. Never invent rates, standards, statutory values, or assurance. **Ready-to-paste prompt:** include source/period assumptions and NOT ASSESSED gaps. **Failure action:** stop and obtain the missing source or reviewer, or revise one treatment field.

## Quality and improvement

The engine improves through dated kaizen cycles. Each cycle keeps its evidence in seven files: scope and evidence, baseline scorecard, backlog, experiment log, validation record, final report and next cycle.

- [`docs/kaizen/2026-10-engine-kaizen-pass-2/`](docs/kaizen/2026-10-engine-kaizen-pass-2/) holds the latest cycle (31 October 2026). Start with its [final report](docs/kaizen/2026-10-engine-kaizen-pass-2/05-final-report.md) and [next cycle](docs/kaizen/2026-10-engine-kaizen-pass-2/06-next-cycle.md).
- [`docs/kaizen/2026-10-engine-kaizen/`](docs/kaizen/2026-10-engine-kaizen/) holds the cycle of 29 October 2026.
- Earlier records are in [`docs/kaizen/2026-08-27-advanced-ifrs/`](docs/kaizen/2026-08-27-advanced-ifrs/), [`docs/audits/`](docs/audits/) and [`docs/continuous-improvement/`](docs/continuous-improvement/). The [documentation index](docs/README.md) lists the rest of `docs/`.

**Latest published score.** At the end of pass 2 the raw mean is 58.2/100 and the published capped score is 58.2/100 (`min(raw, 65)`). On 29 October the raw mean was 57.3/100 and the capped score 57.3/100. These are the cycle owner's evidence-bounded assessment, not an independent audit, and the cap does not clear any source, legal, financial or release blocker. The weakest dimension is standards currency (48/100).

**Open findings that matter to a user.**

- The source register holds 30 entries: 28 `draft`, 1 `superseded` and 1 `verified-current`. Draft entries cannot support final statutory output. Uganda local service tax, withholding tax, the VAT registration threshold, PAYE (reviewer and archive) and the FY2026-27 EFRIS handbook remain open, and the Kenya, Rwanda, Tanzania and South Africa packs are skeletons.
- Seven draft entries are past their recheck date: `KE-ETIMS-SKELETON`, `KE-VAT-SKELETON`, `UG-EFRIS-HANDBOOK-2024-25`, `UG-EXCHANGE-RATE-SOURCE-HIERARCHY`, `UG-INCOME-TAX-RULES` and `UG-VAT-RETURN-PACK-SOURCE` (all 2026-08-14), and `UG-LST-RATES` (2026-10-27). A recheck date moves only after the source has been read again.
- `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` is marked `verified-current`, but its `verifier` text records a page re-read and names no reviewer, and the schema requires a named reviewer for that state. Until that changes, the lookup tool answers "final use allowed" for NSSF. The decision (name a reviewer, or demote the entry to `verified-with-caveat`) is open; see `06-next-cycle.md` of pass 2, item D5.
- Not run: live-model routing, a Tier 3 behavioural run, a controller or professional review, Windows PowerShell 5.1, remote CI and a public marketplace test.

**Date-triggered gates.** Checked on 2026-10-31 by running the checkers with a later date and by moving the entry's recheck date in a scratch copy.

| Date | What changes | Action |
|---|---|---|
| 2026-11-17 | The NSSF entry passes its recheck date (2026-11-16). `python3 tools/source_register_integrity.py` exits 1 with `INT-008`; `test_live_register_has_no_integrity_errors` and `test_cli_exit_codes` in `tests/test_source_register_integrity.py` fail; `source_register_lookup.py` returns exit 3 (final use refused) for NSSF. `tools/check-source-register.ps1` raises `SRC-005` in strict mode by its code, which reads the system date and has no `--as-of` option, so that check was not run with a future date. | Re-read the NSSF membership page, resolve the reviewer decision above, then move the recheck date. |
| 2026-11-29, 2026-12-26 and 2026-12-29 | Seven more draft entries pass their recheck dates (two, one and four entries). They add attention items only; with `--as-of 2026-12-30` the integrity tool reports no error other than the NSSF one. The lookup tool already refuses final use of any draft entry. | Recheck each source before the date. 2026-12-29 is also the internal re-audit date of pass 2, not a statutory deadline. |

## References

The sources below are those cited in this repository: skill `references/source-basis.md` files, the source registers, the July 2026 upgrade records, Kaizen records and commit attributions. Books are concept inputs only; no book content is stored here.

### Books

- ACCA (2025) *Financial Reporting*, June 2025 study material.
- COSO (2013) *Internal Control - Integrated Framework*.
- IAASB *Handbook of International Quality Management, Auditing, Review, Other Assurance, and Related Services Pronouncements*, 2023-2024 edition.
- IFRS Foundation (2025) *IFRS for SMEs Accounting Standard*, third edition.
- Kaplan, R. S., Atkinson, A. A., Matsumura, E. M. and Young, S. M. *Management Accounting*, 6th edition.
- Pai, R., Chattopadhyay, G. and Gibbs, A. (eds.) *Advances in Intelligent Asset Management and Maintenance*.
- Umbrex *Finance Department - The Umbrex Diagnostic Guide*.
- *How the Banking & Financial Services Industry Works*.
- *F7 Sample Notes 2025* (IFRS teaching notes).
- Sanjeev Mohan and Stéphane Duguin, cited by author only in the 2026-09-01 book-driven Kaizen record (AI data products; civil-society cyber resilience).
- Listed for later deepening in the July 2026 reading list: PKF / Wiley *Wiley IFRS*; Schilit, H. *Financial Shenanigans*.

### Repositories

- Chwezi Accounting Doctrine - https://github.com/peterbamuhigire/chwezi-accounting-doctrine - MIT - this engine.
- nextlevelbuilder/ui-ux-pro-max-skill - https://github.com/nextlevelbuilder/ui-ux-pro-max-skill - MIT - retrieval pattern (commit `09170ee`) adapted for the read-only source-register effective-date lookup `tools/source_register_lookup.py`, which refuses final use of draft or superseded entries (my-10-kaizen UX-13).
- pbakaus/impeccable - https://github.com/pbakaus/impeccable - Apache-2.0 - portfolio `PROJECT.md` context contract (my-10-kaizen IM-11), adopted as the read-before-planning rule in `AGENTS.md`.
- DietrichGebert/ponytail - https://github.com/DietrichGebert/ponytail - MIT - host-file drift-detection pattern (my-10-kaizen PT-01 to PT-04) behind the thin `CLAUDE.md` bridge and version 1.1.0 alignment.
- affaan-m/ECC - https://github.com/affaan-m/ECC - scoped-worker, longform and security guides synthesised in the runtime-agnostic orchestration contract; symlink resolution, path handling and scope choice in `install.sh`, `install.ps1` and `scripts/install-engine.js`.
- donvito/codex-astra-luna-orchestrator - https://github.com/donvito/codex-astra-luna-orchestrator - concept reference for the Codex model-policy adapter in `.codex/` (inspected at `21f4561`; independently implemented).
- peterbamuhigire/chwezi-research-engine (catalogue id `digital-research-skills`) - https://github.com/peterbamuhigire/chwezi-research-engine - Kaizen currentness gate applied to engine maintenance.

### Standards and official sources

- IFRS Foundation: IFRS Accounting Standards Required 2026; Conceptual Framework; IAS 7, 23, 36 and 37; IFRS 7, 8, 9, 10, 11, 12, 13, 15, 16 and 18; supporting materials by Standard; IFRS for SMEs Accounting Standard; IFRS Sustainability Disclosure Standards S1 and S2 - https://www.ifrs.org
- IPSASB standards and pronouncements - https://www.ipsasb.org/standards-pronouncements
- IAASB International Standards on Auditing and quality management, 2025 Handbook - https://www.iaasb.org
- IESBA International Code of Ethics for Professional Accountants - https://www.ethicsboard.org
- COSO Internal Control - Integrated Framework (2013).
- The Institute of Internal Auditors, Three Lines Model (2020) - https://www.theiia.org
- NIST Cybersecurity Framework - https://www.nist.gov/cyberframework
- NIST AI Risk Management Framework - https://www.nist.gov/itl/ai-risk-management-framework
- W3C Web Content Accessibility Guidelines 2.2 - https://www.w3.org/TR/WCAG22/
- FATF Recommendations - https://www.fatf-gafi.org
- OECD Transfer Pricing Guidelines for Multinational Enterprises and Tax Administrations 2022 - https://www.oecd.org
- Greenhouse Gas Protocol Corporate Accounting and Reporting Standard - https://ghgprotocol.org/corporate-standard
- World Bank Procurement Regulations for IPF Borrowers, September 2023 - https://thedocs.worldbank.org
- Uganda Revenue Authority: PAYE rates, employment income, withholding tax, VAT registered category, FY 2026/27 tax amendments, Income Tax (Amendment) Act 2026 effective-date and PAYE return notices, Taxation Handbook FY 2024-25, EFRIS pages and EFRIS Handbook 2024/25 - https://ura.go.ug
- URA EFRIS technical corpus supplied by the client: Interface User Requirement Specifications v1.5; Interface Design for EFRIS v24.0.1; System to System API guide V3 and integration guide; Offline Mode Enabler requirements and installation guide v1.6; device and thumbprint registration guide; Taxpayers Training Material v2.
- Parliament of Uganda bill tracker and Hansard - https://www.parliament.go.ug
- National Social Security Fund Uganda - https://www.nssfug.org
- Uganda Local Governments Act via ULII - https://ulii.org; Kampala Capital City Authority Local Service Tax guidance - https://kcca.go.ug
- Uganda public financial management framework: Constitution; Public Finance Management Act 2015; PFM Regulations 2016; Treasury Instructions 2017; Local Governments Act 1997 and Local Governments (Financial and Accounting) Regulations 2007; PPDA Act 2003 (as amended) and PPDA Regulations 2023; MOFPED Financial Reporting Guide 2024.
- ICPAU IFRS for SMEs implementation guidelines - https://www.icpau.co.ug; IFAC Uganda profile - https://www.ifac.org
- Kenya Revenue Authority VAT and eTIMS - https://www.kra.go.ke
- ISO 4217 currency codes; ISO 8601 date format; ISO/IEC 27001; PCI DSS.

### Websites and articles

- OpenAI model, release-note and image-prompting documentation - https://platform.openai.com, https://openai.com, https://developers.openai.com - cited in the Codex model-currentness record and the shared domain prompt contract.
- Uganda NGO and CSO financial-management manuals synthesised for the NGO pack: UCOBAC Finance and Accounting Manual; MCLD Uganda Financial Management Policy (May 2023); IMAU Accounting Manual.
- Umbrex retail playbook synthesis, cited by the retail and POS pack.
- Internal doctrine sources: [accounting and finance doctrine](doctrine/accounting-finance-doctrine.md), [ledger invariants](doctrine/references/ledger-invariants.md), [source-register schema](doctrine/source-register/schema.yaml) and [reference manifest](docs/reference-manifest.md).
