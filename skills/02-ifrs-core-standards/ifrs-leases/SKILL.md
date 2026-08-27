---
name: ifrs-leases
description: Advanced lease identification, measurement, reassessment, modification, sale-and-leaseback, lessor and disclosure review under IFRS 16, with Section 20 routing for IFRS for SMEs.
status: active
metadata:
  portable: true
  category: 02-ifrs-core-standards
  compatible_with:
    - claude-code
    - codex
---

# Leases (IFRS 16 / Section 20)

## Use When

Use for lease populations, embedded leases, ROU assets, lease liabilities,
discount rates, options, modifications, reassessments, sale-and-leaseback,
lessor accounting and lease disclosures.

## Do Not Use When

Do not apply the IFRS 16 lessee model to an IFRS for SMEs report without a
documented framework decision. Do not treat a lease as operating under full IFRS
merely because payments are described as rent.

## Prerequisites

- `doctrine/accounting-finance-doctrine.md`, `doctrine/references/full-ifrs-overlay.md`.
- `doctrine/references/ifrs-for-smes-default.md` (Section 20).
- Lease contracts, payment schedules, asset data, discount-rate evidence and
  `IF-IFRS16-LEASES` source-register entry.

## IFRS 16 workstream

1. Search contracts, service arrangements, outsourcing, transport and embedded
   asset arrangements for an identified asset and the right to control use.
2. Determine commencement date, enforceable period, lease term, extension and
   termination options, purchase options, indexation and variable payments.
3. Measure the liability at present value using the implicit rate when readily
   determinable; otherwise use an evidence-backed incremental borrowing rate.
4. Measure ROU asset using the liability, prepayments, incentives, initial direct
   costs and restoration/decommissioning obligations.
5. Run the schedule for interest, payments, depreciation, impairment and current
   versus non-current classification; reconcile lease register to GL.
6. Reassess triggered changes to term, index/rate, residual value guarantee or
   purchase option; determine separate lease versus remeasurement treatment.
7. Assess transfer and seller-lessee accounting in sale-and-leaseback separately
   from legal form.
8. Link additions, carrying amounts, maturity, expense, cash flows and judgement
   disclosures to the reporting pack.

## IFRS for SMEs Section 20 route

Classify leases as finance or operating based on transfer of substantially all
risks and rewards. Finance leases recognise an asset and liability at the lower
of fair value and present value of minimum lease payments; operating-lease
expense is generally systematic over the term. The lessor route mirrors the
framework and requires its own disclosure review.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Framework and lease-scope memo | Reporting owner | Required | Full IFRS/SME basis and scope assumptions explicit. |
| Contract population | Procurement/legal/operations | Required | Completeness search and identified assets recorded. |
| Payment and option schedule | Treasury/lease owner | Required | Fixed, index-linked, variable, incentive and option data reconciled. |
| Discount-rate evidence | Treasury/valuation reviewer | Required for IFRS 16 | Implicit/IBR selection and source evidence present. |
| Reviewer route | Doctrine owner | Required | IFRS reviewer and model reviewer assigned. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Lease-identification memo | Controller and auditor | Contract, asset, control and exemption conclusion. |
| ROU/liability schedule | GL, close and reporting | Opening plus movement equals closing and agrees to source schedule. |
| Modification/reassessment workpaper | Controller | Trigger, recalculation, posting and disclosure impact traceable. |
| Lease disclosure pack | Financial-statement reviewer | Class, maturity, additions, carrying amounts, expense and judgements reconcile. |

## Decision Rules

| Condition | Decision |
|---|---|
| Underlying asset low-value or lease term within the permitted short-term exemption | Document election and consistent policy; do not silently omit from population. |
| Full IFRS arrangement lacks exemption evidence | Recognise and measure through IFRS 16 route or block pending evidence. |
| Option assessment changes | Reassess lease term and remeasure using the applicable requirements. |
| Contract modification adds right of use at commensurate price | Assess separate lease before remeasurement. |
| Sale-and-leaseback transfer is not a sale | Do not derecognise the asset as a sale. |
| Discount rate is unsupported | Block final schedule or obtain reviewer-approved rate evidence. |

## Acceptance Evidence

- `references/exemption-test.md`, `references/full-ifrs-16-lessee-model.md`, and `references/advanced-ifrs16-lessee-workpaper.md` are completed as applicable.
- `examples/lease-modification-and-reassessment.md` covers a modification and a blocked missing-rate path.
- Lease register, schedule, GL and disclosures reconcile.
- Reviewer and current-source states are explicit.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | Lease identification and ROU schedule | Markdown using `references/advanced-ifrs16-lessee-workpaper.md` | `docs/ifrs-workpapers/ifrs16-<id>.md` |
| Release evidence | Lease population completeness and exception log | Markdown table | `docs/ifrs-workpapers/lease-exceptions-<period>.md` |

## Anti-Patterns

- Treating all rent invoices as operating leases under full IFRS.
- Using a generic discount rate with no currency, term, collateral or credit evidence.
- Changing exemption elections without policy and disclosure documentation.
- Ignoring embedded leases in service contracts.
- Editing a posted lease journal instead of a linked correction/reversal.
- Publishing a ROU schedule that does not tie to the lease register and GL.

## Files

- `references/exemption-test.md`
- `references/full-ifrs-16-lessee-model.md`
- `references/advanced-ifrs16-lessee-workpaper.md`
- `examples/lease-modification-and-reassessment.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS leases reviewer |
| Reviewer roles | IFRS technical reviewer; treasury/valuation reviewer; controller |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active advanced doctrine route; client release requires current source and human review |
| Caveat | Lease completeness, term and discount-rate judgements are evidence-sensitive. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.
