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
|-- skills/
|   |-- audit-ready-reporting-pack/
|   |-- bank-and-mobile-money-reconciliation/
|   |-- finance-module-audit/
|   |-- finance-ui-pattern-library/
|   |-- finance-ux-for-non-accountants/
|   |-- internal-controls-library/
|   `-- standards and workflow skills
|-- governance/
|   |-- finance-accounting-quality-gate.md
|   |-- cleanup-backlog.md
|   `-- how-to-reference-this-doctrine.md
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

## Provenance

Doctrine is derived from the research project at:
`C:\Users\Peter\Documents\Claude Projects\digital-research-engine\projects\finance-accounting-system-implementation-doctrine\`

Source artefacts include the canonical doctrine analysis, accounting acceptance-test library, Uganda live-rate compliance research, cross-repo quality gate adoption plan, cross-repo remediation master plan, and Wave 1 IFRS / IFRS for SMEs standards extractions.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
