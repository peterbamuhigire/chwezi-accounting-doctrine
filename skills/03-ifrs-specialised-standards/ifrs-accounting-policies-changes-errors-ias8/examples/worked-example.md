# Worked Example - IFRS Accounting Policies Changes Errors Ias8

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions.

## Scenario

An entity asks the finance engine to process a matter involving recognition, measurement, presentation, disclosure, transition choices, and ledger evidence under the applicable IFRS or IFRS for SMEs framework. The preparer provides a source document, account map, reporting period, functional currency, and management explanation. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

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

## Material error discovered after close — focused fixture

This synthetic example uses UGX 100,000 solely to make the balancing visible.
Assume the invoice and payment evidence are present, the prior-period entry was
posted as an expense, and review confirms the purchase met the entity's PPE
recognition policy. The amount, account classification and materiality are
fixture assumptions, not client facts or a general capitalisation threshold.

| Stage | Debit | Credit | Period / control |
|---|---|---|---|
| Original posting | Repairs expense 100,000 | Cash 100,000 | Prior period; retain unchanged in the audit trail. |
| Reversal | Cash 100,000 | Repairs expense 100,000 | First approved open period; link to the original and flag as a prior-period adjustment. |
| Corrected posting | Property, plant and equipment 100,000 | Cash 100,000 | Same open period; link to the reversal and original. |
| Current-period profit normalisation | Repairs expense 100,000 | Opening retained earnings 100,000 | Same open period; use only after controller approval of the adjustment mapping. |

Each journal balances. The two open-period correction journals net to debit
property, plant and equipment and credit opening retained earnings; the
normalisation prevents the correction from appearing as current-period profit.
The original journal is not updated or deleted. The posting sequence follows
the Chwezi locked-period reversal pattern; the pattern separately requires a
materiality assessment and the prior-period restatement workflow
([canonical reversal pattern](../../../../doctrine/examples/reversal-pattern.md#reversal-across-a-locked-period)).

For IFRS for SMEs, Section 10 requires a material prior-period error to be
corrected retrospectively in the first financial statements authorised after
discovery, by restating comparatives or, where relevant, opening balances; the
impracticability rule uses the earliest practicable date (IFRS Foundation,
third edition, paragraphs 10.19–10.23,
[official text](https://www.ifrs.org/content/dam/ifrs/publications/ifrs-for-smes/english/2025/ifrs-for-smes.pdf?bypass=on),
accessed 2026-10-29). This financial-statement treatment is distinct from the
immutable-ledger correction sequence above. The preparer must attach the error
schedule, source invoice/payment evidence, materiality assessment, comparative
restatement workpaper, and controller/IFRS reviewer approval before release.
Tax effects, depreciation, impairment, statement presentation and the actual
materiality conclusion are not established by this fixture and remain
NOT_ASSESSED.

**Negative control:** if the original entry is edited or deleted, the posting
period is locked without an approved adjustment route, either open-period
journal is unbalanced, or the comparative restatement assessment is missing,
the example does not pass. The workflow is a controlled implementation
illustration; it does not claim that IFRS prescribes Chwezi's posting-service
operations.

Last reviewed: 2026-05-25.
