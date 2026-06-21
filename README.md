# Chwezi Accounting & Finance Doctrine

Canonical accounting and finance doctrine for the Chwezi Core Systems skills engine — the **cross-cutting finance source of truth**. This tree is the single source from which the consumer skill engines (`skills-web-dev` at `C:\Users\Peter\.claude\skills`, `srs-skills`, `proposal-skills`, `business-plan-skills`) draw their finance/accounting capability. This README is also this engine's **router** — start here, then read `doctrine/accounting-finance-doctrine.md` and glob `skills/**/SKILL.md`.

## Architecture & cross-cutting engines (updated 2026-06-21)

- **102 finance/accounting `SKILL.md` skills** across 17 category groups under `skills/`,
  plus the doctrine, references, governance, and tooling described below.
- **No engine is natively discovered anymore.** This engine, like every other on this
  machine, is reached only via the user's global engine-routing table
  (`~/.claude/CLAUDE.md`, or `AGENTS.md` for Codex), by globbing `SKILL.md` directly and
  reading the matching file (not via the `Skill` tool).
- **Reference model — the mirror is retired.** As of 2026-06-21 this doctrine is consumed by
  the **reference model, NOT mirrored.** The old "Build Once, Mirror Everywhere" approach is
  **retired/deprecated.** Consumer engines (`srs-skills`, `business-plan-skills`,
  `proposal-skills`, `skills-web-dev`) **no longer hold finance mirrors** — their empty mirror
  shell folders were removed on 2026-06-21. Those engines now **route finance/accounting work
  to this source** via the global routing table. The `integration/mirror.ps1` workflow remains
  in the tree only as deprecated history; do not treat it as the active integration path.
- **This is the finance peer of the cross-cutting DESIGN engine.** A parallel cross-cutting
  engine, **`design-system-skills`**, is the single home for ALL design/typography/UI/UX/
  visual-formatting skills plus the anti-AI-slop doctrine. It is **referenced, not mirrored**
  (resolve its path per-device from the global routing table — never hardcode). Consult it
  **IN ADDITION** to this engine whenever an artefact's visual presentation matters; content
  and structure stay here, presentation comes from `design-system-skills`. See the design
  trigger block at the foot of this file.

## Build Once, Mirror Everywhere (RETIRED — historical)

> **Deprecated as of 2026-06-21.** The reference model (above) replaces mirroring. This
> section is retained only to document the former integration path. `integration/mirror.ps1`
> still exists but is no longer the active workflow; consumer engines route to this source
> rather than receiving copies.

Historically this tree was built once and the contents of `doctrine/`, `skills/`, `governance/`, and `integration/` were mirrored into each consumer engine under the engine's doctrine and skill paths. The mirror script lives at `integration/mirror.ps1` and defaulted to this repository root as its source.

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

**Reference model (current, since 2026-06-21).** Consumer engines no longer receive a mirror — the empty mirror shell folders were removed. Instead, each engine's `CLAUDE.md` and `AGENTS.md` carries a finance and accounting trigger block that, when finance scope is detected, **routes to this source** via the global engine-routing table: resolve this engine's path, read this `README.md`, then `doctrine/accounting-finance-doctrine.md`, and glob `skills/**/SKILL.md` here directly. See `integration/integration-plan.md` for per-engine wiring (note: any mirror steps there are now historical).

## Validation

Run the local doctrine gate before release:

```powershell
.\tools\validate-doctrine.ps1
```

(The former `.\integration\mirror.ps1 -DryRun` step is retired along with the mirror model — see the architecture note above.)

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

<!-- design-system-skills:trigger v1 -->
### Design / typography / UI/UX (cross-cutting — consult IN ADDITION)

Any work touching how an artifact LOOKS — font/typeface choice, type scale, colour, layout/grid,
visual identity, web/desktop/mobile UI screens, or the visual formatting of a DOCX/PPTX/PDF/XLSX
— routes to the **`design-system-skills`** engine, the single home for ALL design/UI/UX skills
and the anti-AI-slop doctrine.

**Resolve its location on THIS device from your global engine-routing table** (`~/.claude/CLAUDE.md`,
or `AGENTS.md` for Codex) — never assume an absolute path; it varies per machine. Then read its
`README.md` → `doctrine/design-doctrine.md` → glob `skills/**/SKILL.md` fresh and route by
frontmatter (read SKILL.md directly, not via the Skill tool). Content and structure stay in THIS
engine; presentation comes from design-system-skills. Hard rule: never use a banned AI-slop font
(Inter, Geist, Roboto, Arial, Open Sans, Lato, Space Grotesk, bare system stacks) as primary
type — state the chosen typeface and reason before producing any artifact.
<!-- /design-system-skills:trigger -->
