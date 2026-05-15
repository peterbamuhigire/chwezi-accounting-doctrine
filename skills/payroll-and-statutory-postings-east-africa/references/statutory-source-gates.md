# Statutory Source Gates

Every final payroll output checks the source register before rates, thresholds, reliefs, ceilings, schedules, or deadlines are used.

## Required gate fields

| Surface | Required source entry |
|---|---|
| PAYE | Rates, brackets, reliefs, exemptions, taxable benefit treatment, schedule format. |
| NSSF or social security | Employee contribution, employer contribution, ceilings, effective dates, return schedule. |
| LST or local service tax | Country and locality applicability, rates or bands, deadlines. |
| WHT | Transaction type, residency rule, certificate treatment, remittance schedule. |
| Other statutory deductions | Legal basis, calculation rule, remittance process. |

## Failure behavior

- Final payroll run is blocked.
- Draft simulation is allowed only with visible caveat.
- The exception names the missing or stale source keys.
- Reviewer must refresh evidence or downgrade output state to draft.
