---
name: published-ifrs-financial-statement-analysis
description: Use when analysing published IFRS financial statements, annual reports and notes to evaluate financial health, performance, cash generation, liquidity, leverage, valuation, accounting risk, disclosure quality, and implications for management, audit committees, investors or regulators.
status: active
metadata:
  portable: true
  category: 07-financial-statements-and-disclosures
  compatible_with:
    - claude-code
    - codex
---

# Published IFRS Financial Statement Analysis

## Use When

Use for source-backed analysis of published annual/interim IFRS statements,
notes, results announcements, investor presentations, management commentary and
regulatory filings.

## Do Not Use When

Do not treat analyst commentary as primary evidence, compare metrics with
inconsistent definitions, infer fraud from a ratio, or provide investment,
regulatory or audit assurance without the appropriate professional mandate.

## Prerequisites

- Digital Research `source-evaluation`, `source-verification`, `data-quality`,
  and analytic-tradecraft methods as applicable.
- The published financial statements and notes as primary source material,
  reporting period, currency, accounting basis, restatements and comparatives.
- IFRS 18, IFRS 7, IFRS 8, IFRS 9, IFRS 10–12, IFRS 15, IFRS 16, IAS 36, IAS 37
  and relevant source-register entries where the analysis relies on them.

## Analysis discipline

Separate every output into four layers:

1. **Extracted fact:** directly traceable number, policy, statement line, note,
   or management disclosure with period and source locator.
2. **Calculation:** reproducible metric, bridge, reconciliation or trend using
   stated numerator, denominator, sign convention and units.
3. **Inference:** analyst interpretation supported by multiple facts and an
   uncertainty statement.
4. **Advice:** audience-specific implication, decision, watch item or question;
   never presented as a sourced fact.

## Workflow

1. Establish entity, group, reporting basis, reporting dates, currency,
   comparatives, restatements, auditor/report status and source completeness.
2. Build a statement-and-note index covering accounting policies, revenue,
   financial instruments, leases, impairment, provisions, consolidation,
   segments, MPMs, tax, cash flows, commitments and subsequent events.
3. Reconcile statement totals, cash roll-forward, retained earnings, debt,
   lease liabilities, PPE/intangibles, goodwill, provisions and segment totals
   to notes before calculating ratios.
4. Analyse performance: revenue quality and concentration, gross/operating
   margin, recurring versus non-recurring items, MPM reconciliation, segment
   economics, EPS and return measures.
5. Analyse cash and capital: CFO conversion, working capital, capex, free-cash-
   flow definition, debt maturity, lease-adjusted leverage, interest cover,
   liquidity headroom, covenant risk and refinancing.
6. Analyse accounting risk: IFRS 15 judgements, IFRS 9 ECL/credit risk, IFRS 16
   lease population, IAS 36 headroom/sensitivity, IFRS 13 Level 3 inputs, IAS 37
   contingencies, IFRS 10/12 scope and disclosures, IFRS 8 CODM measures, and
   IAS 10 events.
7. Assess disclosure quality: material policy information, judgements,
   estimation uncertainty, disaggregation, comparatives, MPMs, risk
   concentrations, non-cash items and cross-note consistency.
8. Produce audience-specific advice using the matrix, identify missing evidence,
   contradictions and alternative explanations, and route high-consequence
   conclusions for independent review.

## Core measures

Use only when definitions are comparable and disclose the formula:

- Growth: current period less comparative, divided by comparative, with
  currency, scope and restatement effects.
- Margin: selected profit measure divided by the matching revenue measure.
- Cash conversion: operating cash flow divided by the selected profit measure;
  explain working-capital, tax, interest and classification differences.
- Leverage: gross/net debt and lease liabilities divided by a defined profit or
  cash metric; avoid mixing IFRS and management definitions.
- Liquidity: cash, undrawn facilities, maturity gaps and covenant headroom with
  source dates and restrictions.
- Return: numerator, average/in-period capital base and treatment of goodwill,
  leases, tax and discontinued operations.

## Decision Rules

| Finding | Required response |
|---|---|
| Number appears only in an investor presentation | Treat as management communication; verify to statements or label as unverified. |
| MPM differs from IFRS subtotal | Use the IFRS 18 MPM reconciliation; do not call it comparable without definition. |
| Ratio changes after restatement or acquisition | Rebase comparatives or explain non-comparability. |
| Cash flow conflicts with profit | Investigate working capital, non-cash items, classification, acquisitions, leases and restrictions before concluding. |
| Impairment/valuation sensitivity is narrow | Report key assumptions, headroom, tipping points and alternative explanations. |
| Disclosure is missing or internally inconsistent | Log a disclosure risk, source gap and reviewer question; do not infer the missing amount. |
| High-consequence advice lacks primary evidence | Narrow the advice and route for human review. |

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Published statements and notes | Issuer/regulator filing | Required | Source identity, period, version and completeness recorded. |
| Source/evidence manifest | Digital Research workflow | Required | Claims link to source IDs and locators. |
| Metric definitions and comparison basis | Analyst | Required | Formula, units, scope, restatement and limitations explicit. |
| Audience decision context | Requester | Required | Management, audit committee, investor or regulator purpose explicit. |
| Reviewer route | Engagement owner | Required for high-consequence output | Competence, independence and approval state recorded. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Published-statement analysis workpaper | Analyst and reviewer | Facts, calculations, inferences and advice are separated and reproducible. |
| Financial-health and risk dashboard narrative | Management/audit committee/investors | Drivers, uncertainty, alternative explanations and source locators present. |
| Disclosure and accounting-risk register | Controller/auditor/regulator liaison | Risk, standard, evidence, impact, owner and question are recorded. |
| Audience advice memo | Intended decision-maker | Advice is bounded, caveated and does not imply assurance or investment advice. |

## Acceptance Evidence

- `references/analysis-metric-and-risk-workpaper.md` is completed with source
  locators and formulas.
- `references/audience-advice-matrix.md` maps findings to audience and authority.
- `examples/published-statement-review.md` demonstrates sourced facts,
  calculations, inference, uncertainty and narrowed advice.
- Digital Research verification status, source tier, access date and unresolved
  claims are retained.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | Published-statement analysis workpaper | Markdown using `references/analysis-metric-and-risk-workpaper.md` | `docs/ifrs-analysis/<issuer>-<period>.md` |
| UX quality | Audience advice matrix | Markdown using `references/audience-advice-matrix.md` | `docs/ifrs-analysis/<issuer>-advice.md` |
| Release evidence | Source and unresolved-claim register | Markdown verification-linked record | `docs/ifrs-analysis/<issuer>-evidence.md` |

## Anti-Patterns

- Presenting a calculated metric as if it were disclosed by the issuer.
- Treating an MPM as an IFRS measure or ignoring its reconciliation.
- Comparing periods after acquisitions/restatements without rebasing or explanation.
- Calling low cash conversion evidence of poor performance without alternative explanations.
- Treating non-disclosure as proof of absence.
- Giving investors or regulators a conclusion with no primary source, uncertainty or reviewer route.

## Files

- `references/analysis-metric-and-risk-workpaper.md`
- `references/audience-advice-matrix.md`
- `examples/published-statement-review.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS financial-statement analysis reviewer |
| Reviewer roles | IFRS technical reviewer; financial analyst; engagement quality reviewer |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active analysis route; high-consequence advice requires human review |
| Caveat | Published-statement analysis is decision support, not audit assurance, legal advice or investment advice. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.

