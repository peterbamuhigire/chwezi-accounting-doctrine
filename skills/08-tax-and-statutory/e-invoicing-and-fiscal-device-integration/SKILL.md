---
name: e-invoicing-and-fiscal-device-integration
description: Use for legacy e-invoicing and fiscal-device requests that need compatibility routing; the canonical electronic fiscal taxing doctrine now owns jurisdiction-neutral controls and Uganda EFRIS references.
status: active
metadata:
  portable: true
  category: 08-tax-and-statutory
  compatible_with:
    - claude-code
    - codex
---

# E Invoicing And Fiscal Device Integration (Compatibility Route)

<!-- dual-compat-start -->
## Use When

Use when an existing caller names this legacy skill or asks specifically for a
compatibility review of e-invoicing/fiscal-device integration. For new work,
load `electronic-fiscal-taxing`, which is the canonical general doctrine.

## Do Not Use When

Do not use as a substitute for professional judgement, current statutory
verification, legal advice, tax opinion, or the canonical
`electronic-fiscal-taxing` skill.

## Required Inputs

Entity profile, reporting framework, jurisdiction, functional currency, period, source events, source documents, account map, dimensions, source-register snapshot where statutory values appear, and reviewer route.

## Workflow

Frame the accounting question, confirm the applicable framework, collect source evidence, apply the decision rules, create the ledger/reporting/control artefact, reconcile it to source records, and route exceptions or judgemental decisions to the named reviewer role.

## Quality Standards

Framework-identified, source-evidenced, reviewer-routable, ledger-reconcilable, period-aware, and caveated where external law, standards, rates, or judgemental estimates remain pending.

## Anti-Patterns

Using unsupported rates or facts, bypassing the posting service, releasing final statutory output without verified-current source-register entries, hiding judgement calls in free text, or treating illustrative examples as client facts.

## Outputs

Decision memo, configured policy, posting/reporting map, reconciliation evidence, exception queue, reviewer routing record, and worked example.

## References

Load `electronic-fiscal-taxing` plus the retained legacy references only when an
existing integration must be interpreted or migrated.
<!-- dual-compat-end -->

## Prerequisites

- Read doctrine/accounting-finance-doctrine.md.
- Read doctrine/references/policy-hierarchy.md.
- Read doctrine/references/ledger-invariants.md.
- Read `../electronic-fiscal-taxing/SKILL.md` and its selected jurisdiction pack.
- Confirm framework, jurisdiction, functional currency, reporting period, entity type, and reviewer route.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Scope and framework memo | Engagement owner | Required | Names the entity, period, reporting framework, jurisdiction, and functional currency. |
| Source-event pack | Subledger, integration, or preparer | Required | Source document, actor, date, period, amount, currency, account, dimension, and evidence pointer captured. |
| Policy and judgement log | Controller or preparer | Required for judgemental items | Distinguishes standard requirement, management judgement, estimate, and inference. |
| Source-register snapshot | Country-pack owner | Required when statutory values appear | Entries are verified-current or explicitly blocked from final output. |
| Reviewer route | Doctrine owner | Required | Owner role and reviewer role are named before release. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Decision memo | Controller and reviewer | States the question, framework, source basis, decision, caveat, and reviewer route. |
| Posting or reporting map | GL, close, reporting, or integration owner | Maps source event to account, dimension, period, currency, and evidence pointer. |
| Reconciliation workpaper | Close owner and auditor | Ties source records to subledger, control account, report line, and exception queue. |
| Exception register | Controller and reviewer | Captures blocked, missing, stale, disputed, or judgemental items with owner and due date. |
| Worked example | Implementer and tester | Reproducible example under examples/worked-example.md; no client facts implied. |

## Decision Rules

1. Identify the applicable reporting framework and scope boundary before recognition, measurement, disclosure, control, or workflow design.
2. Treat the source document as the unit of evidence; every output must drill back to source document, actor, period, account, dimension, and audit log.
3. If a posting is required, route it through the canonical posting service and enforce balance, period state, currency, idempotency, and reversal rules.
4. If statutory, tax, payroll, exchange-rate, or fiscal-device values appear, use only verified-current source-register entries or block final release.
5. Record judgemental decisions separately from facts, with reviewer role, evidence considered, rejected alternatives, and caveats.
6. Reconcile operational records to the GL control account before reporting, settlement, close sign-off, or external disclosure.
7. Maintain an exception register for missing evidence, stale source-register values, unsupported framework assumptions, unresolved estimates, and review blockers.
8. Do not promote illustrative examples, assumed facts, or generic rates into client output.

## Acceptance Evidence

- The canonical skill and its selected references are loaded for new work.
- Existing callers can still find the retained source-basis and implementation rules.
- The skill is active for doctrine use, but client-specific statutory/legal final output still requires current source-register verification and reviewer approval.

## Anti-Patterns

- Treating draft client facts, example figures, or unsupported management assumptions as verified evidence.
- Posting directly to the ledger without the posting service or without an idempotency key.
- Releasing final statutory output from a stale, missing, or unverified source-register entry.
- Combining multiple judgement calls into a single unexplained adjustment.
- Omitting the exception register because the amount is small.
- Using this skill without loading its source basis and implementation rules.

## Files

- references/source-basis.md
- references/implementation-rules.md
- examples/worked-example.md

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Doctrine owner |
| Reviewer roles | Tax reviewer; country-pack owner; integration owner where fiscal devices are affected |
| Last reviewed | 2026-08-28 |
| Next review due | 2027-02-28 |
| Release state | Active doctrine content; client-specific release remains subject to reviewer approval and verified-current statutory sources where applicable. |
| Caveat | No human reviewer name has been fabricated. Record named reviewer sign-off in the engagement or release log when obtained. |

Last reviewed: 2026-08-28. Next review due: 2027-02-28.
