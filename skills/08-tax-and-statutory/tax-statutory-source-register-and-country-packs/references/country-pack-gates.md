# Country Pack Gates

## Required country-pack surfaces

| Surface | Gate |
|---|---|
| VAT or sales tax | Source entries for rates, exemptions, zero-rating, return fields, and filing cadence before final output. |
| PAYE or payroll income tax | Source entries for rates, brackets, reliefs, and schedule format before final payroll output. |
| Social security | Source entries for employee and employer obligations. |
| Withholding tax | Source entries by transaction type and residency rule. |
| Income tax | Source entries for company or entity income tax rules and deadlines. |
| E-invoicing | Source entries for platform requirements, schema version, and evidence fields. |
| Exchange rates | Source entries for transaction, closing, average, customs, or statutory rate type. |

## Blocking conditions

- Country pack has no authority hierarchy.
- Output uses a final value with no source-register key.
- Entry state is not `verified-current` or reviewer-approved `verified-with-caveat`.
- Recheck date has passed.
- Entry jurisdiction does not match the output country.
- Entry topic does not match the statutory surface being generated.
- Country skeleton is used to create final rates.

## Skeleton rule

Skeleton packs may define authorities, expected surfaces, and review workflow. They must not contain final statutory rates unless the entries have been promoted under the source-register contract.
