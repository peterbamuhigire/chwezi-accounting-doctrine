# Implementation Rules - Retail And POS Accounting Pack

## Doctrine Boundary

This skill covers sector-specific source events, controls, reporting views, tax touchpoints, and accounting classifications. It defines how the finance engine should ask the question, collect evidence, produce a controlled artefact, and reject unsafe output. It does not replace the full source standard, local law, contract, tax ruling, professional advice, or reviewer sign-off.

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
7. For retail events, preserve the operational event and accounting event separately. Operational completion does not imply accounting release.
8. Require explicit disposition for returns before stock is restored to sellable inventory or written down.
9. Require source agreement evidence before vendor funding, rebate, co-op, or scanback recovery is recognised or reported as recoverable.
10. Require source lineage and reconciliation status for any retail KPI used in weekly business review, management accounts, or investor/bank reporting.

## Data Contract

Minimum fields: entity_id, period_id, framework, jurisdiction, functional_currency, source_id, source_document_ref, event_date, posting_date, account_code, dimension_set, amount, currency, evidence_ref, policy_ref, judgement_ref, review_status, exception_status.

Retail extension fields: store_id, channel, fulfilment_node_id, sku_id, category_id, customer_id where permitted, vendor_id, tender_type, original_transaction_ref, disposition_code, promotion_id, markdown_event_id, loyalty_program_id, gift_card_or_wallet_id, settlement_batch_id, reconciliation_status, metric_id.

## Rejection Rules

Reject or hold the artefact when:

- source evidence is missing or contradictory;
- the period is locked and no governed reopen approval exists;
- debits and credits would not balance by book and currency;
- a statutory value is not verified-current in the source register;
- a disclosure, policy, estimate, or judgement lacks reviewer routing;
- an integration event lacks an idempotency key or source checksum;
- AI or automation attempts to approve, post, or release without human approval where judgement is involved.
- a retail return lacks original transaction link, inspection result, or disposition;
- a discount, promotion, coupon, or markdown lacks reason code, effective period, or approval where threshold rules require it;
- a dashboard financial KPI lacks source lineage or reconciliation status;
- a vendor funding claim lacks agreement evidence and claim-basis calculation.

## Release Gate

The skill can support internal doctrine, design, and testing after this closure pass. Client-facing release requires current source checks, unresolved-gap review, and named human sign-off according to the review metadata in SKILL.md.

Last reviewed: 2026-06-25.
