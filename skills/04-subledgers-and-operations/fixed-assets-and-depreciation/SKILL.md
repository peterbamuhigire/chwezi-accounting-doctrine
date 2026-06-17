---
name: fixed-assets-and-depreciation
description: Use when designing, reviewing, or testing fixed-asset registers, capitalization policy, componentization, depreciation, useful-life review, disposals, revaluation caveats, impairment indicators, tax depreciation caveats, and asset-register to GL tie-outs.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Fixed Assets and Depreciation

<!-- dual-compat-start -->
## Use When

Use when capitalization, asset registers, depreciation, disposals, componentization, useful-life review, impairment indicators, or asset tie-outs are in scope.

## Do Not Use When

Do not use to set final tax depreciation or capital allowance values without source-register-backed statutory review.

## Required Inputs

Asset event, capitalization policy, asset class, evidence, useful life, depreciation method, period, and GL account mapping.

## Workflow

Assess capitalization, register the asset, post acquisition, run depreciation, handle disposal, review impairment triggers, and reconcile register to GL.

## Quality Standards

Evidence-backed asset records, governed depreciation runs, immutable postings, useful-life review, and close-ready register tie-out.

## Anti-Patterns

Capitalizing repairs, deleting disposed assets, tax rates as accounting depreciation without policy support, and direct balance edits.

## Outputs

Capitalization journals, depreciation journals, disposal journals, impairment checklists, and register-to-GL tie-out evidence.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `doctrine/references/chart-of-accounts.md`.
- Read doctrine/references/uganda-ngo-financial-management-patterns.md when the engagement is Ugandan.
- Read `ledger-posting-engine-core` before approving asset journals.
- Confirm reporting framework, capitalization threshold policy, asset classes, depreciation methods, useful lives, tax jurisdiction, and evidence policy.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Asset acquisition event | Procurement, AP, migration | Required | Supplier, cost components, date available for use, evidence, account mapping present. |
| Capitalization policy | Controller | Required | Threshold, asset classes, repairs policy, and approval role present. |
| Asset register | Fixed-asset owner | Required | Asset ID, class, cost, accumulated depreciation, location, custodian, useful life, method present. |
| Depreciation run request | Close process | Required | Period, method, open period, and run idempotency key present. |
| Disposal event | Asset owner | Required for derecognition | Proceeds, approval, evidence, and disposal date present. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Asset capitalization journal | GL, asset register | Cost posted to asset account through posting service. |
| Depreciation journal | GL, reporting pack | Expense and accumulated depreciation posted by period. |
| Disposal journal | GL, asset register | Cost and accumulated depreciation removed; gain or loss recognized. |
| Asset register tie-out | Month-end close | Register cost and accumulated depreciation reconcile to GL. |
| Impairment indicator checklist | Controller, reporting pack | Indicators assessed and handed off when needed. |

## Decision Rules

1. Capitalize only assets that meet the capitalization policy and are expected to provide future economic benefit.
2. Expense repairs and maintenance unless they meet capitalization criteria.
3. Componentize material parts when useful lives or replacement cycles differ significantly.
4. Depreciation begins when the asset is available for use, not merely when paid for.
5. Review useful lives, residual values, and methods at least annually or when indicators change.
6. Derecognition removes cost and accumulated depreciation and recognizes gain or loss through the posting service.
7. Revaluation is allowed only when the reporting framework and entity accounting policy support it.
8. Tax depreciation is a statutory computation and must not replace accounting depreciation unless explicitly required by the reporting basis.

## Acceptance Evidence

- `examples/acquisition-fixture.md` proves capitalization and evidence capture.
- `examples/monthly-depreciation-fixture.md` proves period depreciation and idempotency.
- `examples/disposal-gain-loss-fixture.md` proves derecognition and gain/loss.
- `examples/impairment-indicator-checklist.md` proves trigger review.
- `examples/register-to-gl-tieout.md` proves asset subledger to GL reconciliation.
- `references/domain-acceptance-tests.md` is the minimum implementation test set.

## Anti-Patterns

- Capitalizing ordinary repairs to inflate profit.
- Running depreciation by editing asset balances without journals.
- Using tax depreciation rates as accounting useful lives without policy support.
- Disposing of an asset by deleting it from the register.
- Failing to tie the asset register to GL at close.
- Recording revaluations without reviewer approval and framework support.

## Required References

- `references/asset-register-fields.md`
- `references/depreciation-and-disposal-rules.md`
- `references/domain-acceptance-tests.md`
- `doctrine/references/ledger-invariants.md`
- `doctrine/references/chart-of-accounts.md`
- `ledger-posting-engine-core/references/posting-service-contract.md`

## Examples

- `examples/acquisition-fixture.md`
- `examples/monthly-depreciation-fixture.md`
- `examples/disposal-gain-loss-fixture.md`
- `examples/impairment-indicator-checklist.md`
- `examples/register-to-gl-tieout.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Fixed-assets accounting specialist |
| Reviewer roles | Controller, asset custodian, tax reviewer for tax depreciation schedules |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-11-15 |
| Release state | Draft until fixtures are executable in the validator |
| Caveat | This skill separates accounting depreciation from statutory tax allowances; final tax treatment requires source-register support. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
