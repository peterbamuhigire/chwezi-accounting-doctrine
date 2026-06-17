# Uganda NGO / CSO Financial-Management Patterns

Cross-cutting reference for NGO, CSO, faith-based, and member-based not-for-profit finance work in Uganda. Synthesised from real Ugandan finance-and-accounting manuals (UCOBAC, MCLD Uganda, IMAU) to capture the *shape* of sector practice.

**Everything below is an organisational-policy pattern, not a statutory mandate.** Each entity sets its own thresholds, floats, and rates in its own manual; the numbers here are observed-practice **benchmarks and design defaults**, useful when authoring or reviewing a client's manual, never figures to assert as law. Statutory rates (PAYE, NSSF, VAT, WHT, income tax) are out of scope here — they flow through the source register per `uganda-compliance-caveats.md`. For public bodies use `uganda-public-sector-pfm.md` instead.

## Accounting basis (sector spread)

- Most small/medium Ugandan NGOs run **cash or modified-cash** recognition (income when received, expenditure when paid) under the historical-cost convention, with accrual treatment grafted on for grants (deferred income) and fixed assets (depreciation). Manuals are often internally inconsistent on this — surface the conflict and pick one basis explicitly.
- Better-resourced networks adopt **full accrual under IFRS / IFRS for SMEs** (e.g. MCLD Uganda states accrual + IFRS).
- Standard sector framework: ICPAU-adopted IFRS for SMEs for most; full IFRS for public-interest entities. Auditors hold a valid ICPAU practising certificate. Financial year is commonly 1 January – 31 December (donor-driven years also occur).

## Fund accounting model

- **Restricted vs unrestricted funds.** Restricted (donor-tagged) funds are ring-fenced; unspent restricted balances sit as a **deferred income** liability and release as the related cost or depreciation is incurred.
- **One bank account and one cost centre per donor/project** is the common control; each funding source is separately coded, and the chart of accounts **mirrors each budget line** of the grant agreement.
- **Grant recognition:** deferred-income approach (not the capital approach). Asset-related grants → deferred income released in proportion to depreciation; income-related grants → credited to "other income – grants/donations". In-kind donations are recognised at fair value.
- **Donor register / acknowledgement:** capture donor, amount, deductions at source, in-kind fair value, and restrictions; issue a receipt/acknowledgement (often within ~10 days).

## Multi-currency grant budgeting and flexing

- Budgets are stated in **both the donor currency and UGX** with the exchange rate shown. The original-budget rate is the rate at agreement signing; **flexing uses a weighted-average rate** based on actual disbursement rates/amounts. Exchange differences are accumulated and explained in the quarterly report. Variance is measured against the flexed budget.

## Authorisation, signatories, and approval tiers

- **Bank mandate:** typically **3 named signatories, any 2 transacting** (dual control / duo-control); a principal signatory (Executive Director / Country Coordinator / National Treasurer) is on all accounts. High-value payments cross a board/treasurer threshold (e.g. one organisation requires a board member above its top tier; another routes payments above its high-value line through the Treasurer/Board).
- **Approval matrix by amount** is standard: an operational tier (Finance/Admin manager), a management tier (ED/Country Coordinator), and a board tier above the top threshold. Treat the specific figures as client-set; the *structure* (three tiers keyed to amount, with the board owning the top) is the reusable pattern.
- **Segregation of duties** runs as a chain: *request → check → approve → disburse → prepare accountability → review → approve accountability*, with no person occupying two adjacent control roles and no one approving or signing in their own favour.

## Petty cash and imprest

- Operated as an **imprest float** with a single-transaction cap (above the cap → cheque/EFT) and a replenishment trigger. A clean state machine (from IMAU): float at a set level → spend down to the trigger → submit receipts for the spent amount (internal auditor checks, treasurer verifies) → reimbursement cheque restores the float. Floats and caps are client-set benchmarks (manuals reviewed used floats around UGX 0.4–1.0M and single-transaction caps around UGX 100k).
- Float is held in a locked safe, single key-holder, no IOUs; **monthly certified counts plus surprise/unannounced counts**.

## Advances and accountability

- **One advance at a time** — no new advance until the previous is fully accounted.
- Activity/field advances retired commonly **within ~5 working days** of returning (or within days of month-end for sub-grantees); unspent balances banked, not rolled into petty cash.
- Non-retirement is **recovered from the next salary**; documented reminders precede recovery.
- Salary advances are capped (commonly ≤1 month, sometimes more for housing) and recovered over a set number of months within the financial year.

