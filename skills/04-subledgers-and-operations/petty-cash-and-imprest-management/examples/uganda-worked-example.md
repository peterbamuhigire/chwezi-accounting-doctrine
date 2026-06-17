# Uganda Worked Example - Petty Cash And Imprest Management

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions. All UGX figures below (float, single-transaction cap, replenishment trigger) are ILLUSTRATIVE org-policy benchmarks, not statutory amounts; statutory rates (PAYE, NSSF, VAT, WHT) are not set here and flow through the source register / Statutory Schedule (verify current). See `doctrine/references/uganda-ngo-financial-management-patterns.md`.

## Scenario

A Ugandan NGO (functional currency UGX) operates an imprest petty-cash float at a field office. Board-approved policy (illustrative) sets the float at UGX 1,000,000, a single-transaction cap of UGX 100,000 (above the cap goes by cheque/EFT), and a replenishment trigger when cash on hand falls to UGX 200,000. The float is held in a locked safe with one key-holder, no IOUs. The preparer provides the imprest register, paid receipts, and the count sheet. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: NGO field office, period, IFRS for SMEs, Uganda, functional currency UGX. |
| Source document | Present: imprest register entries, dated receipts, replenishment cheque, count sheet. |
| Policy reference | Present: references/source-basis.md, references/implementation-rules.md, and doctrine/references/uganda-ngo-financial-management-patterns.md. |
| Ledger route | Present: replenishment posting from expense accounts to bank, float account unchanged. |
| Reviewer route | Present: role-based reviewer assigned in SKILL.md. |

## Illustrative Float Run (org-policy, not statutory)

| Event | Amount (UGX, illustrative) | Cash on hand after |
|---|---|---|
| Opening float | 1,000,000 | 1,000,000 |
| Fuel voucher | 80,000 | 920,000 |
| Stationery | 45,000 | 875,000 |
| Refreshments (activity) | 95,000 | 780,000 |
| Airtime/data | 60,000 | 720,000 |
| Cleaning supplies | 90,000 | 630,000 |
| Courier and sundry (multiple) | 430,000 | 200,000 |
| Replenishment trigger reached | - | 200,000 |
| Total spent to retire | 800,000 | - |

A proposed single payment of UGX 150,000 was rejected at the cap and routed to cheque/EFT instead, so it does not pass through the float.

## Processing Trace

1. Confirm each disbursement is within the single-transaction cap (UGX 100,000) and supported by a receipt; over-cap items are blocked from petty cash and routed to cheque/EFT.
2. Record each spend in the imprest register against the correct expense account and project dimension.
3. When cash on hand reaches the trigger (UGX 200,000), compile receipts for the spent amount (UGX 800,000) for replenishment.
4. Internal auditor checks the receipts; treasurer verifies; replenishment cheque restores the float to UGX 1,000,000.
5. Reconcile receipts plus cash on hand to the fixed float; run a surprise/unannounced count and certify it.

## Illustrative Posting (replenishment restores the float)

| Step | Dr | Cr | Amount (UGX, illustrative) |
|---|---|---|---|
| Replenishment cheque (sum of receipted expenses) | Expense accounts (fuel, stationery, activity, etc.) | Bank | 800,000 |
| Float account | (unchanged at fixed imprest) | | 1,000,000 |

Under the imprest method the float account stays at UGX 1,000,000; only expense and bank move on replenishment.

## Reconciliation and Surprise Count

| Check | Expected (UGX) | Found (UGX) | Result |
|---|---|---|---|
| Receipts held for replenishment | 800,000 | 800,000 | Agrees |
| Cash on hand at trigger | 200,000 | 200,000 | Agrees |
| Receipts + cash = fixed float | 1,000,000 | 1,000,000 | Reconciled |
| Surprise count (independent role) | float reconstitutes to 1,000,000 | 1,000,000 | No variance; certified |

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | Replenishment posts spent expenses to bank; fixed float unchanged; no direct table write. |
| Evidence status | Receipts, register, cheque, and count sheet captured. |
| Exception status | Over-cap item blocked from petty cash; statutory rates blocked unless verified-current in the source register / Statutory Schedule. |
| Reviewer route | Routed to the reviewer roles named in SKILL.md. |

## Acceptance Check

The fixture passes when an implementer can trace the float run from opening float through the cap-enforced disbursements, the trigger, the receipt-checked and treasurer-verified replenishment cheque, the reconciliation (receipts + cash = fixed float), and the certified surprise count, with over-cap spend routed away from petty cash and without relying on unsupported or statutory facts.

Last reviewed: 2026-06-17.
