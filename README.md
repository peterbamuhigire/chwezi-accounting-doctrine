# Chwezi Accounting Doctrine

Chwezi Accounting Doctrine is a finance and accounting skills engine for applying accounting policy, standards, controls, and operating practice in professional work and finance software. Its doctrine routes by transaction and reporting question across IFRS and IFRS for SMEs, specialised standards, IPSAS, tax and statutory work, subledgers, reporting, sector accounting, integrations, security, and automation.

The engine serves accountants, finance teams, reviewers, consultants, and product/engineering teams whose work affects money, inventory, payroll, tax, grants, banking, or accounting records. It produces accounting analyses, policy and control procedures, reconciliations, reporting requirements, implementation guidance, and review evidence. It requires an explicit reporting basis, current support for jurisdiction-dependent values, traceable evidence and approval, and reversible corrections to posted history; missing verification remains `NOT ASSESSED` under the finance quality gate.

## Installation

For Claude Code, install the Accounting plugin from its marketplace:

```text
/plugin marketplace add peterbamuhigire/chwezi-accounting-doctrine
/plugin install accounting@chwezi-accounting
```

For a local clone, run the included installer with Node.js 18 or later:

```sh
git clone https://github.com/peterbamuhigire/chwezi-accounting-doctrine
cd chwezi-accounting-doctrine
./install.sh --scope project
```

On Windows PowerShell, run `./install.ps1 -scope project`. The wrappers expose scope and dry-run options; consult their help before installing. This engine is independently installable. Other Chwezi engines route finance questions here when relevant.

## Skills

| Category | Skill routes | Coverage |
|---|---|---|
| Foundations and IFRS | [`01-foundations/`](skills/01-foundations/), [`02-ifrs-core-standards/`](skills/02-ifrs-core-standards/), [`03-ifrs-specialised-standards/`](skills/03-ifrs-specialised-standards/) | Chart of accounts, ledger architecture, dimensions and currency; IFRS core and specialised standards, including IFRS for SMEs. |
| Subledgers and treasury | [`04-subledgers-and-operations/`](skills/04-subledgers-and-operations/), [`05-receivables-payables-and-treasury/`](skills/05-receivables-payables-and-treasury/) | Assets, inventory, payroll, POS and cash, expenses, bank/mobile-money reconciliation, receivables, payables, cash flow, and FX. |
| Close and reporting | [`06-close-consolidation-and-reporting/`](skills/06-close-consolidation-and-reporting/), [`07-financial-statements-and-disclosures/`](skills/07-financial-statements-and-disclosures/) | Period close, consolidation, audit evidence, financial statements, disclosures, and reporting packs. |
| Tax and planning | [`08-tax-and-statutory/`](skills/08-tax-and-statutory/), [`09-budgeting-fpa-and-costing/`](skills/09-budgeting-fpa-and-costing/) | Tax and statutory obligations, budgeting, FP&A, costing, and pricing-related accounting. |
| Controls and sector accounting | [`10-controls-governance-and-fraud/`](skills/10-controls-governance-and-fraud/), [`11-sector-and-fund-accounting/`](skills/11-sector-and-fund-accounting/), [`12-public-sector-and-ipsas/`](skills/12-public-sector-and-ipsas/), [`13-project-and-contract-accounting/`](skills/13-project-and-contract-accounting/) | Governance, fraud controls, public-sector and fund accounting, industry packs, and project/contract accounting. |
| Systems and emerging practice | [`14-systems-integration-and-data/`](skills/14-systems-integration-and-data/), [`15-security-privacy-and-continuity/`](skills/15-security-privacy-and-continuity/), [`16-ux-and-presentation/`](skills/16-ux-and-presentation/), [`17-ai-automation-and-emerging/`](skills/17-ai-automation-and-emerging/) | Finance data, ERP and payment integration, security, privacy, continuity, accessible presentation, AI, automation, crypto, and carbon accounting. |

The category counts total 108 discovered skill files. Use the [router map](docs/router-map.md) to select current entries from the [skills directory](skills/); apply the [finance and accounting quality gate](governance/finance-accounting-quality-gate.md) whenever the work has finance scope.

## References

- [Chwezi Accounting Doctrine source repository](https://github.com/peterbamuhigire/chwezi-accounting-doctrine)
- [Accounting and finance doctrine](doctrine/accounting-finance-doctrine.md)
- [Finance and accounting quality gate](governance/finance-accounting-quality-gate.md)
- [Skill router map](docs/router-map.md)
- [Repository operating guide](AGENTS.md)
- [Installer scripts](install.sh), [Windows installer](install.ps1)
