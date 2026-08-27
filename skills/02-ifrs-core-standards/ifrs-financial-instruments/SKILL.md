---
name: ifrs-financial-instruments
description: Advanced financial-instrument classification, measurement, impairment, derecognition, modification, hedge-accounting and risk-disclosure review under IFRS 9 and IFRS 7, with Sections 11 and 12 routing for IFRS for SMEs.
status: active
metadata:
  portable: true
  category: 02-ifrs-core-standards
  compatible_with:
    - claude-code
    - codex
---

# Financial Instruments (IFRS 9 / IFRS 7 / Sections 11 and 12)

## Use When

Use for classification, measurement, impairment, derecognition, modification,
hedge accounting, financial-risk disclosures, or material cash, receivable,
payable, debt, equity, derivative or financing arrangements.

## Do Not Use When

Do not mix the IFRS 9 route with Sections 11/12. Do not infer fair value, ECL,
hedge effectiveness or final disclosure from a generic template. Use licensed
Standard text and professional review for client conclusions.

## Prerequisites

- `doctrine/accounting-finance-doctrine.md`.
- `doctrine/references/ifrs-for-smes-default.md` and `doctrine/references/full-ifrs-overlay.md`.
- `doctrine/references/chart-of-accounts.md` and ledger-posting invariants.
- `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml` plus the Digital Research verification manifest.

## Scope and framework gate

Select full IFRS or IFRS for SMEs before classification. Full IFRS requires
evidence for business model, SPPI, effective interest, fair value, ECL,
modification/derecognition, hedge designation and IFRS 7 risk disclosures.
Sections 11 and 12 remain separately routed for eligible SME reporting.

## IFRS 9 decision model

1. Identify contractual cash-flow rights, unit of account, embedded features,
   collateral, guarantees, counterparty and modification history.
2. Assess the business model using how groups of assets are managed and
   evaluated, not a one-instrument intention.
3. Test SPPI using contractual cash flows and the economic relationship of
   principal with consideration for time value, credit risk and other basic
   lending risks/costs. Escalate leveraged, equity-linked, commodity-linked,
   non-recourse or modified-time-value features.
4. Classify and measure at amortised cost, FVOCI or FVTPL as applicable; retain
   effective-interest, fair-value, OCI and derecognition evidence.
5. Build ECL evidence for exposure at default, probability of default, loss
   given default, expected life, forward-looking scenarios, staging,
   collateral/guarantees, write-offs and model validation. Use lifetime ECL
   from initial recognition for qualifying simplified-approach receivables.
6. For modifications, compare original and revised cash flows, assess
   derecognition, and preserve linked modification/correction records.
7. For hedge accounting, document objective, hedged item, hedging instrument,
   eligible risk, hedge ratio, effectiveness, ineffectiveness and rebalancing.
8. Link all results to IFRS 7 significance, credit, liquidity, market-risk,
   maturity and sensitivity disclosures.

## IFRS for SMEs route

Section 11 covers basic instruments such as cash, deposits, trade receivables,
payables and simple loans using its own recognition, measurement and impairment
requirements. Section 12 routes other instruments such as options, forwards and
complex hybrids. Never use IFRS 9 staging language to describe an SME book
without an explicit full-IFRS basis decision.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Reporting-basis memo | Engagement owner | Required | IFRS/SME basis, entity, period and jurisdiction are explicit. |
| Instrument inventory and contracts | Treasury / subledger | Required | Terms, cash flows, counterparties, collateral and modifications captured. |
| Business-model and SPPI workpaper | Controller | Required for full IFRS | Evidence and rejected alternatives recorded. |
| ECL/valuation/hedge model pack | Risk/treasury owner | Required when applicable | Inputs, source data, scenarios, sensitivity and validation recorded. |
| Reviewer route | Doctrine owner | Required | IFRS reviewer, model reviewer and approval state present. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Classification and measurement memo | Controller and reporting owner | Basis, instrument facts, model and conclusion reconcile. |
| ECL / fair-value / hedge workpaper | Risk owner, auditor and reviewer | Data lineage, assumptions, scenarios and exception path present. |
| IFRS 7 disclosure pack | Notes and financial-statement reviewer | Risk tables and narrative tie to internal risk information and ledger balances. |
| Posting/reporting map | GL and close | Entries route through posting service, period and evidence controls. |

## Decision Rules

| Condition | Decision |
|---|---|
| Full IFRS not selected | Route to Sections 11/12 and do not use IFRS 9 staging or hedge claims. |
| SPPI result uncertain | Do not default to amortised cost; escalate with contract evidence. |
| ECL model data incomplete | Use a qualified workpaper and block final release until data/model review. |
| Modification changes cash flows materially | Assess derecognition before modification accounting. |
| Hedge documentation absent | Do not apply hedge accounting; route as exception. |
| Risk disclosure cannot reconcile to internal risk information | Block or qualify the disclosure and assign an owner. |

## Acceptance Evidence

- `references/section-11-impairment.md`, `references/ifrs-9-ecl-simplified-trade-receivables.md`, `references/effective-interest-schedule.md`, and `references/advanced-ifrs9-classification-and-ecl.md` are used as appropriate.
- `examples/advanced-ifrs9-ecl-and-hedge-routing.md` covers a full-IFRS route and a blocked documentation path.
- Classification, measurement, impairment and disclosure outputs reconcile to source records.
- Reviewer role, current source status, model limitations and unresolved items are visible.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | IFRS 9 classification/ECL workpaper | Markdown using `references/advanced-ifrs9-classification-and-ecl.md` | `docs/ifrs-workpapers/ifrs9-<id>.md` |
| Release evidence | IFRS 7 risk-disclosure reconciliation | Markdown decision record | `docs/ifrs-workpapers/ifrs7-risk-<period>.md` |

## Anti-Patterns

- Applying Section 11 and IFRS 9 to the same instrument without a basis decision.
- Treating face value as amortised cost without effective-interest consideration.
- Using a provision matrix with no portfolio segmentation, historical loss,
  current-condition or forward-looking evidence.
- Applying hedge accounting after the fact without designation and documentation.
- Reporting an ECL number with no staging, scenario, data lineage or sensitivity.
- Omitting liquidity maturity analysis because the entity has “simple” instruments.

## Files

- `references/section-11-impairment.md`
- `references/ifrs-9-ecl-simplified-trade-receivables.md`
- `references/effective-interest-schedule.md`
- `references/advanced-ifrs9-classification-and-ecl.md`
- `examples/advanced-ifrs9-ecl-and-hedge-routing.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS financial-instruments reviewer |
| Reviewer roles | IFRS technical reviewer; treasury/risk model reviewer; controller |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active advanced doctrine route; client release requires current source and human review |
| Caveat | ECL, fair value and hedge conclusions are model- and evidence-sensitive. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.
