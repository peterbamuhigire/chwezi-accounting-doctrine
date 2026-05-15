# Fair-Value Methodology for Biological Assets

Use this reference to document fair value less costs to sell for biological assets and agricultural produce at harvest.

## Method selection

| Asset or produce | Preferred method | Fallback |
|---|---|---|
| Layer flock | Market price for comparable flock adjusted for age, productivity, mortality, and selling costs. | Cost less impairment when fair value is not reliably measurable without undue cost or effort. |
| Broilers | Observable market price per live bird or kg at reporting date less transport and selling costs. | Accumulated cost for immature short-cycle cohorts where market data is unavailable. |
| Dairy herd | Market price by age, breed, parity, health, and milk yield less disposal costs. | Cost model with impairment review. |
| Fish stock | Market price by species, size class, survival rate, and expected harvest yield less costs to sell. | Cost model until biomass is reliably measurable. |
| Harvested eggs, milk, fish, fruit | Market selling price at harvest point less costs to sell. | No cost-model fallback at harvest; document the best observable evidence used. |

## Required inputs

- Cohort identifier, species, location, age or stage, and opening count.
- Physical count or production estimate at reporting date.
- Observable market evidence and date obtained.
- Adjustments for quality, age, mortality, yield, restrictions, and selling costs.
- Reviewer conclusion on whether fair value is reliably measurable.

## Costs to sell

Include only incremental costs directly attributable to disposal, such as:

- Broker, auction, or agent commissions.
- Transport to market when required for sale.
- Levies or market fees tied to sale.

Do not deduct finance costs, income tax, or general overhead.

## Output

| Field | Rule |
|---|---|
| `fair_value_gross` | Observable price multiplied by measured quantity. |
| `costs_to_sell` | Incremental disposal costs only. |
| `fair_value_less_costs_to_sell` | Gross fair value less costs to sell. |
| `measurement_gain_loss` | Closing FVLCTS less carrying amount before remeasurement. |
| `evidence_state` | `reviewed`, `caveated`, or `fallback-cost-model`. |

## Controls

- Block final reporting when market evidence is stale or absent and no cost-model fallback is documented.
- Retain source, date, preparer, reviewer, and assumptions for every reporting date.
- Route material model changes to IFRS reviewer sign-off before posting.
