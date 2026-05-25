# Fixture: Two-Entity Intercompany Sale

## Local entity A

| Account | Debit | Credit |
|---|---:|---:|
| Intercompany receivable - B | 500.00 | 0.00 |
| Intercompany sales | 0.00 | 500.00 |

## Local entity B

| Account | Debit | Credit |
|---|---:|---:|
| Intercompany purchases | 500.00 | 0.00 |
| Intercompany payable - A | 0.00 | 500.00 |

## Pass criteria

- Counterparty, reference, amount, currency, and period match.
- Pair is eligible for group elimination.
