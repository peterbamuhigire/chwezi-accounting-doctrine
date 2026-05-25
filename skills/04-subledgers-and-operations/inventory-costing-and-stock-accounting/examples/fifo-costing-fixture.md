# Fixture: FIFO Costing

## Setup

| Movement | Quantity | Unit cost |
|---|---:|---:|
| Receipt 1 | 10 | 5.00 |
| Receipt 2 | 10 | 6.00 |
| Sale | 12 | n/a |

## Expected COGS

- 10 units at 5.00 = 50.00
- 2 units at 6.00 = 12.00
- Total COGS = 62.00

## Expected journal

| Account | Debit | Credit |
|---|---:|---:|
| COGS | 62.00 | 0.00 |
| Inventory control | 0.00 | 62.00 |

## Pass criteria

- Remaining layer: 8 units at 6.00.
- Inventory subledger ties to GL control.
