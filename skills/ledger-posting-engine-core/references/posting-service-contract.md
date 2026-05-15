# Posting Service Contract

The posting service is the only approved writer of posted journal headers and journal lines.

## Command

| Field | Required | Rule |
|---|---|---|
| `event_id` | yes | Stable source event identifier. |
| `event_type` | yes | Controlled event name, such as `cash_sale`, `supplier_bill`, or `payroll_run`. |
| `idempotency_key` | yes | Unique per source event and payload version. |
| `entity_id` | yes | Legal entity that owns the ledger. |
| `book` | yes | Accounting book, such as `primary`, `tax`, or `group`. |
| `period` | yes | Posting period; checked against period-state register. |
| `currency` | yes | Transaction currency. |
| `functional_currency` | yes | Entity functional currency. |
| `source_document` | yes | Invoice, receipt, payslip, bank line, stock count, or equivalent. |
| `actor` | yes | Named user or governed service account. |
| `dimensions` | yes | Cost center, project, branch, grant, product, or approved blank policy. |
| `lines` | yes | Proposed debit and credit lines. |

## Response

| State | Meaning |
|---|---|
| `posted` | Journal written, audit event emitted, and journal ID returned. |
| `duplicate-returned` | Same idempotency key and identical payload; prior result returned. |
| `rejected` | Invariant failed before posting. No journal is written. |
| `blocked-review` | Reviewer decision is required before posting. |

## Transaction boundary

The service validates, writes journal header, writes journal lines, writes audit event, updates source event posting state, and emits downstream notifications inside one transaction or a documented equivalent unit of work.

## Rejection evidence

Every rejection records: command hash, source event, actor, invariant, reason code, timestamp, and suggested remediation.
