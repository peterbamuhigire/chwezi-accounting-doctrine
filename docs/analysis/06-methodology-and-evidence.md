# Methodology and Evidence

## Question being scored

> If this doctrine had to be the canonical accounting and finance reference for **every** kind of artefact an engine in our stack might produce - across every IFRS / IFRS for SMEs / IPSAS standard, every operating sub-process, every sector we serve, every regulatory and emerging-domain pressure - how complete is it today?

This is a wider lens than the scorecard in `docs/fin-analysis/02-system-scorecard-100.md`, which scores the doctrine against its own declared 25-skill scope.

## Scoring rubric

Each of 17 pillars carries a weight chosen by frequency-of-engagement and severity-of-error if missing. Pillar weights sum to 100. Each pillar is scored 0 to its weight cap.

| Score band per pillar | Definition |
|---|---|
| 0 % | No skill in this pillar at all. |
| 25 % | Doctrine references touch the topic but no SKILL.md exists, or only a draft stub. |
| 50 % | At least one SKILL.md exists with required sections and references; partial coverage. |
| 75 % | Multiple SKILL.md cover the pillar; reviewer-signed; usable in client work with caveats. |
| 100 % | Full pillar coverage, validator-passing, reviewer-signed, source-register-backed, evidenced by worked examples. |

Pillar scores are not multiplied by 25 / 50 / 75 / 100 directly; instead the assessor reads the present evidence and assigns a fractional score within the pillar's weight cap. The assessor's reasoning is captured in `01-executive-summary.md` "Comment" column.

## What counts as evidence

- A SKILL.md file with frontmatter, required sections, and review metadata that passes `tools/validate-doctrine.ps1`.
- One or more files under the skill's `references/` directory citing primary sources.
- One or more worked artefacts under the skill's `examples/` directory.
- A row in `docs/reference-manifest.md` classifying the skill as `present`.
- For statutory content, an entry in `doctrine/source-register/` marked `verified-current`.
- Reviewer sign-off captured in the SKILL.md Review Metadata block.

## Authoritative sources informing pillar definitions

| Source | Relevance |
|---|---|
| IFRS Foundation, **IFRS Accounting Standards Required 2026** (Red Book) | Pillars 2, 3, 7. |
| IFRS Foundation, **IFRS for SMEs Accounting Standard (third edition, 2025)** | Pillars 2, 3, 7. |
| IFRS Foundation, **IFRS 18 Presentation and Disclosure in Financial Statements** | Pillar 7. |
| IFRS Foundation / ISSB, **IFRS S1 General Requirements** and **IFRS S2 Climate-related Disclosures** | Pillar 7 (sustainability) and Pillar 17 (carbon). |
| IPSASB, **2025 Handbook of International Public Sector Accounting Pronouncements** | Pillar 13. |
| IAASB, **2025 Handbook of International Quality Management, Auditing, Review, Other Assurance, and Related Services Pronouncements** | Pillars 6, 10. |
| IESBA, **Code of Ethics for Professional Accountants** | Pillar 10. |
| FATF, **International Standards on Combating Money Laundering** | Pillar 10. |
| COSO, **Internal Control - Integrated Framework (2013) and ERM (2017)** | Pillar 10. |
| ISO/IEC 27001:2022 and PCI DSS v4.x | Pillar 15. |
| BIS / national central-bank guidance on open banking and payments | Pillar 14. |
| Jurisdiction tax authorities (URA, KRA, RRA, TRA, SARS) | Pillar 8. |
| Sector regulators (e.g. Education ministry, Health ministry, NGO Bureau, Bank of Uganda for fintech) | Pillar 11. |

Citations are deliberately to **bodies, not to specific URLs**, because URLs go stale. The Chwezi source-register at `doctrine/source-register/` is where current-effective URLs and dates live, gated by verifier sign-off.

## Why pillar 1 (Doctrine spine) and pillar 2 (Ledger invariants) score full marks

Both are validator-backed and fixture-mapped. Every blocker in `governance/finance-accounting-quality-gate.md` for these pillars is mapped to a present fixture in `docs/quality-gate-fixture-map.md`. The narrow-lens scorecard at `docs/fin-analysis/02-system-scorecard-100.md` also scores them near full. No realistic uplift left within these pillars.

## Why pillar 12 (sector packs) scored zero pre-reorg

The repository README at `/README.md` names "SMEs, schools, clinics, NGOs, retail, agribusiness, hospitality" as typical Chwezi clients. None of them had a dedicated skill. `ias-agriculture` partially covers an agribusiness slice; `ias-government-grants` partially covers an NGO slice. Neither is a sector pack. The Wave 5 entries scaffold the full set.

## Independence of this score from the narrow-lens score

The 94/100 in `docs/fin-analysis/02-system-scorecard-100.md` measures: "did we deliver what the 25-skill plan promised?" The answer is largely yes.

The 62/100 in `01-executive-summary.md` of this pack measures: "is the 25-skill plan itself complete enough?" The answer is "no - it covers the spine and high-frequency IFRS but is silent on AR, AP, treasury, primary statements, FP&A, sectors, IPSAS, sustainability, AI governance, and several IFRS standards."

Both scores are correct for what they measure. The wider-lens score is the more useful planning input from here on.

## Reproducibility

The scoring spreadsheet is the table in `01-executive-summary.md`. To reproduce:

1. Read `01-executive-summary.md` for pillar weights and pillar scores.
2. Read `03-gap-register.md` for the evidence behind each score.
3. Read `04-skills-matrix.md` for the full active vs draft state of every SKILL.md.
4. Run `powershell.exe -NoProfile -File tools/validate-doctrine.ps1` to confirm the validator state.

## Limitations

- This is a single-assessor pass. A second reviewer is expected to revise the pillar weights and individual pillar scores before the score is treated as authoritative.
- The 25 active skills were not re-scored in this pass; their narrow-lens 94/100 is preserved.
- Sector specialist input was not gathered for pillar 11. The sector pack list is a working hypothesis based on the README's client-type enumeration.
- IPSAS, IFRS 17, and IFRS S1/S2 coverage assumes the entity falls in scope; for entities out of scope, active doctrine coverage may remain unused for that engagement.

Last reviewed: 2026-05-25. Next review due: 2026-08-25.
