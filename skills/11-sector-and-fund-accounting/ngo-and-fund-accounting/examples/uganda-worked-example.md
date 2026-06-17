# Uganda Worked Example - Ngo And Fund Accounting

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions. All UGX and FX figures below are ILLUSTRATIVE org-policy benchmarks, not statutory amounts; statutory rates (PAYE, NSSF, VAT, WHT) are not set here and flow through the source register / Statutory Schedule (verify current). See `doctrine/references/uganda-ngo-financial-management-patterns.md`.

## Scenario

A Ugandan NGO (functional currency UGX) signs a 12-month restricted grant with an international donor for EUR 200,000 to deliver a community-health project. The agreement is budgeted in both EUR and UGX with the rate at signing shown. The grant is donor-restricted, ring-fenced to one project cost centre and one project bank account. The preparer provides the signed agreement, the donor budget, the disbursement advices, and the quarter's expenditure ledger. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: NGO entity, FY 1 Jan - 31 Dec, IFRS for SMEs, Uganda, functional currency UGX. |
| Source document | Present: grant agreement ref, donor budget (EUR + UGX), disbursement advices with dated rates. |
| Policy reference | Present: references/source-basis.md, references/implementation-rules.md, and doctrine/references/uganda-ngo-financial-management-patterns.md. |
| Ledger route | Present: deferred-income recognition and quarterly release posting. |
| Reviewer route | Present: role-based reviewer assigned in SKILL.md. |

## Illustrative Figures (org-policy, not statutory)

| Item | Value (illustrative) |
|---|---|
| Grant value | EUR 200,000 |
| Rate at signing (original-budget rate) | EUR 1 = UGX 4,200 -> original budget UGX 840,000,000 |
| Q1 disbursement | EUR 50,000 received at EUR 1 = UGX 4,250 -> UGX 212,500,000 |
| Weighted-average rate to date (flexing) | EUR 1 = UGX 4,250 (single disbursement this quarter) |
| Q1 actual expenditure | UGX 198,000,000 |

## Processing Trace

1. Confirm framework (IFRS for SMEs) and that this is a restricted, income-related grant under the deferred-income approach (not the capital approach).
2. On receipt, recognise cash and a deferred-income liability for the unspent restricted balance; do not credit income on receipt.
3. As eligible project cost is incurred in the quarter, release matching deferred income to "other income - grants/donations".
4. Flex the budget using the weighted-average disbursement rate; accumulate the exchange difference versus the original-budget rate and explain it in the quarterly report.
5. Reconcile the project cost centre and project bank account to the GL; measure variance against the flexed budget, not the original budget.

## Illustrative Posting (deferred income and release)

| Step | Dr | Cr | Amount (UGX, illustrative) |
|---|---|---|---|
| Q1 disbursement received | Project bank | Deferred income - donor grant (restricted) | 212,500,000 |
| Q1 income recognised on spend | Deferred income - donor grant (restricted) | Other income - grants/donations | 198,000,000 |
| Carried-forward restricted balance | (Deferred income liability remaining) | | 14,500,000 |

## Quarterly Donor Report - Budget vs Flexed vs Actual

| Line | Original budget (rate 4,200) | Flexed budget (weighted-avg 4,250) | Actual | Variance vs flexed |
|---|---|---|---|---|
| Q1 release/spend | 210,000,000 | 212,500,000 | 198,000,000 | 14,500,000 underspend |
| Exchange difference (accumulated, explained in narrative) | - | +2,500,000 vs original | - | - |

Variance is measured against the flexed budget; the FX movement is disclosed and explained, not buried in the spend variance.

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | Deferred-income liability raised on receipt; release matched to eligible spend; no direct table write. |
| Evidence status | Agreement, dated disbursement advices, and project ledger captured. |
| Exception status | Statutory rates (PAYE/NSSF/VAT/WHT) blocked unless verified-current in the source register / Statutory Schedule. |
| Reviewer route | Routed to the reviewer roles named in SKILL.md. |

## Acceptance Check

The fixture passes when an implementer can trace the grant from signed agreement to deferred-income posting, weighted-average flexing, budget-vs-flexed-vs-actual variance, reconciliation to the project bank/cost centre, and reviewer route, with the carried-forward restricted balance and the FX difference both disclosed, and without relying on unsupported or statutory facts.

Last reviewed: 2026-06-17.
