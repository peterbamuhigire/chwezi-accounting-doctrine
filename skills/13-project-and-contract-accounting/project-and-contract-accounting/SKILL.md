---
name: project-and-contract-accounting
description: Use when revenue and cost are recognised over time (POC) or at a point in time under IFRS 15: performance obligations, input vs output methods, WIP, and contract assets/liabilities.
status: draft
metadata:
  portable: true
  category: 13-project-and-contract-accounting
  compatible_with:
    - claude-code
    - codex
---

# project-and-contract-accounting

<!-- dual-compat-start -->
## Use When

Use when revenue and cost are recognised over time (POC) or at a point in time under IFRS 15: performance obligations, input vs output methods, WIP, and contract assets/liabilities.

## Do Not Use When

Do not use as a substitute for professional advice, country statutory verification, or specialist sign-off where the doctrine requires named reviewer approval.

## Required Inputs

Entity, period, reporting framework, jurisdiction, functional currency, source events, and source-register snapshot when statutory values appear.

## Workflow

Validate scope and framework, gather inputs, apply the decision rules below, capture evidence, and route to the relevant reviewer before final release.

## Quality Standards

Framework-identified, source-evidenced, reviewer-routable, and consistent with the canonical doctrine and ledger invariants.

## Anti-Patterns

Treating this stub as authoritative before it has been fleshed out and reviewer-signed; bypassing the posting service or source register; releasing final statutory output without verified-current sources.

## Outputs

Artefacts that name the framework, cite sources, expose drilldown to the ledger, and carry reviewer routing metadata.

## References

Load the doctrine references listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/policy-hierarchy.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Confirm reporting framework, jurisdiction, functional currency, and the open period.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Scope statement | Engagement owner | Required | Entity, period, framework, and jurisdiction stated. |
| Source events | Feature module or subledger | Required | Source document, actor, period, currency, and amount captured. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | Required when statutory values appear | Entries are `verified-current` or approved caveat. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Worked artefact (memo, posting set, disclosure, or report) | Reviewer, GL, audit pack | Framework named, sources cited, drilldown evident. |
| Reviewer routing record | Quality gate | Reviewer roles, sign-off status, and caveats captured. |

## Decision Rules

1. Identify the reporting framework before applying any recognition or measurement decision.
2. Do not release final statutory values without verified-current source-register support.
3. Route reviewer-required outputs through the named role before release.
4. Apply the canonical ledger invariants when any output affects posted journals.

## Acceptance Evidence

- Worked example, decision-rule trace, and reviewer sign-off captured under `examples/` (to be added when the stub is built out).
- Reference set under `references/` (to be added when the stub is built out).

## Anti-Patterns

- Final output without reviewer sign-off where the doctrine requires it.
- Statutory values without source-register support.
- Bypassing the posting service or the Chart of Accounts policy register.

## Review Metadata

| Field | Value |
|---|---|
| Owner role | To assign |
| Reviewer roles | Doctrine owner; framework-specific reviewer |
| Last reviewed | 2026-05-25 |
| Next review due | 2026-11-25 |
| Release state | Draft stub - not release evidence until fleshed out and reviewer-signed |
| Caveat | This skill is a scaffolded gap-stub. It must be fully written and reviewer-signed before any client-facing release. |

Last reviewed: 2026-05-25. Next review due: 2026-11-25.
