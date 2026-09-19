# B07-A01 — Financial-intelligence statement and ratio workpaper

This workpaper separates extracted statement facts, deterministic calculations,
interpretation, and advice. It supports internal analysis and question framing;
it does not certify an issuer, restate a filing, or replace current IFRS source
verification and professional review.

## Identity and evidence

| Field | Required entry |
|---|---|
| Entity/issuer | Name or explicit `TEST-ENTITY` label |
| Periods and currency | Current/comparative period, units, presentation currency |
| Statement source | Filing/document ID, publication date, page/line locator, access date |
| Basis and scope | Reporting basis, consolidation scope, restatements/acquisitions |
| Reviewer route | Preparer, financial reviewer, decision, review date |
| Source state | Verified, context-bound, partial, or `NOT_ASSESSED` |

No ratio is released when the numerator and denominator do not share the same
period, scope, units, sign convention, or source quality. Missing locators make
the workpaper `BLOCKED`.

## Statement-to-ratio table

| Metric | Formula | Inputs and locator | Result | Interpretation | Status |
|---|---|---|---:|---|---|
| Revenue growth | `(current revenue - prior revenue) / prior revenue` | Revenue line for both periods |  | Fact first; explain scope changes | pending |
| Operating margin | `operating profit / revenue` | Both statement lines |  | Separate recurring and unusual items | pending |
| CFO conversion | `cash from operations / operating profit` | Cash-flow and income-statement lines |  | Check non-cash and working-capital effects | pending |
| Current ratio | `current assets / current liabilities` | Balance-sheet lines at same date |  | Investigate composition and restrictions | pending |
| Receivable days | `average trade receivables / revenue × days` | Average balances and period days |  | Label as analytical estimate | pending |
| Payable days | `average trade payables / cost base × days` | Average balances and declared cost base |  | Do not infer supplier terms | pending |

The analyst records the exact numerator, denominator, unit, sign, period, and
rounding precision for every calculation. Ratios are descriptive signals, not
proof of fraud, impairment, covenant breach, or future performance.

## Risk and alternative-explanation register

| Observation | Inference | Alternatives to test | Evidence needed | Reviewer state |
|---|---|---|---|---|
| Ratio movement | Possible working-capital pressure | Acquisition, FX, classification, timing | Note, cash bridge, comparative schedule | pending |
| Margin movement | Possible mix/cost change | One-off item, restatement, scope change | Accounting policy and note locator | pending |
| CFO divergence | Possible earnings quality signal | Non-cash items, seasonality, supplier timing | Cash-flow bridge and close evidence | pending |

The language must remain calibrated: an observed fact is labelled `FACT`, a
calculation `CALCULATION`, an interpretation `INFERENCE`, and a requested next
step `QUESTION`. Unsupported legal, tax, IFRS, or assurance claims are
`NOT_ASSESSED` and routed to the current source register.

## Failure paths and acceptance

- If a source locator is missing, mark the affected row `BLOCKED` and do not
  calculate from an untraceable value.
- If periods or scopes differ, reject the ratio and record the mismatch.
- If the denominator is zero or negative where the metric is not meaningful,
  return `NOT_APPLICABLE` with the reason; do not force a percentage.
- If a restatement or acquisition changes comparability, show the raw result,
  flag the break, and route the alternative basis to review.
- If the reviewer rejects the interpretation, retain the calculation and
  replace the inference with a neutral question.

Acceptance requires source locators, reproducible formulas, a separate
alternative-explanation register, reviewer decision, and explicit residual
risk. Human sign-off, current source verification, and production use remain
outside this fixture.

