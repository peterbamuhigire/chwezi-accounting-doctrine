# Research Engine Integration Log

Upgrade date: 2026-07-08  
Engine: Chwezi Core Systems accounting doctrine  
Digital Research Skills Engine path: `C:\wamp64\www\digital-research-skills`  
Last verified: 2026-07-08

## Capability Orientation

The live Digital Research Skills Engine at `C:\wamp64\www\digital-research-skills` is a cross-cutting evidence engine for source evaluation, verification, search strategy, legal/statutory research, OSINT, due diligence, research orchestration, executive synthesis, and anti-slop release gates. Its top-level `SKILL.md` routes standards/statutory verification through `source-evaluation`, `source-verification`, `research-techniques`, and `online-legal-research`, with `anti-ai-slop` applied continuously. The engine's controlling rule is that no claim, date, statute, URL, rate, standard, or organisation appears unless it is traceable to a real source or explicitly marked as a gap, inference, or conflict.

## Mandatory Research Engine Files Loaded

| File | Purpose in this upgrade |
|---|---|
| `C:\wamp64\www\digital-research-skills\SKILL.md` | Router and standard operating sequence. |
| `C:\wamp64\www\digital-research-skills\AGENTS.md` | Codex runtime workflow and evidence discipline requirement. |
| `skills/source-evaluation/SKILL.md` | Source tiers, credibility ladder, and anti-hallucination rule. |
| `skills/source-evaluation/references/evidence-discipline.md` | Hard constraint: no unsourced claims. |
| `skills/anti-ai-slop/SKILL.md` | Quality and specificity guardrail. |
| `skills/source-verification/SKILL.md` | Verification manifest and claim-source checks. |
| `skills/source-verification/references/verification-routine.md` | Required source/claim/URL verification fields. |
| `skills/research-techniques/SKILL.md` | Search technique router. |
| `skills/research-techniques/references/search-operator-grammar.md` | Operator discipline for official-source lookup. |
| `skills/online-legal-research/SKILL.md` | Legal/statutory source hierarchy and currency discipline. |
| `skills/online-legal-research/references/source-hierarchy-and-authority.md` | Primary vs secondary authority rules. |
| `skills/online-legal-research/references/east-african-overlay.md` | Uganda/East Africa legal source and currency-check overlay. |
| `docs/quality-gates/release-blocking-gates.md` | Evidence, verification, reasoning, anti-slop, and completeness gates. |

## Invocation Log

| Date/time | Research sub-skill invoked | Query or task | What was retrieved | Engine files informed |
|---|---|---|---|---|
| 2026-07-08 | `source-evaluation` + `source-verification` | Verify standards sources for IFRS Accounting Standards Required 2026, IFRS for SMEs third edition, IAASB Handbook, and COSO basis. | Official standard-setter or attached-book basis confirmed; IFRS for SMEs third edition remains a 2027 effective-date transition item. | `docs/source-registers/ifrs-tax-statutory-2026.md`; `FINAL-UPGRADE-REPORT.md`; `book-knowledge-map.md`. |
| 2026-07-08 | `online-legal-research` + `research-techniques/search-operator-grammar` | Re-check Uganda VAT, PAYE, NSSF, WHT, LST, and EFRIS using primary/official sources first. | Confirmed NSSF contribution split from NSSF Uganda; EFRIS enrolment and platform channels from URA; PAYE live-page conflict with 2026 amendment material; WHT remains payment-specific; LST remains blocked without current local-authority source. | `docs/source-registers/ifrs-tax-statutory-2026.md`; `references/uganda-statutory.md`. |
| 2026-07-08 | `online-legal-research` + `source-verification` | Resolve VAT registration threshold conflict. | URA live guidance still shows UGX 150,000,000; introduced 2026 VAT Bill shows UGX 250,000,000; Parliament Hansard records passage with a UGX 300,000,000 substitution. Final threshold logic remains blocked until assented Act/Gazette or updated URA guidance confirms the operative rule. | `docs/source-registers/ifrs-tax-statutory-2026.md`; `references/uganda-statutory.md`; `FINAL-UPGRADE-REPORT.md`. |
| 2026-07-08 | `source-verification` | Repair prior research log and provenance path. | Corrected the prior incorrect research-engine location to `C:\wamp64\www\digital-research-skills` in durable routing and affected engine references. | `C:\Users\BIRDC\.codex\AGENTS.md`; `README.md`; `retail-and-pos-accounting-pack/references/source-basis.md`; this log. |

## Verification Manifest Summary

Detailed manifest: `docs/engine-upgrade-july-2026/research-verification-manifest.md`.

Release status: `conditional-pass`. The research process now used the live digital research engine, but final Uganda PAYE, VAT registration threshold, WHT, and LST values remain release-blocked for client statutory output until a named reviewer verifies the controlling primary authority for the exact period.

## Impact Summary

The redo changed the engine in five concrete ways:

1. Added `C:\wamp64\www\digital-research-skills` to global Codex routing memory.
2. Removed the false blocker from the previous pass and replaced it with live research-engine invocation evidence.
3. Replaced fallback-only research wording with explicit digital-research sub-skill invocations.
4. Corrected VAT threshold handling from a two-way 150m/250m conflict to a three-source conflict: URA 150m, introduced Bill 250m, Parliament Hansard 300m.
5. Kept PAYE, WHT, LST, and VAT-threshold final use blocked where current primary authority is not fully resolved.

Re-verify after any Uganda Finance Act, URA handbook, Gazette publication, IFRS Foundation update, IAASB handbook update, NSSF update, EFRIS notice, or local-government LST schedule update.
