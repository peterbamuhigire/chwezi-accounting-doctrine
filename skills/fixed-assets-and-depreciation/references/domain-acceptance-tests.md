# Fixed-Asset Domain Acceptance Tests

| Test | Expected result |
|---|---|
| Acquisition capitalization | Asset is registered and cost posted to asset account with evidence. |
| Expense below threshold | Item below capitalization policy posts to expense unless approved exception exists. |
| Monthly depreciation | Depreciation expense and accumulated depreciation post once per asset-period. |
| Duplicate depreciation run | Same idempotency key returns previous result or rejects safely. |
| Disposal | Cost and accumulated depreciation removed; gain or loss recognized. |
| Register tie-out | Asset register reconciles to GL cost and accumulated depreciation. |
| Impairment indicator | Trigger routes to impairment review before final reporting. |
| Tax depreciation caveat | Tax schedule cannot use final rates without source-register support. |
