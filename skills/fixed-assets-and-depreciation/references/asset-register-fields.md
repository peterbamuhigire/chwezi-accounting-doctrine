# Asset Register Fields

| Field | Required | Notes |
|---|---|---|
| `asset_id` | yes | Stable unique identifier. |
| `asset_name` | yes | Human-readable label. |
| `asset_class` | yes | Building, vehicle, equipment, computer, furniture, leasehold improvement, or entity class. |
| `acquisition_date` | yes | Date acquired. |
| `available_for_use_date` | yes | Depreciation start basis. |
| `cost` | yes | Capitalized cost. |
| `accumulated_depreciation` | yes | GL-tied balance. |
| `net_book_value` | yes | Cost less accumulated depreciation and impairment. |
| `depreciation_method` | yes | Straight-line, reducing balance, units of production, or approved method. |
| `useful_life` | yes | Policy-supported period or units. |
| `residual_value` | yes | May be zero if policy supports it. |
| `location` | yes | Physical or responsible branch. |
| `custodian` | yes | Responsible person or department. |
| `source_document` | yes | Invoice, contract, import evidence, or migration support. |
| `status` | yes | Active, held-for-sale, disposed, fully-depreciated, impaired, or under-construction. |

## Tie-out rule

Asset-register cost and accumulated depreciation totals must reconcile to GL asset cost and accumulated depreciation accounts at close.
