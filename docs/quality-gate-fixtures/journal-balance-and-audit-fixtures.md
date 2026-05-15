# Journal Balance And Audit Fixtures

Quality gate blockers covered: `B-011`, `B-014`.

## Fixture: Single-Sided Ledger Effect

Fail input:

```yaml
journal: JV-2026-05-001
lines:
  - account: "Sales - Goods"
    debit: 0
    credit: 118000
```

Expected finding: `B-011` because total debits do not equal total credits.

Pass input:

```yaml
journal: JV-2026-05-001
lines:
  - account: "Accounts Receivable Control"
    debit: 118000
    credit: 0
  - account: "Sales - Goods"
    debit: 0
    credit: 100000
  - account: "Output VAT Control"
    debit: 0
    credit: 18000
```

Expected result: no `B-011` finding.

## Fixture: Missing Audit Log Fields

Fail input:

```yaml
journal: JV-2026-05-002
audit-log:
  actor: null
  timestamp: "2026-05-15T09:00:00+03:00"
  source-document: "INV-1001"
  evidence: null
  lineage: "sales-invoice-posting"
```

Expected finding: `B-014`.

Pass input:

```yaml
journal: JV-2026-05-002
audit-log:
  actor: "posting-service"
  timestamp: "2026-05-15T09:00:00+03:00"
  source-document: "INV-1001"
  evidence: "sales/invoices/INV-1001.pdf"
  lineage: "sales-invoice-posting"
```

Expected result: no `B-014` finding.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
