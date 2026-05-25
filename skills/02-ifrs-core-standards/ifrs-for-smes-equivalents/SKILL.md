---
name: ifrs-for-smes-equivalents
description: Practical IFRS for SMEs equivalents to full IFRS standards. The default reporting framework for typical Chwezi clients (SMEs, schools, clinics, NGOs, retail, agribusiness, hospitality, family business). Cross-references each IFRS standard to its IFRS for SMEs section and notes the build implications. Use whenever generating finance content for SME clients, or when deciding whether full IFRS or IFRS for SMEs applies.
---

# IFRS for SMEs Equivalents

## Overview

IFRS for SMEs is the practical default for typical Chwezi clients. This skill is the cross-reference between full IFRS standards and IFRS for SMEs sections, plus the practical guidance on what differs.

## Required first reads

- `doctrine/accounting-finance-doctrine.md`
- `doctrine/references/ifrs-for-smes-default.md`
- `doctrine/references/full-ifrs-overlay.md`
- `doctrine/references/policy-hierarchy.md`

## Cross-reference table

| Full IFRS | IFRS for SMEs section | Practical differences |
|---|---|---|
| IAS 1 Presentation | Section 3, 4, 5, 6 | SMEs reduce minimum line items; OCI presentation simpler. |
| IAS 2 Inventories | Section 13 | Substantially aligned. FIFO or weighted average; LIFO not permitted in either. |
| IAS 7 Cash flows | Section 7 | Substantially aligned. |
| IAS 8 Accounting policies, estimates, errors | Section 10 | Substantially aligned. |
| IAS 10 Events after the reporting period | Section 32 | Substantially aligned. |
| IAS 12 Income taxes | Section 29 | Both use temporary-differences approach; SMEs simpler on deferred tax assessment. |
| IAS 16 PPE | Section 17 | SMEs allow cost or revaluation model (similar). SMEs do not require detailed component depreciation in the same way. |
| IAS 17 / IFRS 16 Leases | Section 20 | **Material difference.** SMEs retain operating-vs-finance classification for lessees; IFRS 16 puts all leases on the balance sheet (with exemptions). |
| IAS 19 Employee benefits | Section 28 | SMEs simplify the DB plan accounting (more disclosure than detailed actuarial); short-term and termination benefits similar. |
| IAS 20 Government grants | Section 24 | SMEs use the performance model OR the accrual model; election by entity. |
| IAS 21 FX | Section 30 | Substantially aligned. |
| IAS 23 Borrowing costs | Section 25 | **Material difference.** SMEs expense all borrowing costs; full IFRS capitalises on qualifying assets. |
| IAS 24 Related-party disclosures | Section 33 | Substantially aligned. |
| IAS 27 / 28 Separate FS, associates | Section 9, 14 | SMEs allow cost / equity / fair-value model choices for investments in associates. |
| IAS 29 Hyperinflation | Section 31 | Same restatement principles. |
| IAS 32 / IFRS 9 Financial instruments | Section 11, 12 | **Material difference.** SMEs use a simpler classification (basic vs other) and an incurred-loss-like impairment model (Section 11 paragraph 21 onwards); IFRS 9 uses ECL across all relevant instruments. |
| IAS 33 EPS | Not required by SMEs | SMEs do not require EPS. |
| IAS 34 Interim reporting | Not required by SMEs | SMEs do not mandate interim reporting; if produced, follow IAS 34 style. |
| IAS 36 Impairment | Section 27 | SMEs simpler. Cash-generating-unit testing only when indicators present; goodwill amortised over useful life (Section 19), so the annual-impairment-only model of IAS 36 does not apply to SME goodwill. |
| IAS 37 Provisions, contingencies | Section 21 | Substantially aligned. |
| IAS 38 Intangibles | Section 18 | **Material difference.** SMEs expense all internally generated intangibles (no capitalisable development costs). |
| IAS 40 Investment property | Section 16 | SMEs measure investment property at fair value through P&L if measurable without undue cost or effort; otherwise treat as PPE. |
| IAS 41 Agriculture | Section 34 | Substantially aligned. Fair value less costs to sell where reliably measurable; otherwise cost. |
| IFRS 3 Business combinations | Section 19 | **Material difference.** SMEs amortise goodwill (max 10 years if life uncertain); full IFRS does not amortise (impairment only). |
| IFRS 5 Held for sale | Section 17.27 onwards | SMEs do not have a separate IFRS-5-style classification; impairment indicator approach instead. |
| IFRS 7 / 9 Disclosures | Section 11.39 onwards | SMEs require fewer financial-instrument disclosures. |
| IFRS 8 Segments | Not required by SMEs | SMEs do not mandate segment reporting. |
| IFRS 10, 11, 12 Consolidation, JVs | Section 9, 15 | SMEs offer cost / equity / fair-value model choices. |
| IFRS 13 Fair value | Section 11 paragraphs on fair value | SMEs simpler; less explicit hierarchy disclosure. |
| IFRS 15 Revenue | Section 23 | **Material difference for complex contracts.** SMEs use risks-and-rewards / stage of completion; IFRS 15 uses five-step. Outcome converges for simple sales. |
| IFRS 16 Leases | Section 20 | See IAS 17 row. |
| IFRS 17 Insurance contracts | Not in SMEs | Out of scope for typical Chwezi clients. |

## Practical guidance per client type

| Client | Recommended framework |
|---|---|
| Small retail / hospitality / family business | IFRS for SMEs. |
| Schools, clinics (small / mid private) | IFRS for SMEs. |
| NGOs (small / mid donor-funded) | IFRS for SMEs unless donor mandates full IFRS. |
| Agribusiness (SME) | IFRS for SMEs. Section 34 Agriculture central — see `ias-agriculture`. |
| Manufacturing (SME) | IFRS for SMEs. Section 13 inventory cost-flow critical. |
| Mid-large private group | IFRS for SMEs or full IFRS depending on group reporting and bank covenants. |
| Listed entities or those preparing to list | Full IFRS. |
| Banking, insurance, pensions | Full IFRS (regulated). |

## Build implications

- Framework is a per-entity attribute; rules engine selects the correct sections at runtime.
- Inventory engine: FIFO / weighted average enabled; LIFO blocked in both.
- Lease engine: Section 20 model under IFRS for SMEs; IFRS 16 model under full IFRS.
- Financial instruments: Section 11 model under IFRS for SMEs; IFRS 9 ECL under full IFRS.
- Goodwill: amortised under IFRS for SMEs (Section 19); impairment-only under full IFRS.
- Borrowing costs: expensed under IFRS for SMEs; capitalised under IAS 23 where qualifying.
- Investment property: Section 16 election under IFRS for SMEs; IAS 40 choice under full IFRS.

## Forbidden patterns

- Mixing frameworks within a single entity-period without policy-change documentation (blocker).
- Applying IFRS 16 lessee accounting to an SME book without explicit selection of full IFRS (blocker).
- Capitalising development costs under IFRS for SMEs (blocker).
- Capitalising borrowing costs under IFRS for SMEs (blocker).

## Files

- `SKILL.md`.
- `references/full-ifrs-to-sme-mapping.md` — full cross-reference with paragraph numbers.
- `references/client-profile-decision-tree.md` — flowchart for framework selection.

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
