---
name: advanced-ifrs-consolidated-statements-review
description: Use when preparing or reviewing consolidated financial statements under IFRS 10, IFRS 11, IFRS 12, IAS 28 and related standards, including control, joint-control, associates, NCI, intercompany elimination, disclosure completeness, IFRS 18 presentation, and reviewer advice.
status: active
metadata:
  portable: true
  category: 06-close-consolidation-and-reporting
  compatible_with:
    - claude-code
    - codex
---

# Advanced IFRS Consolidated Statements Review

## Use When

Use for group reporting, acquisition or disposal periods, subsidiaries,
structured entities, investment entities, joint arrangements, associates,
non-controlling interests, intercompany elimination, group disclosures, and
review of a draft consolidated set under current full IFRS.

## Do Not Use When

Do not force consolidation from ownership percentage alone, classify a joint
arrangement from legal form alone, edit local ledgers to make group balances
agree, or present a final compliance conclusion without source and human review.

## Prerequisites

- `doctrine/accounting-finance-doctrine.md` and the existing
  `consolidation-and-intercompany` skill.
- IFRS 10, IFRS 11, IFRS 12, IAS 28 and IFRS 18 source-register entries and
  Digital Research verification manifest.
- Entity hierarchy, contracts, voting rights, board/control evidence, local
  trial balances, intercompany match reports, policy/judgement logs and draft
  statements/notes.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Group structure and control memo | Group controller | Required | Ownership, voting rights, decision rights, returns, dates and exceptions present. |
| Entity trial balances and policies | Local finance teams | Required | Period, currency, close status, policies and sign-off present. |
| Intercompany match and elimination pack | Consolidation team | Required | Counterparty, document, currency, period, match status and elimination mapping present. |
| Interests-in-other-entities inventory | Group controller | Required | Subsidiary, JV, associate, structured entity, restrictions and commitments captured. |
| Draft consolidated statements and notes | Reporting team | Required | Statements, IFRS 18 mapping, IFRS 12/7 disclosures and reconciliations available. |
| Reviewer route | Doctrine owner | Required | Group controller, IFRS reviewer and auditor liaison roles assigned. |

## Workflow

1. Confirm reporting basis, group reporting date, reporting currency, accounting
   policies, reporting-date alignment and consolidation scope.
2. Assess control for each investee: power over relevant activities, exposure or
   rights to variable returns, and ability to use power to affect returns.
   Consider substantive rights, potential voting rights, agency and structured
   entity facts; document the conclusion and reassessment triggers.
3. Apply the investment-entity exception only after confirming the definition
   and consequences; route subsidiaries held for investment purposes through
   the applicable fair-value and disclosure analysis.
4. Classify joint arrangements from contractual joint control and rights to
   assets/obligations for liabilities (joint operation) or rights to net assets
   (joint venture). Assess significant influence and equity-method inputs for
   associates and joint ventures under IAS 28.
5. Combine like items for parent and subsidiaries using consistent policies;
   eliminate investment in subsidiary against subsidiary equity, intragroup
   balances, transactions, income, expenses, cash flows and unrealised profit.
   Preserve local ledgers and link every elimination to source records.
6. Calculate NCI, ownership changes, acquisition/disposal effects, foreign-
   operation translation and post-acquisition movements with separate workpapers.
7. Reconcile group trial balance to all four statements, IFRS 18 categories and
   subtotals, cash-flow classification, segment information and notes.
8. Complete IFRS 12 disclosures for nature, risks and effects of interests;
   include restrictions, commitments, summarised information and NCI where
   applicable. Link financial-instrument risks to IFRS 7.
9. Log unmatched balances, policy differences, missing evidence, judgemental
   classifications and unreviewed estimates; do not hide them in suspense.

## Decision Rules

| Condition | Decision |
|---|---|
| Power, variable returns and ability to affect returns are all evidenced | Consolidation route under IFRS 10, subject to exceptions. |
| Ownership percentage is the only evidence | Control conclusion is not complete; escalate. |
| Unanimous consent is required for relevant activities | Joint-control route; classify from rights and obligations. |
| Rights are to net assets | Joint-venture/equity-method route, not proportionate consolidation by default. |
| Significant influence is evidenced but control is not | IAS 28 associate route and IFRS 12 disclosures. |
| Intercompany difference is unresolved | Keep on exception report; do not edit local ledger or use an unexplained plug. |
| Local policies or reporting dates differ | Adjust through approved consolidation layer and retain evidence. |
| IFRS 18 period | Route group statement presentation, MPMs and comparatives through the IFRS 18 skill. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Control and consolidation-scope memo | Group controller and IFRS reviewer | Investee-by-investee conclusion with evidence, dates and exceptions. |
| Consolidation adjustment register | Group ledger and auditors | Elimination, NCI, policy, FX and other adjustments link to source records. |
| Group trial balance and statement tie-out | Reporting owner | Local TBs plus adjustments/eliminations reconcile to statements. |
| IFRS 12/7 disclosure matrix | Notes reviewer and audit committee | Nature, risk and effect disclosures are complete or exception-owned. |
| Unresolved-issue and reviewer register | Release owner | Blockers, owners, due dates and release state are explicit. |

## Acceptance Evidence

- `references/consolidation-review-matrix.md` is completed for every investee and
  consolidation run.
- `references/interests-in-other-entities-disclosure-workpaper.md` supports
  IFRS 12 and related risk disclosures.
- `examples/control-nci-joint-arrangement-review.md` covers control/NCI,
  joint-control and unresolved-evidence paths.
- Local ledgers are unchanged; elimination journals are traceable and reversible.
- Group statements cross-foot and reconcile to local TBs, eliminations and notes.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | Consolidation review matrix and adjustment register | Markdown workpapers using the `references/` templates | `docs/ifrs-workpapers/group-review-<period>.md` |
| Data safety | Group-source and elimination trace | Markdown reconciliation pack | `docs/ifrs-workpapers/group-trace-<run>.md` |
| Release evidence | IFRS 12/7 disclosure exception register | Markdown table | `docs/ifrs-workpapers/group-disclosures-<period>.md` |

## Anti-Patterns

- Consolidating every investee because ownership exceeds a threshold.
- Using legal ownership instead of control, contractual rights or relevant activities.
- Proportionately consolidating a joint venture without a supported conclusion.
- Editing subsidiary ledgers or hiding unmatched balances in suspense.
- Omitting NCI, structured-entity risk, restrictions or commitments from notes.
- Producing a group statement that does not reconcile to eliminations and local TBs.

## Files

- `references/consolidation-review-matrix.md`
- `references/interests-in-other-entities-disclosure-workpaper.md`
- `examples/control-nci-joint-arrangement-review.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Group reporting and consolidation reviewer |
| Reviewer roles | IFRS technical reviewer; group controller; auditor liaison |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active advanced doctrine route; final group reporting remains reviewer-gated |
| Caveat | Control, joint-control, NCI, valuation and disclosure conclusions depend on entity-specific evidence. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.

