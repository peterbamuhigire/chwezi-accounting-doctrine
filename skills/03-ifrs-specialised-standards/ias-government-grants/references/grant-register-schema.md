# Grant Register Schema

The grant register is the controlling record for government grants, donor assistance, restrictions, conditions, drawdowns, releases, and repayments.

## Header fields

| Field | Required | Rule |
|---|---|---|
| `grant_id` | yes | Stable key, such as `DONOR-A-HEALTH-2026`. |
| `grantor` | yes | Government agency, donor, foundation, or partner. |
| `recipient_entity` | yes | Legal entity receiving the grant. |
| `framework` | yes | IFRS for SMEs Section 24 or full IFRS IAS 20. |
| `model` | yes | Performance model, accrual model, IAS 20 gross, or IAS 20 net presentation. |
| `currency` | yes | Contract currency. |
| `approved_amount` | yes | Total committed amount. |
| `agreement_date` | yes | Signed agreement date. |
| `eligible_period_start` | yes | First eligible cost or condition date. |
| `eligible_period_end` | yes | Final eligible cost or condition date. |
| `restriction_type` | yes | Unrestricted, purpose, time, capital asset, repayable, or mixed. |
| `review_state` | yes | Draft, active-reviewed, caveated, suspended, closed. |

## Condition fields

| Field | Rule |
|---|---|
| `condition_id` | One row per performance, time, reporting, matching-fund, or asset-use condition. |
| `recognition_trigger` | Receipt, eligible cost incurred, milestone achieved, asset depreciation, or condition waived. |
| `evidence_required` | Agreement, donor approval, milestone report, asset register, or utilisation report. |
| `recognition_state` | Not met, partly met, met, failed, waived, or repayable. |

## Transaction fields

- Receipts and drawdowns.
- Eligible costs and disallowed costs.
- Deferred-income releases.
- Repayments and recoveries.
- FX differences where grant currency differs from functional currency.

## Controls

- Block income recognition for conditional grants until condition evidence is reviewed.
- Track donor reporting separately from IFRS presentation.
- Prevent cross-grant funding unless the agreement explicitly permits it and reviewer signs off.
