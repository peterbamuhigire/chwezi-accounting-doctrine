# Changelog Entries

Per-engine changelog entries to be pasted into each engine's `CHANGELOG.md` at adoption.

## Common entry (paste into every engine's CHANGELOG)

```markdown
## [Unreleased] — Chwezi Accounting & Finance Doctrine v1.0.0 adopted

### Added
- Canonical accounting & finance doctrine at `<doctrine-dest>/accounting-finance-doctrine.md`
  with 18 reference files (policy hierarchy, ledger invariants, chart of accounts,
  tax & VAT, live-rate verification, IFRS for SMEs default, full IFRS overlay,
  Uganda compliance caveats, country extension framework, terminology glossary,
  forbidden patterns, required patterns, design system, design anti-patterns,
  print fidelity, role-conditioned shell, status taxonomy, versioning).
- Four worked examples (seed Uganda SME CoA, VAT-inclusive posting, reversal,
  reconciliation evidence pack).
- 17 new skills covering bank/mobile-money reconciliation, month-end & year-end
  close, opening balances & migration, audit-ready reporting, management
  accounting dimensions, finance UX for non-accountants, finance UI pattern
  library, IFRS revenue, IFRS leases, IFRS financial instruments, IAS 36
  impairment, IAS 37 provisions, IAS 20 / Section 24 grants, IAS 41 agriculture,
  IAS 12 / Section 29 income tax, IFRS-for-SMEs equivalents, internal controls.
- Finance & accounting quality gate with blocker register, required checks,
  and finding-register format.
- Live-rate verification protocol with source register schema.
- Cleanup backlog (categorised by LIFO, US GAAP, hardcoded rates, stale FX,
  third-party-product-first language, direct journal-line writes, status
  taxonomy violations, missing reviewer roles, missing print stylesheets,
  missing drilldown, modal compliance dumps).
- Engine `CLAUDE.md` and `AGENTS.md` Finance & Accounting Trigger blocks.
- `finance-module-audit` skill is now auto-run for any artefact with even
  a slight finance element.
- Engine-specific reference files (see engine-specific section below).

### Changed
- `finance-module-audit` SKILL.md updated with auto-run trigger directive
  and expanded description.

### Deprecated (queued for cleanup, see `<doctrine-dest>/governance/cleanup-backlog.md`)
- LIFO references appearing as IFRS-compliant.
- Hardcoded Uganda VAT / PAYE / NSSF / WHT / EFRIS values in country context.
- US-GAAP-only language used as a default.
- Vendor-replacement claims without caveats.
- Free-text status fields on finance records.
- Reports without print stylesheets.
```

## skills-web-dev (`C:\Users\Peter\.claude\skills`)

```markdown
### Engine-specific
- New doctrine root at `_doctrine/`.
- `finance-module-audit` skill rewritten with auto-run trigger.
- Added `skills/_chwezi-finance-engine-skeletons/` (PHP/MySQL posting service,
  journal DDL, audit-log DDL, period state machine, idempotency, posting tests,
  reviewer checklist) — to be authored next.
```

## srs-skills (`C:\wamp64\www\srs-skills`)

```markdown
### Engine-specific
- New doctrine root at `doctrine/`.
- New `skills/finance/` containing the full doctrine skill suite.
- Added `skills/finance/requirement-id-library/` and
  `skills/finance/acceptance-criteria-templates/` aligned to ledger integrity,
  period close, tax handling, report generation, audit export, migration / opening
  balances, and reconciliation.
- Updated `09-governance-compliance/` reviewer list to add Accountant, Controller,
  CFO / finance lead, Tax reviewer roles.

### Cleanup required (do not auto-apply; user approves each)
- LIFO appearing in `skills/skills/inventory-management/SKILL.md`
  (lines around 326, 329, 343, 384) — convert to FIFO / weighted average.
- LIFO in `skills/skills/modular-saas-architecture/examples/module-config-example.php:230` — remove or gate.
```

## proposal-skills (`C:\wamp64\www\proposal-skills`)

```markdown
### Engine-specific
- New doctrine root at `doctrine/`.
- New `skills/finance/` containing the doctrine skill suite.
- Added `skills/finance/sector-annexes/` for schools, clinics, NGOs, retail/POS,
  manufacturing, agribusiness, hospitality.

### Cleanup required
- Vendor-replacement language to pair with caveats and acceptance criteria.
- Third-party-product-first language to be reframed where used as the basis of
  the Chwezi accounting standard.
```

## business-plan-skills (`C:\wamp64\www\business-plan-skills`)

```markdown
### Engine-specific
- New doctrine root at `doctrine/`.
- New `skills/finance/` containing the doctrine skill suite.
- Added `skills/finance/coa-and-classification-sweep.md` for canonical
  IFRS-for-SMEs-aligned classification.

### Cleanup required
- Hardcoded Uganda VAT / PAYE / NSSF / WHT / EFRIS values in
  `country-context/uganda/SKILL.md` (lines around 75, 76, 124–134, 293, 294) —
  convert to verification-gated assumptions referencing the source register.
- "Always use" FX language to be recast as dated assumption.
- LIFO references in industry guides (start with restaurant cost-controls
  advanced guide) — convert to FIFO / weighted average.
```

Last reviewed: 2026-05-12. Next review due: 2026-11-12.
