# Fixture: Monthly Depreciation

## Setup

- Asset cost: 12,000.00.
- Residual value: 0.00.
- Useful life: 60 months.
- Method: straight-line.

## Expected monthly depreciation

- Monthly expense: 200.00.

## Expected journal

| Account | Debit | Credit |
|---|---:|---:|
| Depreciation expense | 200.00 | 0.00 |
| Accumulated depreciation | 0.00 | 200.00 |

## Pass criteria

- Run is idempotent for the asset-period.
- Accumulated depreciation updates in the register and GL.
