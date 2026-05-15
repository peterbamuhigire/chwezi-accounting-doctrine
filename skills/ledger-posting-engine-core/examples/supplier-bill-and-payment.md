# Fixture: Supplier Bill and Payment

## Supplier bill journal

| Account | Debit | Credit | Evidence |
|---|---:|---:|---|
| Expense or asset account | 400.00 | 0.00 | Supplier invoice. |
| Recoverable tax control | 80.00 | 0.00 | Source-register-backed tax code when final. |
| Accounts payable control | 0.00 | 480.00 | Supplier subledger item. |

## Supplier payment journal

| Account | Debit | Credit | Evidence |
|---|---:|---:|---|
| Accounts payable control | 480.00 | 0.00 | Supplier open item. |
| Bank or mobile money | 0.00 | 480.00 | Payment evidence. |

## Pass criteria

- Bill creates AP and payment clears AP.
- Tax line is not memo-only.
- Both postings use the posting service and source evidence.
