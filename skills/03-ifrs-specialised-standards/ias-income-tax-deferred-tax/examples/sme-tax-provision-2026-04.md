# Example: SME Tax Provision April 2026

## Scenario

- Entity: SME trading company.
- Framework: IFRS for SMEs.
- Period: April 2026.
- Accounting profit before tax: 40,000,000.
- Draft tax rate assumption: 30 percent, pending source-register verification.

## Current tax computation

| Item | Amount |
|---|---:|
| Accounting profit before tax | 40,000,000 |
| Non-deductible expenses | 2,000,000 |
| Taxable profit before timing differences | 42,000,000 |
| Current tax at 30 percent | 12,600,000 |

## Deferred tax

| Temporary difference | Amount | Direction | Deferred tax |
|---|---:|---|---:|
| Receivable allowance not yet tax-deductible | 3,000,000 | DTA | 900,000 |
| Accelerated tax depreciation | 5,000,000 | DTL | 1,500,000 |
| Net deferred tax liability movement | 2,000,000 | DTL | 600,000 |

## Expected journal, if rate is verified-current

| Account | Debit | Credit |
|---|---:|---:|
| Current income tax expense | 12,600,000 | 0 |
| Income tax payable | 0 | 12,600,000 |
| Deferred tax expense | 600,000 | 0 |
| Deferred tax liability | 0 | 600,000 |

## Caveat path

If the tax-rate source-register entry is draft or stale, the computation may be retained as a planning workpaper but the journal and final report are blocked.

## Pass criteria

- Tax rate key, effective period, and reviewer state are recorded.
- Permanent differences are excluded from deferred tax.
- DTA has probability evidence.
- Current and deferred tax are shown separately.
