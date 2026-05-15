---
name: inventory-costing-and-stock-accounting
description: Use when designing, reviewing, or testing stock accounting, SKU and location policy, FIFO or weighted-average costing, stock counts, shrinkage, wastage, expiry, NRV write-downs, COGS postings, and inventory control-account tie-outs.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Inventory Costing and Stock Accounting

<!-- dual-compat-start -->
## Use When

Use when inventory quantities, valuation, costing, stock counts, COGS, shrinkage, expiry, NRV, or inventory control accounts are in scope.

## Do Not Use When

Do not use for fixed assets, payroll, or statutory rates except through the relevant companion skills.

## Required Inputs

SKU master, stock movement, costing policy, location, source evidence, tax code where applicable, and close period state.

## Workflow

Validate movement evidence, apply the approved costing method, post inventory and COGS through the posting service, and tie subledger to GL.

## Quality Standards

Framework-compliant costing, source-evidenced movements, controlled variances, NRV review, and close-ready inventory control reconciliation.

## Anti-Patterns

Unsupported LIFO, hidden shrinkage, direct GL stock edits, negative stock without policy, and missing control-account tie-outs.

## Outputs

Inventory journals, cost-layer evidence, variance journals, NRV write-downs, and domain acceptance fixtures.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `doctrine/references/chart-of-accounts.md`.
- Read `ledger-posting-engine-core` before approving inventory journals.
- Confirm entity inventory mode, costing method, SKU policy, locations, dimensions, tax treatment, and whether IFRS or IFRS for SMEs compliance is claimed.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| SKU master | Inventory owner | Required | SKU, unit of measure, category, costing method, stock account, COGS account, location policy present. |
| Stock movement event | POS, purchasing, warehouse | Required | Quantity, unit, location, source document, actor, and timestamp present. |
| Costing policy | Controller | Required | FIFO or weighted-average selected; unsupported methods blocked or caveated. |
| Stock count evidence | Warehouse, reviewer | Required for variances | Count sheet, counter, reviewer, variance reason, and approval present. |
| NRV assessment | Controller | Required at close when indicators exist | Sales price, completion costs, selling costs, and evidence captured. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Inventory journal | GL, stock subledger | Posted through posting service and balanced. |
| Cost layer register | Stock valuation | FIFO layers or weighted-average calculation retained. |
| COGS posting | Profit or loss | Sale relieves stock and recognizes COGS consistently. |
| Variance journal | Close process | Approved count variance posted to shrinkage, wastage, or gain account. |
| NRV write-down | Reporting pack | Lower-of-cost-and-NRV evidence retained. |

## Decision Rules

1. Use FIFO or weighted-average unless another method is explicitly supported by the reporting framework and reviewer approval.
2. LIFO is rejected when IFRS or IFRS for SMEs compliance is claimed.
3. Perpetual inventory posts stock and COGS at movement time; periodic inventory posts through governed close adjustments.
4. Inventory control account must tie to SKU-location subledger at close.
5. Stock count variances require evidence, reason code, approval, and a posting-service journal.
6. Expiry, damage, shrinkage, and wastage use controlled variance accounts and remain visible in management reports.
7. NRV indicators trigger write-down review and handoff to impairment or inventory NRV evidence.
8. Tax on purchases or sales uses source-register-backed tax codes where final statutory values are involved.

## Acceptance Evidence

- `examples/fifo-costing-fixture.md` proves FIFO layer relief and COGS.
- `examples/weighted-average-fixture.md` proves moving-average recalculation.
- `examples/stock-count-variance-fixture.md` proves approved variance posting.
- `examples/nrv-write-down-fixture.md` proves lower-of-cost-and-NRV treatment.
- `examples/rejected-unsupported-costing-method.md` proves LIFO or unsupported method rejection.
- `references/domain-acceptance-tests.md` is the minimum implementation test set.

## Anti-Patterns

- Treating inventory as expense at purchase when stock accounting is required.
- Letting stock quantities go negative without an explicit controlled policy.
- Hiding shrinkage inside COGS without variance evidence.
- Changing costing method mid-period without reviewer approval and disclosure.
- Posting count adjustments directly to GL outside the posting service.
- Claiming IFRS or IFRS for SMEs compliance while using LIFO.

## Required References

- `references/inventory-posting-rules.md`
- `references/domain-acceptance-tests.md`
- `doctrine/references/ledger-invariants.md`
- `doctrine/references/chart-of-accounts.md`
- `ledger-posting-engine-core/references/posting-service-contract.md`

## Examples

- `examples/fifo-costing-fixture.md`
- `examples/weighted-average-fixture.md`
- `examples/stock-count-variance-fixture.md`
- `examples/nrv-write-down-fixture.md`
- `examples/rejected-unsupported-costing-method.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Inventory accounting specialist |
| Reviewer roles | Controller, warehouse owner, tooling reviewer |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-11-15 |
| Release state | Draft until fixtures are executable in the validator |
| Caveat | Tax amounts in inventory examples are placeholders and require source-register entries before final output. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
