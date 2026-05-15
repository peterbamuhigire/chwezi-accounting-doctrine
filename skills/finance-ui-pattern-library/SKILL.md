---
name: finance-ui-pattern-library
description: Production UI patterns, design tokens, role-conditioned shells, drilldown primitives, reconciliation triage layout, print stylesheet patterns, status taxonomy components, and money-cell components for Chwezi finance and accounting products. Use when designing or building any finance / accounting screen, dashboard, report, print layout, mobile cashier flow, accountant ledger surface, reconciliation UI, close board, return-pack viewer, or audit-ready export across any consumer engine. Auto-load when the user requests UI / UX work that touches money, inventory, payroll, tax, banking, mobile money, POS, statutory compliance, or accounting records.
---

# Finance UI Pattern Library

## Overview

This skill is the production reference for finance and accounting UI in the Chwezi system. It enforces the doctrine in `doctrine/references/design-system-finance-accounting.md`, `design-anti-patterns.md`, `role-conditioned-shell.md`, `status-taxonomy.md`, and `print-fidelity.md`. It provides design tokens, component contracts, lint rules, and worked examples.

## Required first reads

Before generating any finance UI:

1. `doctrine/accounting-finance-doctrine.md`
2. `doctrine/references/design-system-finance-accounting.md`
3. `doctrine/references/design-anti-patterns.md`
4. `doctrine/references/role-conditioned-shell.md`
5. `doctrine/references/status-taxonomy.md`
6. `doctrine/references/print-fidelity.md`
7. This skill's `references/tokens.md` and `references/components.md`.

## Scope

This skill applies to:

- Any HTML / CSS / React / Vue / Svelte / mobile-native finance UI.
- Print stylesheets.
- Email and notification finance-content templates.
- PDF report renderers.
- Dashboard tiles.
- Documentation / marketing pages that show product screenshots.

## Workflow

1. Identify the surface mode (workflow / ledger / auditor read-only / configuration).
2. Confirm the role(s) that will use the screen.
3. Pull the relevant component contracts from `references/components.md`.
4. Apply the tokens from `references/tokens.md`.
5. Add the role-conditioned shell wrapper.
6. Include the drilldown affordance on every money figure.
7. Apply the status taxonomy.
8. Add the print stylesheet for any report or evidence pack.
9. Run the lint script in `references/lint-checks.md` before merging.
10. Record a screenshot in the PR.

## Components shipped

The `references/components.md` file documents:

- `MoneyCell` — tabular numerals, currency code, sign colouring (signed columns only), drilldown.
- `NetTaxGrossTriplet` — three adjacent cells; never collapsed.
- `StatusChip` — uses controlled taxonomy; works in monochrome print.
- `PeriodChip` — top-bar period state chip.
- `EntityBookSwitcher` — multi-entity / multi-book switcher.
- `RoleSwitcher` — when the user has multiple roles.
- `EnvironmentBanner` — non-prod environment banner.
- `DrilldownBreadcrumb` — Report → Account → Journal → Line → Source → Evidence.
- `PostingForm` — net / tax / gross fields, evidence dropzone, audit-log preview.
- `ReconciliationTriage` — two-pane layout with centre actions and ageing.
- `LedgerGrid` — dense grid; keyboard-first; sticky headers and totals.
- `CloseBoard` — close tasks with owner, due, evidence, status.
- `ReturnPackViewer` — period selector, line mapping, source documents, evidence.
- `AuditExport` — read-only ledger with watermark.
- `PrintHeader`, `PrintFooter`, `SignOffBoxes`.
- `EvidenceDropzone` — inline on posting forms.

## Lint rules (excerpt)

The lint script in `references/lint-checks.md` rejects:

- `<button>` with destructive verb on a posted record.
- `text-green` / `text-red` / `bg-green` / `bg-red` outside semantic-state contexts.
- Money rendering without `font-variant-numeric: tabular-nums`.
- A summary tile without an `onClick` / `Link` affordance to source.
- A status string not matching the controlled taxonomy.
- A report page without `@media print` styles.

