# Intercompany Matching Rules

## Match keys

| Key | Required |
|---|---|
| Selling entity | yes |
| Buying entity | yes |
| Counterparty account pair | yes |
| Document or transaction reference | yes |
| Currency | yes |
| Amount | yes |
| Period | yes |

## Match states

| State | Meaning |
|---|---|
| `matched` | Entity pair, amount, document, and period agree. |
| `timing-difference` | Document agrees but period differs. |
| `amount-difference` | Document agrees but amount differs. |
| `missing-counterparty` | One side is absent. |
| `disputed` | Business owner disputes the balance. |

## Exception rule

Every unmatched item has owner, age, reason, next action, and expected resolution date. Final group output discloses unresolved material exceptions.
