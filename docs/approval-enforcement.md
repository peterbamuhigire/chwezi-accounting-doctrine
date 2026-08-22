# Approval enforcement adapter

Accounting mutations are declared in [`approval-adapter.json`](approval-adapter.json)
and use the shared contract from `skills-web-dev/docs/approval-contract.md`.

## Required review bundle

The preview must include entity, period, reporting basis, jurisdiction, source
documents, chart-of-accounts mapping, double-entry invariants, reconciliation,
period status, exception list, immutable correction path, and named preparer
and reviewer. Posted history is corrected with an auditable correction entry,
never silently edited.

## Gated actions

Journal posting, period close, tax filing, financial-statement release, control
changes, and payment release are L3. Segregation of duties is mandatory: the
preparer cannot be the sole approver, and dual approval must use distinct
authorised identities. Statutory, tax, IFRS/IAS, IPSAS, audit, and professional
judgement decisions require the responsible qualified reviewer.

## Stop conditions

Missing source, stale statutory authority, unreconciled balances, closed-period
ambiguity, duplicate event, absent approval ledger, or unavailable audit sink
fails closed. The accounting engine may prepare a classification or
reconciliation, but it must not post, close, file, release, or alter controls.

## Acceptance boundary

Runtime enforcement is only complete when the ledger, tax, payment, and report
boundaries call the shared gate before mutation and the approval-completeness
checker can replay every resulting audit link.
