---
name: ifrs-18-presentation-and-disclosures
description: Use when preparing or reviewing full-IFRS financial-statement presentation and disclosure under IFRS 18, including operating/investing/financing categories, required profit-or-loss subtotals, management-defined performance measures, aggregation/disaggregation, comparatives, and transition.
status: active
metadata:
  portable: true
  category: 03-ifrs-specialised-standards
  compatible_with:
    - claude-code
    - codex
---

# IFRS 18 Presentation and Disclosures

## Use When

Use for full-IFRS annual or interim statement preparation, 2027 transition
planning, early application assessment, review of profit-or-loss structure,
management-defined performance measures (MPMs), comparative information,
aggregation/disaggregation, and cross-note consistency.

## Do Not Use When

Do not apply IFRS 18 to an IFRS for SMEs report unless the applicable reporting
basis explicitly requires it. Do not infer compliance from a template, and do
not issue final client reporting without current source verification and named
professional review.

## Prerequisites

- `doctrine/references/ifrs-18-presentation-transition.md` and
  `doctrine/references/standards-transition-2027.md`.
- `skills/07-financial-statements-and-disclosures/financial-statements-preparation/`.
- Current source record `IF-IFRS18-PRESENTATION-2027` and the Digital Research
  verification manifest.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Reporting-basis and period memo | Reporting owner | Required | Full IFRS, period start, early application and comparative basis are explicit. |
| Draft complete financial statements | Reporting engine | Required | Statement totals cross-foot and tie to the trial balance/consolidation pack. |
| Chart-of-accounts and line-item map | GL/reporting owner | Required | Every material account maps to a presentation line and category. |
| MPM inventory and public communications | Management/reporting owner | Required for MPM review | Measures, labels, locations, reconciliations and communications are captured. |
| Disclosure and judgement log | Controller | Required | Material policy information, estimates, judgements and exceptions are traceable. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| IFRS 18 presentation review matrix | Reporting owner and reviewer | All required categories, subtotals, line items, comparatives and notes assessed. |
| MPM reconciliation workpaper | Management, audit committee, auditor | Each MPM reconciles to the most directly comparable IFRS-defined subtotal/total and explains tax/NCI effects where applicable. |
| Transition and comparative plan | Close/consolidation team | Mandatory/early application state, prior-period comparatives and system mapping are explicit. |
| Exceptions and release route | Release owner | IAS 1-only, missing MPM, unsupported classification, or incomplete comparative issues are blocked or owned. |

## Workflow

1. Identify reporting basis, period start, early-application election, transition
   requirements, and the latest verified source state.
2. Confirm the complete set of statements and comparative information, then tie
   statement totals to the GL/group trial balance.
3. Map income and expenses to operating, investing, and financing categories,
   considering the entity's main business activities and the applicable Standard
   requirements.
4. Test the required profit-or-loss subtotals: operating profit and profit before
   financing and income taxes; preserve consistent definitions and cross-note
   explanations.
5. Inventory every subtotal used in public communications outside IFRS-defined
   subtotals. Classify it as an MPM only after checking the scope and communication
   triggers; document label, purpose, calculation, reconciliation, tax/NCI
   effects, and disclosure location.
6. Apply aggregation/disaggregation principles: do not obscure material
   information; separately present or explain material classes and unusual items.
7. Review accounting-policy information, judgements, estimates, segment/MPM
   interactions, cash-flow classification, and comparative restatement effects.
8. Run the IAS 1-only blocker and unresolved-evidence check, reconcile affected
   notes, and route final conclusions to the IFRS reviewer.

## Decision Rules

| Trigger | Required decision |
|---|---|
| Full IFRS and period begins on/after 2027-01-01 | Apply IFRS 18 review; IAS 1-only presentation is blocked. |
| Approved early application | Record election, effective period, comparative consequences and reviewer approval. |
| IFRS for SMEs basis | Do not apply IFRS 18 silently; follow the applicable SME edition and transition route. |
| Subtotal not specified by IFRS but used in public communications to communicate management's view | Assess and document as a potential MPM; reconcile and disclose when in scope. |
| Operating/investing/financing classification uncertain | Apply the IFRS 18 matrix, inspect main business activities and source evidence, then escalate judgement. |
| Aggregation would obscure material information | Disaggregate and explain the nature, amount, timing or uncertainty. |
| Comparative mapping unavailable | Block final release or disclose a reviewer-approved limitation; do not silently reuse IAS 1 mapping. |

## Acceptance Evidence

- `references/ifrs-18-review-matrix.md` is complete for the reporting period.
- `references/mpm-reconciliation-workpaper.md` exists for every potential MPM.
- `examples/ifrs-18-transition-and-mpm.md` demonstrates transition, subtotals,
  MPM reconciliation and a blocked IAS 1-only path.
- Statement, note, cash-flow and segment mappings reconcile to their sources.
- Current source and human-review status are visible in the release record.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | IFRS 18 review matrix | Markdown table using `references/ifrs-18-review-matrix.md` | `docs/ifrs-workpapers/ifrs18-review-<period>.md` |
| Correctness | MPM reconciliation workpaper | Markdown workpaper using `references/mpm-reconciliation-workpaper.md` | `docs/ifrs-workpapers/mpm-<id>.md` |
| Release evidence | Transition exception register | Markdown decision/exception record | `docs/ifrs-workpapers/ifrs18-transition-<period>.md` |

## Anti-Patterns

- Treating IFRS 18 as only a new statement template.
- Using “adjusted EBITDA” or another management subtotal without an MPM
  inventory and reconciliation.
- Classifying every financing-related item by label without assessing the
  entity's main business activities and Standard requirements.
- Omitting comparative effects from a transition plan.
- Aggregating material unusual items so users cannot understand their nature.
- Mixing full IFRS IFRS 18 output with an IFRS for SMEs basis without a documented
  reporting-basis decision.

## Files

- `references/ifrs-18-review-matrix.md`
- `references/mpm-reconciliation-workpaper.md`
- `examples/ifrs-18-transition-and-mpm.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS presentation and disclosure reviewer |
| Reviewer roles | Group reporting owner; IFRS technical reviewer; audit committee/auditor liaison where applicable |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active doctrine route; final application remains current-source and human-review gated |
| Caveat | Official IFRS 18 implementation projects may change; recheck the IFRS Foundation page before release. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.

## References

- `doctrine/references/ifrs-18-presentation-transition.md`
- `doctrine/references/standards-transition-2027.md`
- `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml`
- `docs/research/ifrs-advanced-2026-08/verification-manifest.md`
