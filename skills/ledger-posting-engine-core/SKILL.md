---
name: ledger-posting-engine-core
description: Use when designing, reviewing, or testing the canonical posting service, journal-entry schema, event-to-journal mapping, ledger invariants, reversals, idempotency, period locks, control-account tie-outs, and drilldown from source evidence to financial reports.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Ledger Posting Engine Core

<!-- dual-compat-start -->
## Use When

Use when a system needs governed accounting events, posted journals, reversals, idempotency, period locks, control-account tie-outs, or report drilldown.

## Do Not Use When

Do not use as a substitute for country statutory verification, tax advice, or specialist domain rules; load the relevant companion skill.

## Required Inputs

Entity, period, currency, account map, source event, evidence policy, dimensions, period state, and source-register snapshot when statutory values appear.

## Workflow

Validate the command, map the event to journal lines, enforce invariants, post atomically, emit audit evidence, and reject unsafe payloads before ledger write.

## Quality Standards

Balanced by currency and book, immutable after posting, source-evidenced, idempotent, reversible, period-aware, and drillable to source evidence.

## Anti-Patterns

Direct journal writes from feature modules, silent edits to posted journals, missing idempotency keys, and final statutory lines without source-register support.

## Outputs

Posted journals, rejection records, reversal journals, audit events, and control-account tie-out evidence.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `doctrine/references/chart-of-accounts.md`.
- Read `doctrine/references/live-rate-verification-protocol.md` before posting tax, payroll, statutory, or exchange-rate lines.
- Confirm the entity, reporting framework, jurisdiction, functional currency, open period, account map, dimensions, and source evidence policy.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Accounting event | Feature module | Required | Event type, source document, actor, period, currency, amount, and idempotency key present. |
| CoA policy register | Chart-of-accounts owner | Required | Every line maps to an active posting account and reporting group. |
| Period-state register | Close process | Required | Target period is `open`, `soft-closed`, or governed `reopened`. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | Required when statutory values appear | Entries are `verified-current` or approved caveat; no stale final values. |
| Evidence pack pointer | Source workflow | Required by evidence policy | Source file, checksum, and audit-log reference captured. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Posted journal | GL, reports, audit export | Balanced by currency and book; immutable after post. |
| Journal rejection | Source workflow, exception queue | Reason code, failed invariant, actor, and source event retained. |
| Reversal journal | GL, subledgers, audit export | Original remains immutable; reversal links to original journal. |
| Posting audit event | Internal controls, auditors | Actor, source, idempotency key, posting-service version, and evidence pointer present. |
| Control-account tie-out | Month-end close | Subledger balances reconcile to GL control accounts. |

## Decision Rules

1. The posting service is the only approved writer of posted journal headers and lines.
2. Every posted journal balances debits and credits by currency and by accounting book.
3. Posted journals are immutable. Corrections use reversal plus governed adjustment.
4. Every posting command carries an idempotency key. Duplicate identical payloads return the original result; duplicate keys with different payloads fail.
5. Locked or archived periods reject ordinary postings. Reopened periods require a reopen reason and approver.
6. Dimensions flow from source event to every journal line unless the CoA policy defines an explicit override.
7. Tax, payroll, statutory, and exchange-rate lines require a source-register reference before final output.
8. Report figures must drill down to account, journal, journal line, source document, evidence file, and audit-log entry.

## Acceptance Evidence

- `examples/vat-inclusive-cash-sale.md` posts cash gross, revenue net, and VAT control with a source-register dependency.
- `examples/customer-receipt-allocation.md` clears AR through a customer receipt without revenue re-recognition.
- `examples/supplier-bill-and-payment.md` proves AP recognition and payment clearing.
- `examples/reversal.md` proves immutable original journal plus linked reversal.
- `examples/rejected-unbalanced-entry.md` proves pre-post rejection.
- `examples/foreign-currency-bank-receipt.md` proves functional-currency treatment and exchange-rate source dependency.
- `references/invariant-tests.md` is used as the minimum domain acceptance test list.

## Anti-Patterns

- Feature modules inserting directly into journal tables.
- Editing or deleting posted journal lines to "fix" mistakes.
- Posting tax amounts as memo text instead of first-class tax-control lines.
- Reposting an integration event without idempotency protection.
- Allowing report totals that cannot drill down to source evidence.
- Using final tax, statutory, payroll, or exchange-rate values without source-register state.

## Required References

- `references/posting-service-contract.md`
- `references/journal-entry-schema.md`
- `references/event-to-journal-map.md`
- `references/idempotency-and-reversal-rules.md`
- `references/invariant-tests.md`
- `doctrine/references/ledger-invariants.md`
- `doctrine/references/chart-of-accounts.md`
- `doctrine/references/live-rate-verification-protocol.md`

## Examples

- `examples/vat-inclusive-cash-sale.md`
- `examples/customer-receipt-allocation.md`
- `examples/supplier-bill-and-payment.md`
- `examples/reversal.md`
- `examples/rejected-unbalanced-entry.md`
- `examples/foreign-currency-bank-receipt.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Accounting systems architect |
| Reviewer roles | Controller, tax reviewer when statutory lines are present, tooling reviewer |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-11-15 |
| Release state | Draft until invariant tests are wired into the doctrine validator |
| Caveat | This skill defines posting rules and fixtures; it does not supply final statutory rates. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
