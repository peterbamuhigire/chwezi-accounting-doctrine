# Fixture: Reversal

## Setup

Original journal `J-100` is posted and immutable.

## Expected reversal journal

| Account | Debit | Credit |
|---|---:|---:|
| Original credit account | Original credit amount | 0.00 |
| Original debit account | 0.00 | Original debit amount |

## Required metadata

- `reversal_of: J-100`
- Reason code.
- Actor.
- Approval route when required.
- Reversal date and period.

## Pass criteria

- `J-100` remains posted and unchanged.
- Reversal balances.
- Subledger effects are restored or cleared according to the original event type.
