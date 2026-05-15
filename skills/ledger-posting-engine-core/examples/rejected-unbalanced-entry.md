# Fixture: Rejected Unbalanced Entry

## Source event

Proposed journal:

| Account | Debit | Credit |
|---|---:|---:|
| Cash | 100.00 | 0.00 |
| Revenue | 0.00 | 99.00 |

## Expected result

- Posting state: `rejected`.
- No journal header or lines written.
- Rejection reason: debits and credits do not balance.
- Audit rejection record includes actor, event, payload hash, and timestamp.
