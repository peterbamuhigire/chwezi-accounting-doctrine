# Accounting Invariant Tests

Purpose: deterministic fixtures and checks for Chwezi Core Systems accounting doctrine.  
Benchmark target: controller-grade automated acceptance evidence for posting engines and finance examples.  
Last verified: 2026-08-11

Run:

```powershell
.\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1
```

Strict JSON output:

```powershell
.\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1 -Json
```

## Covered Invariants

| Invariant | Pass/fail rule |
|---|---|
| Double entry | Each journal balances debits and credits by currency. |
| VAT decomposition | VAT-inclusive fixture lines reconcile gross, net, and VAT using the fixture rate and source key. |
| Source-state identity | Fixture source states are loaded from `doctrine/source-register/schema.yaml`, resolve to exactly one source-register ID, and match its state; illustrative calculations remain blocked from final statutory output when the state is `draft`. |
| Period state | Ordinary postings into locked periods fail unless marked as governed adjustment/reversal. |
| Reversal linkage | `FULL-REVERSAL-OF-POS-SALE` identifies the original journal and proves equal/opposite lines; `REJECT-MALFORMED-REVERSAL` must fail linkage. |
| Idempotency | Base cases use unique source event IDs and idempotency keys; `REJECT-DUPLICATE-IDEMPOTENCY` proves a changed-payload duplicate is rejected. |
| Clearing accounts | Settlement clearing accounts resolve to zero or have an exception owner. |
| Evidence | Every journal line has an evidence ID that exists in the fixture evidence index. |

## Fixture Policy

Fixtures are fictional and test-labelled. They may contain illustrative statutory rates only when the source key and register state are explicit; this fixture uses `draft` and blocks final statutory output. Final values still require the applicable snapshot under `doctrine/source-register/` and reviewer sign-off. Test logic must never embed Uganda rates, thresholds, or filing deadlines as code constants.

## Negative Cases

`retail-vat-pos.fixture.json` includes rejected cases for unbalanced postings, stale and draft source usage, locked-period posting, missing evidence, malformed reversal linkage, and a changed-payload duplicate idempotency key. It also contains a full reversal case. The runner must fail those cases intentionally; a negative case that passes is a test failure.