## What forbidden patterns are caught

This skill enforces 32 patterns from `design-anti-patterns.md` automatically; the remaining 26 require human review.

## Auto-loading

This skill is referenced from each engine's `AGENTS.md` "Finance & Accounting Trigger" block. When the request is UI-flavoured (HTML, CSS, JSX, mobile native code, screen mock, dashboard, report, print) and finance scope is detected, this skill is loaded automatically alongside the doctrine.

## Files

- `SKILL.md` — this file.
- `references/tokens.md` — token JSON and CSS variables.
- `references/components.md` — full component contracts.
- `references/lint-checks.md` — checklist and grep / AST patterns.
- `references/print-stylesheet-template.md` — copy-paste `@media print` template.
- `examples/cashier-record-sale.md` — full mock of a workflow-surface screen.
- `examples/ledger-trial-balance.md` — full mock of a ledger-surface screen.
- `examples/reconciliation-triage.md` — full mock of the reconciliation UI.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.

## Prerequisites

- Load `doctrine/accounting-finance-doctrine.md` before applying this skill.
- Load `governance/finance-accounting-quality-gate.md` when the output is a release, client artefact, SRS, SDS, proposal, business plan, or implementation plan.
- Use `doctrine/source-register/` for final statutory, tax, payroll, FX, EFRIS, eTIMS, or authority-template values.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Finance context map | `finance-module-audit` | Required | Entity, framework, jurisdiction, modules, users, and deployment context are named. |
| Doctrine baseline | Doctrine owner | Required | Doctrine version and reporting framework are stated. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | Required for final statutory output | Entries are `verified-current` or reviewer-approved `verified-with-caveat`. |
| Ledger/posting context | `ledger-posting-engine-core` | Required when postings are affected | Posting boundary, CoA mappings, control accounts, dimensions, and period state are known. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Skill-specific decision record | Implementer, reviewer, quality gate | Scope, assumptions, chosen treatment, rejected alternatives, and caveats are recorded. |
| Implementation or workflow contract | Software, SRS, SDS, proposal, or business-plan engine | Contract names inputs, outputs, controls, evidence, and failure conditions. |
| Acceptance evidence | Finance quality gate | Tests, fixtures, examples, source links, reviewer sign-off, or evidence-pack references are present. |
| Plain-language explanation | Client, owner, manager, operator | Business meaning is stated before technical accounting treatment where client-facing. |

## Decision Rules

- Prefer IFRS for SMEs for typical SME entities unless full IFRS, local law, donor requirements, or client policy requires otherwise.
- Treat every money-touching workflow as ledger, control, reconciliation, evidence, and reporting scope.
- Do not finalize statutory values without source-register support and reviewer status.
- Use business-language output for operators and accountant-language output for ledger, reporting, and audit users.
- Escalate uncertain framework, tax, or statutory interpretations to the required reviewer role instead of presenting them as final.

## Acceptance Evidence

- Inputs and outputs above are present or explicitly marked not applicable.
- Relevant quality-gate blockers have been checked and no blocker remains unresolved.
- Examples or fixtures cover at least one happy path and one failure or caveat path for this skill's domain.
- Reviewer role, review date, and open caveats are recorded for release-grade artefacts.

## Anti-Patterns

- Treating draft planning assumptions as final statutory or accounting facts.
- Hiding tax, payroll, FX, or authority-template caveats in prose instead of source-register state.
- Producing technically correct accounting output without a plain-language layer for non-accountant users.
- Closing a remediation or implementation item without observable evidence.

## Required References

- `doctrine/accounting-finance-doctrine.md`.
- `governance/finance-accounting-quality-gate.md`.
- `docs/reference-manifest.md` for declared reference states.
- Domain-specific references listed earlier in this skill.

## Examples

- Include at least one normal workflow example for this skill's domain.
- Include at least one exception, rejection, reversal, stale-source, or reviewer-caveat example where the domain can fail.

## Review Metadata

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
