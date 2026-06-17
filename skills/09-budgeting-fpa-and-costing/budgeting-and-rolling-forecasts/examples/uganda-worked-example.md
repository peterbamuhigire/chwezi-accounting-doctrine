# Uganda Worked Example - Budgeting And Rolling Forecasts

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions. All UGX figures below are ILLUSTRATIVE budget amounts, not statutory amounts; the 10% virement limit and the quarterly expenditure-limit/commitment-control discipline are framework structure to verify against the current instrument, not asserted current figures. Statutory rates (PAYE, NSSF, VAT, WHT) are not set here and flow through the source register / Statutory Schedule (verify current). See `doctrine/references/uganda-public-sector-pfm.md`.

## Scenario

A Ugandan public body (vote, FY 1 Jul - 30 Jun, modified accrual) runs its annual budget cycle. Mid-year, the Accounting Officer proposes a virement within a sub-programme to move funds from an underspending activity to an overspending one, and a quarterly review checks expenditure against the quarter's expenditure limit and commitment-control balance. The preparer provides the approved estimates, the activity allocations, the quarter's Accounting Warrant / expenditure limit, and the commitment register. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: public-body vote, FY 1 Jul - 30 Jun, modified accrual, Uganda, functional currency UGX. |
| Source document | Present: approved estimates, activity allocations, quarterly expenditure limit, commitment register. |
| Policy reference | Present: references/source-basis.md, references/implementation-rules.md, and doctrine/references/uganda-public-sector-pfm.md. |
| Ledger route | Present where commitment/expenditure recording is required; otherwise no-posting control output. |
| Reviewer route | Present: role-based reviewer assigned in SKILL.md. |

## Virement Test (<=10% framework limit; verify current instrument)

| Item | Value (illustrative) |
|---|---|
| Source activity annual allocation | UGX 400,000,000 |
| Proposed virement out | UGX 36,000,000 |
| Virement as % of source activity allocation | 9% -> within the <=10% framework limit (PFMA s.22; verify current) |
| Receiving activity (same sub-programme) | within sub-programme; no move between employee costs and other charges |
| Approval route | Minister approval (central) / Chief Executive within sub-programme (LG reg. 23-26); above limit or across programmes needs higher approval |

A proposed UGX 48,000,000 move (12%) would exceed the framework limit and is blocked pending the higher approval route rather than processed as a virement.

## Quarterly Expenditure-Limit and Commitment-Control Check

| Control line | Amount (UGX, illustrative) |
|---|---|
| Quarter expenditure limit (Accounting Warrant) | 1,000,000,000 |
| Expenditure incurred to date in quarter | 720,000,000 |
| Existing commitments (LPOs/contracts) | 230,000,000 |
| Uncommitted balance remaining | 50,000,000 |
| New LPO requested | 70,000,000 |
| Commitment-control result | BLOCKED: exceeds uncommitted balance; no commitment without sufficient quarter limit (CCS) |

No LPO/contract/commitment may be raised without an approved commitment requisition and a sufficient uncommitted balance in the quarter's limit; the Head of Finance is personally liable for over-commitment.

## Processing Trace

1. Confirm the entity type fixes the basis, the budget structure, and the quarterly limit cadence.
2. Test the proposed virement against the framework limit and the correct approval route; block if it exceeds the limit or crosses a boundary needing higher approval.
3. Check each new commitment against the quarter's expenditure limit and uncommitted balance; block over-commitment.
4. Record the variance (budget vs actual vs commitment) and explain it in the quarterly report.
5. Route the virement approval and any blocked commitment to the named reviewer; verify the limit and percentage against the current instrument before final output.

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger/control impact | Within-limit virement recorded against revised allocations; over-limit move and over-commitment blocked; no direct table write. |
| Evidence status | Estimates, allocations, expenditure limit, and commitment register captured. |
| Exception status | Over-limit virement and over-commitment logged; framework figures and statutory rates blocked unless verified-current in the source register / Statutory Schedule. |
| Reviewer route | Routed to the reviewer roles named in SKILL.md. |

## Acceptance Check

The fixture passes when an implementer can trace the budget cycle from approved estimates through a within-limit virement (with the correct approval route), a commitment-control check against the quarter's expenditure limit and uncommitted balance, the blocked over-limit and over-commitment cases, the variance explanation, and the reviewer route, with the 10% limit and the limit cadence flagged for verification against the current instrument and without relying on unsupported or statutory facts.

Last reviewed: 2026-06-17.
