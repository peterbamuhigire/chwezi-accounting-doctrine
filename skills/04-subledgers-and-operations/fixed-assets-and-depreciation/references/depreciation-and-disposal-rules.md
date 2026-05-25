# Depreciation and Disposal Rules

## Depreciation

- Start depreciation when the asset is available for use.
- Stop depreciation when derecognized or when policy and framework support held-for-sale treatment.
- Run depreciation through the posting service.
- Use idempotency key `asset_id + period + method_version`.
- Review useful life, residual value, and method at least annually.

## Disposal

Disposal removes:

- Asset cost.
- Accumulated depreciation.
- Related impairment allowance if any.

The difference between proceeds and net book value is recognized as gain or loss on disposal.

## Tax caveat

Tax allowances, capital allowances, investment deductions, and statutory depreciation are country-pack outputs. They require source-register entries and do not replace accounting depreciation unless the reporting basis explicitly requires it.
