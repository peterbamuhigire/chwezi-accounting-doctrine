# Invariant Tests

Use these as minimum domain acceptance tests for any implementation of the posting engine.

| Test | Setup | Expected result |
|---|---|---|
| Balanced journal accepted | Equal debit and credit by currency | Journal posts and audit event exists. |
| Unbalanced journal rejected | Debit exceeds credit | No journal written; rejection recorded. |
| Duplicate identical event | Same idempotency key and same payload | Existing journal returned. |
| Duplicate changed event | Same key, changed payload | Integrity rejection recorded. |
| Locked period adjustment | Target period `locked` | Rejected unless governed reopen exists. |
| Reversal | Reverse a posted journal | Original remains immutable; reversal links to original. |
| Tax line without source | Final VAT line lacks source key | Rejected. |
| Control tie-out | AR subledger differs from GL control | Close blocker emitted. |
| Missing evidence | Supplier bill has no invoice evidence | Rejected or routed to approved exception. |
| FX receipt | Foreign-currency receipt | Functional amount and exchange-rate source required. |
