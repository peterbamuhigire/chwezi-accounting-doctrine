# Journal Entry Schema

## Header

| Field | Required | Notes |
|---|---|---|
| `journal_id` | yes | System generated. |
| `entity_id` | yes | Legal entity. |
| `journal_number` | yes | Sequential or controlled unique reference. |
| `journal_type` | yes | Sale, receipt, bill, payment, payroll, inventory, asset, tax, reversal, adjustment, consolidation. |
| `period` | yes | Accounting period. |
| `journal_date` | yes | Accounting date. |
| `posting_timestamp` | yes | System timestamp. |
| `status` | yes | Posted, reversed, superseded-by-correction. |
| `source_event_id` | yes | Source workflow reference. |
| `idempotency_key` | yes | Posting command key. |
| `reversal_of` | conditional | Required for reversal journals. |
| `posting_service_version` | yes | Version or release identifier. |

## Lines

| Field | Required | Notes |
|---|---|---|
| `line_id` | yes | System generated. |
| `account_code` | yes | Active posting account. |
| `debit` | yes | Zero allowed, never null. |
| `credit` | yes | Zero allowed, never null. |
| `currency` | yes | Transaction currency. |
| `functional_amount` | conditional | Required when transaction currency differs. |
| `tax_code` | conditional | Required on taxable lines. |
| `source_register_key` | conditional | Required for final tax, statutory, or exchange-rate values. |
| `dimension_set` | yes | Complete dimension payload or approved blank policy. |
| `subledger_ref` | conditional | Customer, supplier, employee, asset, SKU, bank account, or intercompany counterparty. |

## Invariants

- Sum of debits equals sum of credits by currency and book.
- Each line has exactly one economic account meaning.
- Control-account lines must carry a subledger reference.
- Statutory lines must carry source-register lineage when final.
