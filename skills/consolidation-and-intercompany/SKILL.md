---
name: consolidation-and-intercompany
description: Use when designing, reviewing, or testing group reporting, entity hierarchy, reporting currency, intercompany matching, elimination journals, group trial balances, non-controlling interest caveats, and foreign-operation translation caveats.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Consolidation and Intercompany

<!-- dual-compat-start -->
## Use When

Use when group reporting, entity hierarchies, intercompany balances, elimination journals, group trial balances, or consolidation caveats are in scope.

## Do Not Use When

Do not use to bypass specialist review for complex NCI, business combination, associate, joint arrangement, or foreign-operation translation matters.

## Required Inputs

Entity hierarchy, signed local trial balances, intercompany subledger, reporting currency, FX evidence, and elimination policy.

## Workflow

Validate local close status, match intercompany balances, prepare eliminations in the group layer, preserve local ledgers, and produce group pack evidence.

## Quality Standards

Traceable local TBs, visible unmatched balances, group-only eliminations, source-supported FX, and reviewer-signed consolidation output.

## Anti-Patterns

Editing local ledgers for group reporting, hiding unmatched balances, unsigned final TBs, and unsupported currency translation.

## Outputs

Intercompany match reports, elimination journals, group trial balances, exception reports, and group pack fixtures.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `ledger-posting-engine-core`.
- Confirm group structure, reporting framework, consolidation scope, reporting currency, entity currencies, ownership percentages, intercompany accounts, and period alignment.
- Confirm whether foreign operations, non-controlling interests, associates, or joint arrangements are in scope; if so, require specialist reviewer sign-off.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Entity hierarchy | Group controller | Required | Parent, subsidiaries, ownership, effective dates, and consolidation method present. |
| Entity trial balances | Local ledgers | Required | Period, currency, reporting basis, close state, and sign-off present. |
| Intercompany subledger | AR/AP/intercompany module | Required when balances exist | Counterparty entity, document reference, account pair, and matching status present. |
| FX rates | Source register or treasury | Required for foreign currency consolidation | Rate type, date, source, and reviewer present. |
| Elimination policy | Group controller | Required | Account mappings, transaction classes, retained-profit treatment, and approval roles present. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Intercompany match report | Close process | Matched, mismatched, aged, and disputed balances visible. |
| Elimination journal | Group ledger | Posted through consolidation layer with source references. |
| Group trial balance | Reporting pack | Local TBs, adjustments, eliminations, and group balances traceable. |
| Unmatched balance exception report | Controller, auditors | Differences by entity pair, account, age, owner, and resolution status. |
| Group pack | Audit-ready reporting | Entity sign-offs, elimination schedule, caveats, and reviewer approval present. |

## Decision Rules

1. Local ledgers close before consolidation starts unless the group controller approves a draft consolidation.
2. Intercompany AR and AP balances must match by counterparty, document, currency, and period or appear on the exception report.
3. Elimination journals are group-level adjustments and do not alter released local ledgers.
4. Intercompany sales, profit in inventory, loans, interest, management fees, dividends, and balances use separate elimination mappings.
5. Reporting currency translation requires source-supported rates and retained calculation evidence.
6. Non-controlling interest, associates, joint arrangements, and business combinations require explicit caveats or specialist review when in scope.
7. Group reports must disclose open unmatched balances and unresolved consolidation caveats.
8. Reversing or adjusting eliminations preserves the original consolidation run and source entity trial balances.

## Acceptance Evidence

- `examples/two-entity-intercompany-sale.md` proves reciprocal sale/purchase and balance matching.
- `examples/elimination-entry-fixture.md` proves group-level elimination without editing local ledgers.
- `examples/unmatched-balance-exception-report.md` proves mismatch routing.
- `examples/group-trial-balance-pack.md` proves local TB plus eliminations to group TB.
- `references/domain-acceptance-tests.md` is the minimum implementation test set.

## Anti-Patterns

- Editing subsidiary ledgers to force group balances to agree.
- Hiding unmatched intercompany balances in suspense without owner and ageing.
- Consolidating unsigned local trial balances as final.
- Mixing local currency, functional currency, and reporting currency without rate evidence.
- Treating NCI, associates, or foreign operations as covered without specialist review.

## Required References

- `references/consolidation-workflow.md`
- `references/intercompany-matching-rules.md`
- `references/domain-acceptance-tests.md`
- `ledger-posting-engine-core/references/posting-service-contract.md`
- `doctrine/references/ledger-invariants.md`

## Examples

- `examples/two-entity-intercompany-sale.md`
- `examples/elimination-entry-fixture.md`
- `examples/unmatched-balance-exception-report.md`
- `examples/group-trial-balance-pack.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Group reporting specialist |
| Reviewer roles | Group controller, local entity accountants, IFRS reviewer when complex group accounting applies |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-11-15 |
| Release state | Draft until consolidation fixtures are executable in the validator |
| Caveat | Complex NCI, business combination, associate, and foreign-operation translation treatments require specialist review. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
