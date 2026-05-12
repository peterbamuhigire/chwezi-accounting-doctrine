# Chwezi Accounting & Finance Doctrine

Canonical accounting and finance doctrine for the Chwezi Core Systems skills engine. This staging tree is the single source from which the four skill engines (`skills-web-dev` at `C:\Users\Peter\.claude\skills`, `srs-skills`, `proposal-skills`, `business-plan-skills`) receive their finance/accounting capability.

## Build once, mirror everywhere

This tree is built once. The contents of `doctrine/`, `skills/`, `governance/`, and `integration/` are mirrored into each consumer engine under `doctrine/` and `skills/` respectively. The mirror script lives at `integration/mirror.ps1`.

## Tree

```
_chwezi-doctrine/
├── README.md                                       # this file
├── doctrine/
│   ├── accounting-finance-doctrine.md              # canonical master
│   ├── references/                                 # modular doctrine sub-files
│   │   ├── policy-hierarchy.md
│   │   ├── ledger-invariants.md
│   │   ├── chart-of-accounts.md
│   │   ├── tax-vat-and-returns.md
│   │   ├── live-rate-verification-protocol.md
│   │   ├── ifrs-for-smes-default.md
│   │   ├── full-ifrs-overlay.md
│   │   ├── uganda-compliance-caveats.md
│   │   ├── country-extension-framework.md
│   │   ├── terminology-glossary.md
│   │   ├── forbidden-patterns.md
│   │   ├── required-patterns.md
│   │   ├── design-system-finance-accounting.md
│   │   ├── design-anti-patterns.md
│   │   ├── print-fidelity.md
│   │   ├── role-conditioned-shell.md
│   │   ├── status-taxonomy.md
│   │   └── versioning-and-changelog.md
│   └── examples/
│       ├── coa-seed-uganda-sme.md
│       ├── vat-inclusive-posting.md
│       ├── reversal-pattern.md
│       └── reconciliation-evidence-pack.md
├── skills/                                         # new skills A-P plus Q
│   ├── bank-and-mobile-money-reconciliation/
│   ├── month-end-and-year-end-close-playbook/
│   ├── opening-balances-and-migration-playbook/
│   ├── audit-ready-reporting-pack/
│   ├── management-accounting-dimensions/
│   ├── finance-ux-for-non-accountants/
│   ├── finance-ui-pattern-library/
│   ├── ifrs-revenue-recognition/
│   ├── ifrs-leases/
│   ├── ifrs-financial-instruments/
│   ├── ias-impairment/
│   ├── ias-provisions-contingencies/
│   ├── ias-government-grants/
│   ├── ias-agriculture/
│   ├── ias-income-tax-deferred-tax/
│   ├── ifrs-for-smes-equivalents/
│   └── internal-controls-library/
├── governance/
│   ├── finance-accounting-quality-gate.md
│   ├── cleanup-backlog.md
│   └── how-to-reference-this-doctrine.md
└── integration/
    ├── mirror.ps1
    ├── changelog-entries.md
    ├── integration-plan.md
    └── deprecation-list.md
```

## Versioning

This tree follows semver. The current version is recorded in `doctrine/accounting-finance-doctrine.md` and in `integration/changelog-entries.md`.

## How consumer engines use this

Each consumer engine receives a mirror at `doctrine/` (the doctrine and its references) and at `skills/` (the new skills, scoped to that engine's needs). Each engine's `CLAUDE.md` and `AGENTS.md` carries a "Finance & Accounting trigger" block that loads the doctrine when finance scope is detected. See `integration/integration-plan.md` for per-engine wiring.

## Provenance

Doctrine is derived from the research project at:
`C:\Users\Peter\Documents\Claude Projects\digital-research-engine\projects\finance-accounting-system-implementation-doctrine\`

Source artefacts: `canonical-doctrine/analysis/accounting-finance-doctrine-v0.1.md`, `ledger-engine-implementation/analysis/accounting-acceptance-test-library.md`, `uganda-live-rate-compliance/analysis/live-rate-verification-protocol.md`, `cross-repo-quality-gate/analysis/finance-accounting-quality-gate-adoption-plan.md`, `cross-repo-quality-gate/analysis/cross-repo-remediation-master-plan.md`, plus the Wave 1 IFRS / IFRS for SMEs book extractions under `ifrs-standards-depth/research/`.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.
