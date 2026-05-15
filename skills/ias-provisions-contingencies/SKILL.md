---
name: ias-provisions-contingencies
description: Provisions, contingent liabilities and contingent assets under IAS 37 (full IFRS) and Section 21 (IFRS for SMEs). Recognition criteria (present obligation, probable outflow, reliable estimate), measurement, onerous contracts, restructuring, warranties, contingent disclosures. Use when provisions, litigation, warranties, onerous contracts, restructuring, decommissioning, or guarantee disclosures are in scope.
---

# Provisions and Contingencies (Section 21 / IAS 37)

## Overview

A provision is recognised when:

1. The entity has a present obligation (legal or constructive) as a result of a past event.
2. It is probable an outflow of resources embodying economic benefits will be required to settle the obligation.
3. The amount can be measured reliably.

Otherwise, a contingent liability is disclosed (unless the possibility of outflow is remote).

A contingent asset is disclosed when an inflow of economic benefits is probable but not virtually certain; if virtually certain, the asset is recognised.

## Required first reads

- `doctrine/accounting-finance-doctrine.md`
- `doctrine/references/ifrs-for-smes-default.md` (Section 21)
- `doctrine/references/full-ifrs-overlay.md` (IAS 37)

## Measurement

Best estimate of the expenditure required to settle the present obligation at the reporting date. For a large population (e.g. warranties), the expected-value method. For a single obligation, the most-likely-outcome method (potentially adjusted for skewness).

Provisions discounted to present value where the effect is material and a reliable discount rate is available.

## Common provisions

- Warranty obligations.
- Restructuring (announced before reporting date with detailed plan).
- Onerous contracts (unavoidable costs > expected economic benefits).
- Decommissioning, restoration, environmental remediation.
- Legal claims (probable settlement).
- Customer refunds (where return policy is constructive obligation).

## Contingent liabilities — disclosure only

- Possible obligations confirmed only by uncertain future events.
- Present obligations not recognised because outflow not probable or amount not reliably measurable.

Disclosure: nature, estimate of effect, uncertainties, possibility of reimbursement (where applicable).

## Build implications

- Provisions register: nature, opening balance, additions, utilisations, reversals, closing.
- Quarterly review by Controller; reviewer sign-off.
- Recognition checklist applied to each candidate item.
- Disclosure note generator with movements table.
- Contingent register: separate from provisions register.

## CoA implications

| Code | Name |
|---|---|
| 2500 Provisions — Short-term | Current. |
| 2900 Provisions — Long-term | Non-current. |
| 6850 Provision Movement | P&L. |
| 6860 Unwinding of Discount on Provisions | P&L (finance cost). |

## Forbidden patterns

- Provision recognised without a present obligation (blocker — common error: provisioning for future operating losses).
- "Smoothing" provisions (blocker).
- General provisions not tied to specific obligations (major).
- Contingent liabilities recognised as provisions (blocker).
- Contingent assets recognised before virtually certain (blocker).

## Files

- `SKILL.md`.
- `references/recognition-decision-tree.md`.
- `references/onerous-contract-test.md`.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.

## Prerequisites

- Load `doctrine/accounting-finance-doctrine.md` before applying this skill.
- Load `governance/finance-accounting-quality-gate.md` when the output is a release, client artefact, SRS, SDS, proposal, business plan, or implementation plan.
- Use `doctrine/source-register/` for final statutory, tax, payroll, FX, EFRIS, eTIMS, or authority-template values.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Finance context map | `finance-module-audit` | Required | Entity, framework, jurisdiction, modules, users, and deployment context are named. |
| Doctrine baseline | Doctrine owner | Required | Doctrine version and reporting framework are stated. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | Required for final statutory output | Entries are `verified-current` or reviewer-approved `verified-with-caveat`. |
| Ledger/posting context | `ledger-posting-engine-core` | Required when postings are affected | Posting boundary, CoA mappings, control accounts, dimensions, and period state are known. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Skill-specific decision record | Implementer, reviewer, quality gate | Scope, assumptions, chosen treatment, rejected alternatives, and caveats are recorded. |
| Implementation or workflow contract | Software, SRS, SDS, proposal, or business-plan engine | Contract names inputs, outputs, controls, evidence, and failure conditions. |
| Acceptance evidence | Finance quality gate | Tests, fixtures, examples, source links, reviewer sign-off, or evidence-pack references are present. |
| Plain-language explanation | Client, owner, manager, operator | Business meaning is stated before technical accounting treatment where client-facing. |

## Decision Rules

- Prefer IFRS for SMEs for typical SME entities unless full IFRS, local law, donor requirements, or client policy requires otherwise.
- Treat every money-touching workflow as ledger, control, reconciliation, evidence, and reporting scope.
- Do not finalize statutory values without source-register support and reviewer status.
- Use business-language output for operators and accountant-language output for ledger, reporting, and audit users.
- Escalate uncertain framework, tax, or statutory interpretations to the required reviewer role instead of presenting them as final.

## Acceptance Evidence

- Inputs and outputs above are present or explicitly marked not applicable.
- Relevant quality-gate blockers have been checked and no blocker remains unresolved.
- Examples or fixtures cover at least one happy path and one failure or caveat path for this skill's domain.
- Reviewer role, review date, and open caveats are recorded for release-grade artefacts.

## Anti-Patterns

- Treating draft planning assumptions as final statutory or accounting facts.
- Hiding tax, payroll, FX, or authority-template caveats in prose instead of source-register state.
- Producing technically correct accounting output without a plain-language layer for non-accountant users.
- Closing a remediation or implementation item without observable evidence.

## Required References

- `doctrine/accounting-finance-doctrine.md`.
- `governance/finance-accounting-quality-gate.md`.
- `docs/reference-manifest.md` for declared reference states.
- Domain-specific references listed earlier in this skill.

## Examples

- Include at least one normal workflow example for this skill's domain.
- Include at least one exception, rejection, reversal, stale-source, or reviewer-caveat example where the domain can fail.

## Review Metadata

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
