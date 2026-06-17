# Uganda Worked Example - Donor Funded Project Fiscal Compliance

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions. All UGX figures below are ILLUSTRATIVE org-policy/agreement amounts, not statutory amounts; statutory rates (PAYE, NSSF, VAT, WHT) are not set here and flow through the source register / Statutory Schedule (verify current). See `doctrine/references/uganda-public-sector-pfm.md` and `doctrine/references/uganda-ngo-financial-management-patterns.md`.

## Scenario

A Ugandan government project unit implements a donor-funded works-and-training project, consolidated into the supervising vote, with donor financial rules layered on top of GoU requirements (stricter rule wins). During interim review, a UGX 24,000,000 cost charged to the grant is queried as potentially ineligible: a vehicle hire and entertainment claim partly used for non-project staff and partly for a fundraising dinner. The preparer provides the payment voucher, supporting receipts, the activity budget line, and the donor eligibility schedule. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: GoU project unit, donor-funded, consolidated into vote, period, basis disclosed, functional currency UGX. |
| Source document | Present: payment voucher ref, receipts, activity budget line, donor eligibility schedule. |
| Policy reference | Present: references/source-basis.md, references/implementation-rules.md, doctrine/references/uganda-public-sector-pfm.md, and doctrine/references/uganda-ngo-financial-management-patterns.md. |
| Ledger route | Present: ineligible-cost recovery and reclassification posting. |
| Reviewer route | Present: role-based reviewer assigned in SKILL.md. |

## Eligibility Test (Reasonable / Allocable / Allowable)

| Component (illustrative) | Amount (UGX) | Reasonable? | Allocable? | Allowable? | Verdict |
|---|---|---|---|---|---|
| Vehicle hire - project field activity | 12,000,000 | Yes | Yes (project) | Yes | Eligible |
| Vehicle hire - non-project staff trip | 6,000,000 | Yes | No (not the project) | n/a | Ineligible (not allocable) |
| Entertainment - fundraising dinner | 6,000,000 | n/a | No | No (entertainment/fundraising on standing unallowable list) | Ineligible |

Reasonable = prudent and necessary; Allocable = benefits the project in proportion charged; Allowable = not on the donor/standing unallowable-cost list (fines, fundraising, entertainment, bad debts, etc.). A cost must pass all three.

## Processing Trace

1. Identify the entity type and basis, then layer the donor agreement on top of GoU requirements and reconcile the two (stricter wins).
2. Test each cost component against Reasonable / Allocable / Allowable.
3. Quantify the ineligible portion (UGX 12,000,000) and raise it in the exception register with owner and due date.
4. Recover the ineligible amount from the grant: reclassify out of the project/grant cost centre and recognise a receivable/recovery, restoring the grant balance.
5. Reconcile the grant ledger to the donor report; flag the finding for reviewer sign-off and document the corrective action.

## Illustrative Recovery Posting

| Step | Dr | Cr | Amount (UGX, illustrative) |
|---|---|---|---|
| Reverse ineligible charge from grant cost centre | Recovery receivable / suspense | Project expense (grant-funded) | 12,000,000 |
| On recovery from responsible source | Bank / payroll recovery | Recovery receivable / suspense | 12,000,000 |

The eligible UGX 12,000,000 remains charged to the grant; only the ineligible UGX 12,000,000 is recovered and reclassified.

## Reconciliation

| Check | Before (UGX) | After (UGX) | Result |
|---|---|---|---|
| Charged to grant cost centre | 24,000,000 | 12,000,000 | Ineligible portion removed |
| Eligible cost retained | - | 12,000,000 | Agrees to RAA test |
| Recovery outstanding | - | 12,000,000 | Tracked to settlement |

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | Ineligible cost reversed out of grant; recovery receivable raised; no direct table write. |
| Evidence status | Voucher, receipts, budget line, and eligibility schedule captured. |
| Exception status | Ineligible-cost finding logged; statutory rates blocked unless verified-current in the source register / Statutory Schedule. |
| Reviewer route | Routed to the reviewer roles named in SKILL.md. |

## Acceptance Check

The fixture passes when an implementer can trace the finding from voucher through the Reasonable/Allocable/Allowable test, the quantified ineligible amount, the recovery and reclassification posting, the grant reconciliation, and the reviewer route, with the donor and GoU rules reconciled and the eligible portion left intact, and without relying on unsupported or statutory facts.

Last reviewed: 2026-06-17.
