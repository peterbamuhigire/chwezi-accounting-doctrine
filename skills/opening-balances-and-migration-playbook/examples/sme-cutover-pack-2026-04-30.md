# Example - SME Cutover Pack 2026-04-30

Entity: Chwezi Demo Ltd  
Conversion date: 2026-04-30  
Timezone: Africa/Kampala  
Framework: IFRS for SMEs  
Release state: `pass-with-caveats`

## Opening trial balance summary

| Area | Amount UGX | Tie-out |
|---|---:|---|
| Cash and bank | 30,850,000 | Bank and cash evidence attached. |
| Trade receivables | 15,600,000 | AR open-item schedule ties to control. |
| Inventory | 18,900,000 | Stock schedule ties to control. |
| Fixed assets, net | 91,000,000 | Asset register ties to GL. |
| Trade payables | (7,800,000) | AP open-item schedule ties to control. |
| Tax and payroll liabilities | (2,100,000) | Schedules attached; tax source status caveated. |
| Borrowings | (55,000,000) | Loan statement attached. |
| Equity and retained earnings | (91,100,000) | Balancing equity schedule. |
| Migration suspense | (350,000) | Waiver approved, owner assigned. |

## Suspense caveat

| Item | Amount UGX | Owner | Due | Plan |
|---|---:|---|---|---|
| Legacy supplier credit note missing support | 350,000 | Controller | 2026-05-31 | Obtain supplier statement or reverse after approval. |

## Required tie-outs

| Tie-out | Result |
|---|---|
| AR control equals AR open-item schedule | Pass |
| AP control equals AP open-item schedule | Pass |
| Inventory control equals stock quantity by cost | Pass |
| Fixed-asset cost less accumulated depreciation equals register | Pass |
| Bank opening balances equal latest reconciled statements | Pass |
| Payroll liabilities equal employee schedules | Pass |

## Sign-off

| Role | Name | Time | Decision |
|---|---|---|---|
| Preparer | Jane Doe | 2026-05-01T10:15:00+03:00 | Submitted |
| Reviewer | Peter Bamuhigire | 2026-05-01T14:40:00+03:00 | Approved with suspense caveat |
| Approver | Ssempa Joseph | 2026-05-01T16:00:00+03:00 | Approved |

## Go-live decision

Go-live is permitted on 2026-05-01. Migration Suspense is disclosed and must clear before the third close or receive a renewed Controller and CFO waiver.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
