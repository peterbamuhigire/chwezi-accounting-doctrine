# Chwezi Accounting & Finance Doctrine

Canonical accounting and finance doctrine for the Chwezi Core Systems skills engine. This staging tree is the single source from which the four skill engines (`skills-web-dev` at `C:\Users\Peter\.claude\skills`, `srs-skills`, `proposal-skills`, `business-plan-skills`) receive their finance/accounting capability.

## Build Once, Mirror Everywhere

This tree is built once. The contents of `doctrine/`, `skills/`, `governance/`, and `integration/` are mirrored into each consumer engine under the engine's doctrine and skill paths. The mirror script lives at `integration/mirror.ps1` and defaults to this repository root as its source.

## Tree

```text
chwezi-accounting-doctrine/
|-- README.md
|-- doctrine/
|   |-- accounting-finance-doctrine.md
|   |-- references/
|   |   |-- policy-hierarchy.md
|   |   |-- ledger-invariants.md
|   |   |-- chart-of-accounts.md
|   |   |-- tax-vat-and-returns.md
|   |   |-- live-rate-verification-protocol.md
|   |   |-- ifrs-for-smes-default.md
|   |   |-- full-ifrs-overlay.md
|   |   |-- uganda-compliance-caveats.md
|   |   |-- country-extension-framework.md
|   |   |-- terminology-glossary.md
|   |   |-- forbidden-patterns.md
|   |   |-- required-patterns.md
|   |   |-- design-system-finance-accounting.md
|   |   |-- design-anti-patterns.md
|   |   |-- print-fidelity.md
|   |   |-- role-conditioned-shell.md
|   |   |-- status-taxonomy.md
|   |   `-- versioning-and-changelog.md
|   `-- examples/
|       |-- coa-seed-uganda-sme.md
|       |-- vat-inclusive-posting.md
|       |-- reversal-pattern.md
|       `-- reconciliation-evidence-pack.md
|-- skills/                                      # organised into category sub-folders
|   |-- 01-foundations/                          # ledger core, CoA, dimensions, period locking, currency
|   |-- 02-ifrs-core-standards/                  # revenue, leases, financial instruments, SMEs, PPE, intangibles, employee benefits, borrowing costs, FX
|   |-- 03-ifrs-specialised-standards/           # impairment, agriculture, grants, deferred tax, provisions, IFRS 3/5/8/13, IAS 8/10/24/28/33/40, IFRS 1/2/17
|   |-- 04-subledgers-and-operations/            # bank/momo recon, fixed assets, inventory, payroll, petty cash, POS, expenses
|   |-- 05-receivables-payables-and-treasury/    # AR, AP, treasury, FX hedging, facilities and covenants
|   |-- 06-close-consolidation-and-reporting/    # month/year close, migration, consolidation, audit-ready packs, finance-module audit
|   |-- 07-financial-statements-and-disclosures/ # primary statements, cash-flow statement, notes, going concern, S1/S2
|   |-- 08-tax-and-statutory/                    # source register, VAT/WHT mechanics, transfer pricing, e-invoicing
|   |-- 09-budgeting-fpa-and-costing/            # budgets, forecasts, variance, KPIs, costing methods, pricing
|   |-- 10-controls-governance-and-fraud/        # internal controls, engagement quality, anti-fraud, AML, whistleblowing, SOX-style ICFR, conformance scanning
|   |-- 11-sector-and-fund-accounting/           # NGO, schools, clinics, retail, agribusiness, hospitality, real estate, fintech
|   |-- 12-public-sector-and-ipsas/              # IPSAS overlay, public procurement, donor fiscal compliance
|   |-- 13-project-and-contract-accounting/      # POC/WIP, construction contracts, professional services
|   |-- 14-systems-integration-and-data/         # ERP integration, bank feeds, data contracts, open banking
|   |-- 15-security-privacy-and-continuity/      # data privacy, cybersecurity, BCP/DR for finance
|   |-- 16-ux-and-presentation/                  # UI pattern library, non-accountant UX, accessibility, mobile/offline
|   `-- 17-ai-automation-and-emerging/           # AI governance, RPA, digital assets, carbon accounting
|-- governance/
|   |-- finance-accounting-quality-gate.md
|   |-- cleanup-backlog.md
|   `-- how-to-reference-this-doctrine.md
|-- tools/
|   |-- validate-doctrine.ps1
|   |-- close-gap-stubs.ps1
|   `-- invoke-doctrine-conformance-scan.ps1
`-- integration/
    |-- mirror.ps1
    |-- changelog-entries.md
    |-- integration-plan.md
    `-- deprecation-list.md
```

## Versioning

This tree follows semver. The current version is recorded in `doctrine/accounting-finance-doctrine.md` and in `integration/changelog-entries.md`.

## How Consumer Engines Use This

Each consumer engine receives a mirror at its doctrine path and finance skills path. Each engine's `CLAUDE.md` and `AGENTS.md` carries a finance and accounting trigger block that loads the doctrine when finance scope is detected. See `integration/integration-plan.md` for per-engine wiring.

## Validation

Run the local doctrine gate before mirroring or release:

```powershell
.\tools\validate-doctrine.ps1
.\integration\mirror.ps1 -DryRun
```

The validation target is `pass-with-caveats` or better until all statutory source-register entries have named reviewer sign-off and archive evidence.

## Doctrine Conformance Scanning

Use the scanner when a codebase, implementation plan, proposal, business plan, blog post, or mixed artefact must be aligned to the finance doctrine:

```powershell
.\tools\invoke-doctrine-conformance-scan.ps1 -TargetPath "C:\path\to\target" -OutputPath ".\docs\conformance-scan.md"
```

The scanner is paired with `skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/`. It produces risk-ranked findings and alignment instructions; human reviewer sign-off is still required for final conformance.

## Provenance

Doctrine is derived from the research project at:
`C:\Users\Peter\Documents\Claude Projects\digital-research-engine\projects\finance-accounting-system-implementation-doctrine\`

Source artefacts include the canonical doctrine analysis, accounting acceptance-test library, Uganda live-rate compliance research, cross-repo quality gate adoption plan, cross-repo remediation master plan, and Wave 1 IFRS / IFRS for SMEs standards extractions.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
