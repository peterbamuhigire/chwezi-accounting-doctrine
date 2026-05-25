# Idempotency and Reversal Rules

## Idempotency

Idempotency keys are mandatory for every posting command.

| Case | Result |
|---|---|
| New key, valid payload | Post journal. |
| Existing key, identical payload hash | Return original journal and mark `duplicate-returned`. |
| Existing key, different payload hash | Reject and log integrity error. |
| Missing key | Reject before ledger write. |

## Reversal

A reversal is a new posted journal linked to the original. It never edits or deletes the original.

Required reversal fields:

- Original journal ID.
- Reason code and free-text explanation.
- Actor and approval route.
- Reversal date and posting period.
- Full or partial reversal flag.
- Subledger resurrection or clearing impact.

## Locked periods

If the original period is locked, the system either routes the reversal through the reopen workflow or posts a dated current-period correction according to entity policy. Silent backdating is prohibited.
