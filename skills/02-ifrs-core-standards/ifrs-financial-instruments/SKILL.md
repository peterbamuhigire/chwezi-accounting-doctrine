---
name: ifrs-financial-instruments
description: Financial-instrument classification, measurement, and impairment under IFRS 9 (full IFRS) and Sections 11 and 12 (IFRS for SMEs). Trade receivables, payables, bank balances, loans, deposits, debt and equity instruments, derivatives, expected credit loss (ECL), hedge accounting. Use when financial instruments are material. Tier-3 scope — Section 11 basic-instruments handling is built first; full IFRS 9 ECL deferred until a client materially requires it.
---

# Financial Instruments (IFRS 9 / Sections 11 and 12)

## Tier-3 scope

Most Chwezi SME clients hold only basic financial instruments: trade receivables, trade payables, bank balances, simple loans. For these, Section 11 (IFRS for SMEs) gives a complete model. Full IFRS 9 (classification by business model and SPPI test, ECL, hedge accounting) becomes load-bearing only for clients with material receivables, financing operations, or banking activity. Build Section 11 first; build full IFRS 9 when demanded.

## Required first reads

- `doctrine/accounting-finance-doctrine.md`
- `doctrine/references/ifrs-for-smes-default.md` (Sections 11, 12)
- `doctrine/references/full-ifrs-overlay.md` (IFRS 9)
- `doctrine/references/chart-of-accounts.md`

## Section 11 — basic financial instruments (IFRS for SMEs default)

Scope: cash, demand and fixed-term deposits, commercial paper, bonds, trade and other accounts receivable / payable, loans receivable and payable, commitments to receive a loan, and most basic investments in non-convertible preference shares and non-puttable ordinary shares.

- Initial measurement at transaction price (including transaction costs for those not at FVTPL); long-dated payment terms at PV.
- Subsequent at amortised cost using the effective-interest method.
- Impairment: assess at each reporting date; recognise impairment loss when objective evidence indicates an impairment event (incurred-loss-style for trade receivables).
- Derecognition on transfer of substantially all risks and rewards.

## Section 12 — other financial-instrument issues (IFRS for SMEs)

For instruments outside Section 11 (e.g. options, forwards, complex hybrids). Most SME clients do not use 12.

## IFRS 9 (full IFRS)

- **Classification:** business model + SPPI (solely payments of principal and interest). Buckets: amortised cost; FVOCI (debt); FVTPL; FVOCI (equity election).
- **Measurement:** amortised cost via effective interest, fair value otherwise.
- **Impairment:** Expected Credit Loss (ECL) model — 12-month ECL on Stage 1, lifetime ECL on Stage 2 and 3. Trade receivables use the simplified approach (lifetime ECL from initial recognition).
- **Hedge accounting:** optional; rules differ from IAS 39 (more principles-based).

## Initial build (Tier-3 minimum)

- Trade receivables: track per customer, ageing buckets, allowance for doubtful debts:
  - Section 11: incurred-loss assessment at each reporting date.
  - IFRS 9: provision matrix by ageing bucket (loss-rate approach for simplified ECL on trade receivables).
- Trade payables: amortised cost (typically face value short-term).
- Bank balances: cash equivalents.
- Loans: amortised cost via effective interest; schedule generator.
- Equity instruments held: cost less impairment under Section 11 where fair value not reliably measurable; otherwise fair value.
- Derecognition rules: standard.

## CoA implications

Section 11 / IFRS 9 simplified ECL on trade receivables:

| Code | Name |
|---|---|
| 1300 Trade Receivables Control | Asset. |
| 1310 Allowance for Doubtful Debts | Contra. |
| 6600 Bad Debts Expense | P&L. |
| 6610 Movement in Allowance for Doubtful Debts | P&L. |

Loans:

| Code | Name |
|---|---|
| 2600 Borrowings — Current Portion | |
| 2700 Borrowings — Non-current | |
| 8100 Interest Expense | |

## Forbidden patterns

- "Stage 2 / Stage 3" / ECL language used on an SME book without selecting full IFRS (blocker).
- Trade receivables held at face value with no allowance assessment (major).
- Hedge accounting applied without documentation (blocker under both standards).
- Equity instruments at FVTPL without explicit policy (where Section 11 cost model would otherwise apply).

## Files

- `SKILL.md`.
- `references/section-11-impairment.md`.
- `references/ifrs-9-ecl-simplified-trade-receivables.md`.
- `references/effective-interest-schedule.md`.

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
