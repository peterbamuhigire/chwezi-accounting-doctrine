# Worked Example - Project And Contract Accounting

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions.

## Scenario

An entity asks the finance engine to process a matter involving project cost capture, work-in-progress, contract assets/liabilities, retention, variations, claims, and billing evidence. The preparer provides a source document, account map, reporting period, functional currency, and management explanation. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: entity, period, framework, jurisdiction, and functional currency stated. |
| Source document | Present: document reference, actor, date, amount, and currency captured. |
| Policy reference | Present: references/source-basis.md and references/implementation-rules.md. |
| Ledger route | Present where posting is required; otherwise documented as no-posting output. |
| Reviewer route | Present: role-based reviewer assigned in SKILL.md. |

## Processing Trace

1. Confirm the applicable framework and whether the matter affects recognition, measurement, presentation, disclosure, controls, or workflow.
2. Capture source evidence and separate facts from assumptions, estimates, and inferences.
3. Apply the implementation rules and record blocked items in the exception register.
4. If a posting is required, prepare a posting command for the canonical posting service; otherwise prepare a memo or disclosure-support artefact.
5. Reconcile the output to source evidence and route judgemental items for review.

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | Mapped to account and dimension where posting is required; no direct table write allowed. |
| Evidence status | Source document and policy reference captured. |
| Exception status | Final statutory values blocked unless verified-current in the source register. |
| Reviewer route | Routed to the reviewer roles named in SKILL.md. |

## Acceptance Check

The fixture passes when an implementer can trace the decision from source document to policy reference, ledger/reporting/control impact, exception register, and reviewer route without relying on unsupported facts.

Last reviewed: 2026-05-25.
