# Accounting Invariant Tests

Purpose: deterministic fixtures and checks for Chwezi Core Systems accounting doctrine.  
Benchmark target: controller-grade automated acceptance evidence for posting engines and finance examples.  
Last verified: 2026-07-08

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
| Source register | Statutory fixture values carry source-register keys and allowed fixture states. |
| Period state | Ordinary postings into locked periods fail unless marked as governed adjustment/reversal. |
| Reversal linkage | Reversal journals identify the original journal and carry equal/opposite lines. |
| Idempotency | Source event IDs and idempotency keys are unique within a fixture. |
| Clearing accounts | Settlement clearing accounts resolve to zero or have an exception owner. |
| Evidence | Every journal line has an evidence ID that exists in the fixture evidence index. |

## Fixture Policy

Fixtures may contain illustrative statutory rates only when the source key is explicit and the fixture states that final statutory output still depends on `docs/source-registers/ifrs-tax-statutory-2026.md`. Test logic must never embed Uganda rates, thresholds, or filing deadlines as code constants.

## Negative Cases

`retail-vat-pos.fixture.json` includes rejected cases for unbalanced postings, stale source usage, locked-period posting, missing evidence, duplicate idempotency keys, and unresolved clearing balances. The runner must fail those cases intentionally; a negative case that passes is a test failure.