## Procurement (NGO practice)

- A value threshold triggers **competitive bidding with ≥3 quotations** compared on a bid-analysis form; below it, obtain supplier pricing and raise an LPO. (The trigger is org-set; manuals reviewed used roughly UGX 0.5–1.0M.)
- A **Procurement Committee** (not the end user) evaluates bids and signs contracts; the requester cannot approve or pay; the procurer cannot also maintain inventory.
- **Lowest responsive bid is the default**, but best value / total cost of ownership may win if the reason is documented in the purchase file.
- **Cost eligibility test:** Reasonable, Allocable, Allowable; maintain a standing list of unallowable costs (fines, fundraising, entertainment, bad debts, etc.) for donor work.
- Retain the full procurement record (requisition, solicitation, bids, evaluation, minutes, award, contract, correspondence).
- NGOs are not bound by PPDA, but donor procurement rules (USAID ADS, World Bank/AfDB fiduciary standards, EU/GIZ) frequently impose stricter requirements — layer them on top.

## Fixed assets and depreciation

- **Capitalisation threshold is dual-currency-anchored** (manuals reviewed used roughly US$500 or UGX 1,000,000, and/or a useful life ≥ 2 years); below it, expense and track in a memorandum register.
- **Depreciation method varies by organisation** — both reducing-balance and straight-line appear, with class rates set by the entity (and sometimes reviewed annually with the auditor). Do not import one manual's rates into another; state the chosen policy. A common convention is a full year's charge in the year of acquisition and none in the year of disposal.
- Maintain separate registers for **purchased vs donated** assets (donated assets record the donor and need donor consent before disposal). Physical verification is commonly semi-annual; disposal uses ≥3 bidders / valuers with board approval.

## Reconciliation and count cadence

- Bank reconciliation **monthly** per account (reviewed up the chain); cash reconciliation on the last working day of the month; petty cash counted monthly plus surprise counts; stock/stores counted semi-annually (monthly stock cards); asset register reconciled at least annually.
- Cash banked intact within a short window of receipt (manuals used "daily/next day" to "within 36 hours").

## Records, audit, and governance

- **Record retention** commonly 5–7 years (donor terms may extend).
- **External audit** annual by an ICPAU-certified CPA, statements within ~3 months of year-end; auditor tenure often capped (~3 years). **Internal audit** 1–2 times a year.
- Governance bodies seen across manuals: **Board of Directors/Trustees** (top financial authority, approves budget and audited accounts, appoints auditor), **Finance Committee** (legal / strategic / fiduciary / oversight roles), **Procurement Committee**, **Budget Committee**, and an **Accounts Committee** reporting to the General Assembly. Whistleblowing aligns to Uganda's Whistleblowers Protection Act 2010.
- Reporting set: Income & Expenditure statement, Statement of Financial Position, Cash Flow statement, notes — produced monthly/quarterly/bi-annually/annually with budget-vs-actual-vs-variance and narrative.

## How to use in deliverables

- When designing or reviewing an NGO client's manual or controls, use these as **defaults to propose**, then confirm and replace with the client's own board-approved figures.
- Keep statutory rates out of the manual body — point them to the live source register so the manual never goes stale.
- For donor-funded work, reconcile the entity manual with the donor's financial-management rules; the stricter rule wins.

## Sources and tiers

| Source | Tier | Note |
|---|---|---|
| UCOBAC Finance & Accounting Manual; MCLD Uganda Financial Management Policy (May 2023); IMAU Accounting Manual | Tier 3 (illustrative sector practice) | Real Ugandan NGO manuals; figures are entity-set, not statutory |
| ICPAU framework guidance (IFRS / IFRS for SMEs) | Tier 2 | Default reporting framework |
| URA / NSSF / Whistleblowers Protection Act 2010 | Tier 1 | Statutory; rates via source register, see `uganda-compliance-caveats.md` |

## Forbidden patterns

- Quoting a benchmark here (float, cap, threshold, depreciation rate, retention period) as a legal requirement or as the client's actual policy.
- Importing one manual's depreciation rates or thresholds into another entity without restating them as the entity's own choice.
- Embedding statutory tax/payroll rates in a manual body instead of pointing to the live source register.
- Designing an NGO control without segregation of duties because the entity is small.

Last reviewed: 2026-06-17. Next review due: 2026-12-17.
