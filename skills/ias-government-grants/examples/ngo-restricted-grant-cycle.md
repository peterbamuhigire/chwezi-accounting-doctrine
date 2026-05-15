# Example: NGO Restricted Grant Cycle

## Scenario

- Entity: Health Outreach NGO.
- Framework: IFRS for SMEs.
- Grant: `DONOR-A-CLINIC-2026`.
- Approved amount: 120,000,000.
- Restriction: clinic outreach costs from 2026-04-01 to 2026-09-30.
- Model: accrual model.

## Transactions

| Date | Event | Amount |
|---|---|---:|
| 2026-04-05 | Cash received | 60,000,000 |
| 2026-04-30 | Eligible salaries incurred | 18,000,000 |
| 2026-04-30 | Disallowed hospitality cost identified | 1,200,000 |

## Expected journals

| Account | Debit | Credit |
|---|---:|---:|
| Bank | 60,000,000 | 0 |
| Deferred income - grants | 0 | 60,000,000 |
| Programme salaries expense | 18,000,000 | 0 |
| Bank or payroll payable | 0 | 18,000,000 |
| Deferred income - grants | 18,000,000 | 0 |
| Donor grant income | 0 | 18,000,000 |

## Rejection path

The 1,200,000 hospitality cost is not released from deferred income because the donor budget does not permit it.

## Pass criteria

- Deferred income roll-forward shows receipt, release, and closing restricted balance.
- Eligible cost report ties to GL dimensions by grant and budget line.
- Disallowed cost remains flagged with reviewer action.
- Donor presentation and IFRS income recognition are both visible.
