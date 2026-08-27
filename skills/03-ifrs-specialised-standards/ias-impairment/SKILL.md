---
name: ias-impairment
description: Use when identifying, measuring, reviewing, or disclosing impairment under IAS 36 and Section 27, including CGU allocation, goodwill, value in use, fair value less costs of disposal, sensitivities, reversals, and disclosures.
status: active
metadata:
  portable: true
  category: 03-ifrs-specialised-standards
  compatible_with:
    - claude-code
    - codex
---

# Impairment of Assets (IAS 36 / Section 27)

## Use When

Use for impairment indicators, annual goodwill or indefinite-life tests, CGU
allocation, VIU models, fair value less costs of disposal, headroom, sensitivity,
impairment/reversal postings and disclosures.

## Do Not Use When

Do not apply IAS 36 to assets whose impairment is governed by another Standard,
including financial assets within IFRS 9, inventory, deferred tax assets,
employee-benefit assets, fair-value investment property, biological assets and
assets held for sale. Do not substitute Section 27 for full IFRS IAS 36.

## Prerequisites

- `doctrine/accounting-finance-doctrine.md`, `doctrine/references/full-ifrs-overlay.md`.
- `doctrine/references/ifrs-for-smes-default.md` (Section 27).
- Asset register, budgets/forecasts, valuation evidence, CGU map and
  `IF-IAS36-IMPAIRMENT` source-register entry.

## Advanced IAS 36 workstream

1. Build the complete asset population and assess market, technology, legal,
   economic, rate, damage, performance, restructuring and disposal indicators
   at each reporting date.
2. For full IFRS, test goodwill, indefinite-life intangibles and intangibles not
   yet available for use annually, and test other assets when indicators exist.
3. Allocate goodwill to the lowest CGU or CGU group monitored for management and
   expected to benefit from the combination; document consistency and limits.
4. Determine carrying amount on a comparable basis, including corporate assets
   and relevant liabilities, without double-counting recognised assets.
5. Estimate recoverable amount as the higher of VIU and fair value less costs of
   disposal. For VIU, evidence current-condition cash flows, forecast period,
   terminal assumptions and discount-rate consistency.
6. Calculate headroom and sensitivities for reasonably possible changes in growth,
   margin, cash conversion and discount rate. Expose model limitations.
7. Allocate a loss according to the framework and CGU rules, preserve revaluation
   treatment, and use linked correction/reversal postings.
8. Reverse non-goodwill impairment only when conditions support it and never above
   the carrying amount that would have resulted absent impairment. Do not reverse
   goodwill impairment under IAS 36.
9. Disclose assumptions, CGU composition, goodwill allocation, loss/reversal,
   sensitivity and estimation uncertainty; obtain independent review.

## Section 27 route

Apply the IFRS for SMEs impairment requirements, including its treatment of
indicators, recoverable amount, reversal and goodwill. Record the framework
selection before any annual-test conclusion.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Reporting-basis memo | Engagement owner | Required | Full IFRS/SME basis and period explicit. |
| Asset and CGU register | Fixed-asset/reporting owner | Required | Carrying amounts, useful lives, goodwill and allocations reconcile. |
| Forecast and valuation model | FP&A/valuation owner | Required when test triggered | Current condition, assumptions, rate, scenarios and sensitivity documented. |
| Indicator and judgement log | Controller | Required | External/internal indicators and rejected alternatives recorded. |
| Reviewer route | Doctrine owner | Required | IFRS and valuation reviewer assigned. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Impairment indicator and scope memo | Close owner | Population completeness and applicable Standard exclusions. |
| CGU/VIU/FVLCD workpaper | Controller, valuation reviewer and auditor | Carrying amount, recoverable amount, headroom and sensitivity reconcile. |
| Journal and reversal map | GL and close | Posting service, period, approval and immutability controls preserved. |
| Impairment disclosure pack | Financial-statement reviewer | Assumptions, sensitivities, movements and uncertainty are traceable. |

## Decision Rules

| Condition | Decision |
|---|---|
| Goodwill or qualifying intangible under full IFRS | Annual test required even without an indicator. |
| Recoverable amount below carrying amount | Recognise impairment and route the journal through approved posting. |
| VIU model uses unsupported future restructurings or growth | Reject/adjust model and escalate. |
| Goodwill impairment reversal proposed | Block; IAS 36 prohibits reversal. |
| Discount rate or forecast not independently evidenced | Block final conclusion or mark `NOT ASSESSED`. |
| Section 27 selected | Apply SME route; do not import IAS 36 annual-goodwill-test logic. |

## Acceptance Evidence

- `references/indicator-checklist.md`, `references/value-in-use-workpaper-template.md`, and `references/advanced-ias36-cgu-and-viu-workpaper.md` are completed as applicable.
- `examples/goodwill-cgu-sensitivity.md` covers annual testing, headroom, sensitivity and the blocked goodwill-reversal path.
- Asset register, forecast, valuation, journal and disclosure outputs reconcile.
- Human IFRS/valuation review and source status are explicit.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | CGU/VIU impairment workpaper | Markdown using `references/advanced-ias36-cgu-and-viu-workpaper.md` | `docs/ifrs-workpapers/ias36-<id>.md` |
| Release evidence | Impairment sensitivity and exception log | Markdown table | `docs/ifrs-workpapers/ias36-exceptions-<period>.md` |

## Anti-Patterns

- Testing only when management expects a loss while skipping mandatory annual tests.
- Assigning goodwill to CGUs that do not receive the expected benefits.
- Using a budget model without reconciling to approved plans and current condition.
- Calling a single discount-rate assumption “objective” without evidence or sensitivity.
- Reversing goodwill impairment or exceeding the no-impairment carrying amount.
- Leaving a triggered impairment loss unposted while the report is released.

## Files

- `references/indicator-checklist.md`
- `references/value-in-use-workpaper-template.md`
- `references/advanced-ias36-cgu-and-viu-workpaper.md`
- `examples/goodwill-cgu-sensitivity.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS impairment reviewer |
| Reviewer roles | IFRS technical reviewer; independent valuation reviewer; controller |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active advanced doctrine route; client release requires current source and human review |
| Caveat | VIU, FVLCD, CGU and sensitivity conclusions are estimate-sensitive. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.
