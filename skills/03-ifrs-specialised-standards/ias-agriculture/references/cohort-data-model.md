# Biological-Asset Cohort Data Model

Biological assets are tracked by cohort unless individual animal or plant tracking is required by policy.

## Core fields

| Field | Required | Rule |
|---|---|---|
| `cohort_id` | yes | Stable identifier such as `BIRDC-LAYER-2026-Q2`. |
| `asset_class` | yes | Layer, broiler, dairy, fish, plantation, or other governed class. |
| `framework` | yes | `IFRS for SMEs` or `Full IFRS`. |
| `location_id` | yes | Farm, house, pond, field, or site. |
| `start_date` | yes | Hatch, birth, planting, acquisition, or stocking date. |
| `opening_quantity` | yes | Count, biomass, acreage, or plant count. |
| `unit_of_measure` | yes | Bird, head, kg, acre, tree, or litre where appropriate. |
| `measurement_basis` | yes | Fair value less costs to sell or cost model. |
| `valuation_method_id` | conditional | Required for fair-value measurement. |
| `carrying_amount` | yes | Ledger carrying value before current event. |
| `status` | yes | Active, harvested, sold, transferred, lost, or closed. |

## Event ledger

| Event | Quantity effect | Accounting effect |
|---|---:|---|
| Acquisition or birth | Increase | Recognise biological asset at cost or fair value basis. |
| Feed and husbandry cost | None | Expense or capitalise only under approved policy. |
| Mortality | Decrease | Recognise loss in period of death. |
| Fair-value remeasurement | None | Recognise gain or loss in P&L. |
| Harvest | Produce increase; biological asset may decrease | Recognise agricultural produce at FVLCTS. |
| Sale of biological asset | Decrease | Derecognise carrying amount and recognise gain or loss. |

## Reconciliation

For each reporting period, produce:

- Opening quantity and carrying amount.
- Additions, births, purchases, transfers in.
- Mortality, culls, harvests, sales, transfers out.
- Fair-value gains or losses.
- Closing quantity and carrying amount tied to GL.

## Blocking controls

- Quantity cannot be negative.
- Closed cohorts cannot accept new events except approved reversal or correction.
- Fair-value posting requires valuation evidence and reviewer state.
- Harvested produce must move to inventory after harvest; it must not remain biological asset inventory.
