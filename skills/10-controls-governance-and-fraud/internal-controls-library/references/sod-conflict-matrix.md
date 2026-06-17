# Segregation of Duties Conflict Matrix

The role registry must prevent a single user from completing a high-risk workflow end to end. Exceptions require Controller approval, a time limit, and audit-log evidence.

## Role conflicts

| Workflow | Maker role | Conflicting approval role | Reason |
|---|---|---|---|
| Supplier creation and supplier payment | Accountant or Clerk | Payment Approver | Prevent fake supplier payment. |
| Supplier bank-detail change and next payment | Accountant | Payment Approver | Prevent diversion after master-data change. |
| Manual journal creation and approval | Accountant | Controller | Prevent unsupported ledger adjustments. |
| Payroll master change and payroll approval | HR or Payroll Officer | Payroll Approver | Prevent unauthorised salary changes. |
| Period reopen and posting into reopened period | Controller | Posting Approver | Prevent backdoor locked-period posting. |
| Tax-rate change and tax return approval | Tax Reviewer | Return Approver | Preserve independent tax review. |
| Inventory item setup and stock write-off approval | Inventory Manager | Controller | Prevent item manipulation and write-off abuse. |
| User role assignment and accounting approval | Administrator | Any accounting approver | Administrator must not inherit accounting power. |

## Permission rules

- A user may prepare and submit a record.
- The same user must not approve that record where maker-checker applies.
- Emergency override must expire automatically.
- Role changes granting accounting authority require Controller sign-off.
- Administrator actions that affect finance authority are logged as control events.

## Exception record

```yaml
exception_id: "sod-2026-05-001"
user: "..."
conflict: "supplier-bank-change-and-payment-approval"
business_reason: "Temporary absence of branch manager"
approved_by: "Controller"
starts_at: "2026-05-20T08:00:00+03:00"
expires_at: "2026-05-20T18:00:00+03:00"
compensating_control: "Controller reviews all payments next morning"
state: "approved"
```

## Uganda field sources

For Ugandan NGO/CSO engagements, the segregation chain (request -> check -> approve -> disburse -> account -> review), the amount-tiered authorisation matrix, and the dual-signatory bank mandate (any 2 of 3) follow the patterns in `doctrine/references/uganda-ngo-financial-management-patterns.md` (synthesised from UCOBAC Finance & Accounting Manual; MCLD Uganda Financial Management Policy May 2023; IMAU Accounting Manual). These are entity-set benchmarks, not statutory mandates. For public bodies use `doctrine/references/uganda-public-sector-pfm.md` (signatory rules under SI 25/2007).

## Release blockers

- Active permanent SoD conflict in production.
- Administrator has accounting approval rights.
- Override without expiry.
- Override without compensating review.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
