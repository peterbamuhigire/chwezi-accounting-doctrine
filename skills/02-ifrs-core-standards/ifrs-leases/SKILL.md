---
name: ifrs-leases
description: Lease accounting under IFRS 16 (full IFRS) and Section 20 (IFRS for SMEs). Lessee single on-balance-sheet model under IFRS 16; lessee operating-vs-finance classification under Section 20. Short-term and low-value exemptions. Lessor classification. Sale-and-leaseback. Use when leases or rental arrangements are in scope. Tier-3 scope — full lessee build deferred until a client materially requires it; Section 20 short-term operating-lease handling and IFRS 16 exemption-test reference are built first.
---

# Leases (IFRS 16 / Section 20)

## Tier-3 scope

This skill is Tier-3 in the build queue. Most Chwezi SME clients have short-term leases (rent, equipment hire) where the IFRS 16 short-term and low-value exemptions or the Section 20 operating-lease model apply. The full IFRS 16 lessee model (right-of-use asset and lease liability with discount-rate computation, reassessment, modification) is built when a real client carries material non-cancellable, non-short-term, non-low-value leases under full IFRS.

## Required first reads

- `doctrine/accounting-finance-doctrine.md`
- `doctrine/references/ifrs-for-smes-default.md` (Section 20)
- `doctrine/references/full-ifrs-overlay.md` (IFRS 16)

## Section 20 (IFRS for SMEs)

Lessee classifies leases as finance leases or operating leases at inception. Finance lease: substantially all the risks and rewards of ownership transfer. Operating lease: otherwise. Recognition:

- Operating lease (lessee): rental expense on a straight-line basis over the lease term (unless another systematic basis is more representative).
- Finance lease (lessee): asset and lease liability at the lower of fair value and PV of minimum lease payments; subsequent depreciation of the asset and interest on the liability using the effective-interest method.

Lessor: mirror classification; operating-lease income on a straight-line basis or finance-lease receivable with effective-interest.

## IFRS 16 lessee model

Single on-balance-sheet model for all leases:

- Right-of-use (ROU) asset and lease liability recognised at lease commencement.
- ROU = lease liability + prepayments + initial direct costs + dismantling provision − incentives.
- Lease liability = PV of unpaid lease payments at incremental borrowing rate (or implicit rate if determinable).
- Subsequent: depreciate ROU; unwind interest on liability.

Exemptions:

- Short-term leases (≤ 12 months, no purchase option): may elect straight-line expense.
- Low-value underlying asset (≤ ~USD 5,000 equivalent when new): may elect straight-line expense.

## Initial build (Tier-3 minimum)

- Lease register: lessor, asset, commencement, end, payments schedule, renewal options, purchase options, dismantling obligation.
- Section 20: classification logic; straight-line expense generator.
- IFRS 16: exemption-test calculator; for non-exempt, manual workings until full ROU engine is built.
- Disclosure note generator for both frameworks.

## CoA implications (when full IFRS 16 is implemented)

| Code | Name |
|---|---|
| 1850 Right-of-Use Asset | Non-current, by class. |
| 1859 Accumulated Depreciation — ROU | Non-current contra. |
| 2710 Lease Liability — Current | Current portion. |
| 2720 Lease Liability — Non-current | Non-current portion. |
| 6510 Depreciation of ROU | P&L. |
| 8110 Interest on Lease Liabilities | P&L. |

## Forbidden patterns

- Lessee operating-lease classification under full IFRS without explicit short-term / low-value exemption documentation (blocker).
- Mixing exemption election year-on-year without disclosure (major).
- Section 20 finance-lease accounting on a lease where risk-and-reward transfer is not substantially all (blocker).

## Files

- `SKILL.md`.
- `references/exemption-test.md` (to be built when needed).
- `references/full-ifrs-16-lessee-model.md` (to be built when needed).

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
