# Implementation Rules - Budgeting And Rolling Forecasts

## Doctrine Boundary

This skill covers budget ownership, forecast cadence, variance explanation, scenario evidence, cost behaviour, and management-reporting tie-outs. It defines how the finance engine should ask the question, collect evidence, produce a controlled artefact, and reject unsafe output. It does not replace the full source standard, local law, contract, tax ruling, professional advice, or reviewer sign-off.

## Minimum Workpaper

| Section | Required content |
|---|---|
| Question | The accounting, reporting, controls, tax, systems, or sector decision being made. |
| Framework | Applicable framework or authority, with source ID from source-basis.md. |
| Evidence | Source documents, source-register entries, contracts, reconciliations, assumptions, and unresolved gaps. |
| Decision | The selected treatment, control, posting, report, disclosure, or workflow. |
| Alternatives | At least one rejected treatment or route where judgement is material. |
| Ledger impact | Account, dimension, period, currency, posting command, or explicit statement that no posting is required. |
| Review | Owner, reviewer role, exception status, and release caveat. |

## Control Rules

1. Keep facts, assumptions, estimates, and inferences in separate fields.
2. Store every external-source claim with source ID, accessed date, and reviewer route.
3. Block final output when the source-register entry is stale, absent, or not applicable to the entity.
4. Require controller approval for manual override of account mapping, period state, currency, tax treatment, or evidence sufficiency.
5. Require reviewer approval for framework selection, material estimates, disclosures, related-party items, covenant matters, public-sector restrictions, or AI-generated accounting suggestions.
6. Preserve an immutable audit trail for approvals, rejections, reversals, and reopened-period adjustments.

## Data Contract

Minimum fields: entity_id, period_id, ramework, jurisdiction, unctional_currency, source_id, source_document_ref, event_date, posting_date, ccount_code, dimension_set, mount, currency, evidence_ref, policy_ref, judgement_ref, eview_status, exception_status.

## Rejection Rules

Reject or hold the artefact when:

- source evidence is missing or contradictory;
- the period is locked and no governed reopen approval exists;
- debits and credits would not balance by book and currency;
- a statutory value is not verified-current in the source register;
- a disclosure, policy, estimate, or judgement lacks reviewer routing;
- an integration event lacks an idempotency key or source checksum;
- AI or automation attempts to approve, post, or release without human approval where judgement is involved.

## Release Gate

The skill can support internal doctrine, design, and testing after this closure pass. Client-facing release requires current source checks, unresolved-gap review, and named human sign-off according to the review metadata in SKILL.md.

Last reviewed: 2026-05-25.
