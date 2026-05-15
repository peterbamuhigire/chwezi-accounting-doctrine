# Fixture: Stock Count Variance

## Setup

- System quantity: 100 units.
- Counted quantity: 97 units.
- Unit cost: 4.00.
- Approved variance reason: shrinkage.

## Expected journal

| Account | Debit | Credit |
|---|---:|---:|
| Inventory shrinkage expense | 12.00 | 0.00 |
| Inventory control | 0.00 | 12.00 |

## Pass criteria

- Count sheet and reviewer approval are attached.
- Variance is visible in exception reporting.
- Posting is rejected if approval is missing.
