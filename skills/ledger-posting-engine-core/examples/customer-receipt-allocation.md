# Fixture: Customer Receipt Allocation

## Source event

- Event type: `customer_receipt`
- Receipt amount: `250.00`
- Customer open invoice: `250.00`

## Expected journal

| Account | Debit | Credit | Evidence |
|---|---:|---:|---|
| Bank or mobile money | 250.00 | 0.00 | Bank or provider statement line. |
| Accounts receivable control | 0.00 | 250.00 | Customer invoice and allocation. |

## Pass criteria

- No revenue is credited on receipt allocation.
- AR subledger open item is cleared.
- Bank or mobile-money line is available for reconciliation.
