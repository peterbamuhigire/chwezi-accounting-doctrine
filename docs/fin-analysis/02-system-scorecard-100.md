# System Scorecard Out Of 100

Baseline score: **72 / 100**
Report-v2 target score: **92-94 / 100 after required evidence is implemented and signed off**

## Summary

| Category | Weight | Score | Notes |
|---|---:|---:|---|
| Accounting doctrine correctness | 15 | 12 | Strong IFRS/IFRS for SMEs posture, ledger boundary, CoA rules, and forbidden patterns. Needs 2027 transition update. |
| Ledger architecture and invariants | 15 | 12 | Strong rules for posting boundary, double entry, immutability, reversal, period locks, audit logs, idempotency. Needs executable fixtures and core posting-engine skill. |
| Tax, statutory, and live verification | 12 | 7 | Correct verification philosophy, but no source-register implementation or verified country packs. |
| Reporting and audit readiness | 12 | 9 | Strong audit-ready pack, drilldown, print fidelity, sign-off model. Some referenced files/examples missing. |
| Internal controls and governance | 10 | 7 | Good SoD, maker-checker, approval, audit-review controls. Needs engagement quality, ethics, independence, reviewer competence model. |
| UX for laymen and non-accountants | 8 | 7 | Strong workflow vs ledger surface model. Needs mandatory plain-language layer in all output templates. |
| Skill architecture and composability | 10 | 6 | Useful 18-skill suite. Needs normalization into inputs/outputs and capped 25-skill target model. |
| Standards freshness | 8 | 5 | Current doctrine has caveats; needs IFRS for SMEs third edition and IFRS 18 transition handling. |
| Repository engineering quality | 6 | 3 | No validator/CI, visible mojibake, stale path risk, missing references. |
| East Africa/Africa extensibility | 4 | 4 | Country-extension framework exists, but only placeholders beyond Uganda. |
| **Total** | **100** | **72** | Strong foundation; not yet release-grade. |

## Why The Score Is Not Higher

The repository describes many correct practices, but a premium doctrine engine must prove them. The gap is mostly not conceptual; it is operational.

Main score reducers:

- No executable validation harness.
- No source-register implementation.
- Missing promised reference/example files.
- Encoding defects in markdown.
- Stale or risky integration path.
- No repo-native posting-engine core skill.
- Incomplete country packs.
- Current standards-transition gap for 2027.

## Target Scores

| Milestone | Target score | Conditions |
|---|---:|---|
| After Phase 1 stabilization | 80 | Validator added, mojibake fixed, links/references manifest clean, mirror path fixed. |
| After Phase 2 core skill buildout | 86 | 25-skill catalogue complete, ledger core and source register implemented. |
| After Phase 3 standards/country updates | 91 | Uganda verified pack, 2027 standards transition, country skeletons. |
| After Phase 4 productization | 95+ | Sample audit export, client templates, release evidence bundles, reviewer sign-off workflow. |

## Report-V2 Target Model

| Category | Weight | Baseline | Target | Required evidence |
|---|---:|---:|---:|---|
| Accounting doctrine correctness | 15 | 12 | 14 | 2027 standards transition notes, SME/full IFRS decision tree, reviewer sign-off. |
| Ledger architecture and invariants | 15 | 12 | 14 | Ledger-posting-engine core, balanced and failure fixtures, idempotency and reversal tests. |
| Tax, statutory, and live verification | 12 | 7 | 11 | Source-register schema, Uganda verified pack, stale/missing-source gate. |
| Reporting and audit readiness | 12 | 9 | 11 | Audit export sample, report pack manifest, hashes, source drilldown, sign-off workflow. |
| Internal controls and governance | 10 | 7 | 9 | Engagement quality, ethics, independence, reviewer competence, maker-checker evidence. |
| UX for laymen and non-accountants | 8 | 7 | 8 | Three-layer output rule in client-facing templates. |
| Skill architecture and composability | 10 | 6 | 9 | 25-skill catalogue and explicit Inputs/Outputs in every skill. |
| Standards freshness | 8 | 5 | 8 | IFRS Required 2026, IFRS 18, IFRS for SMEs third edition, IAASB 2025, IESBA 2025 entries and review calendar. |
| Repository engineering quality | 6 | 3 | 6 | CI or local validator, mojibake scan, link check, mirror dry-run. |
| East Africa/Africa extensibility | 4 | 4 | 4 | Country skeletons that block final rates until verified. |
| **Total** | **100** | **72** | **94** | Release-evidence bundle. |

## Release Decision

Current release decision: **pass-with-caveats**.

Allowed:

- Internal planning.
- Doctrine improvement work.
- Draft SRS/proposal/business-plan generation with caveats.
- Architecture guidance where statutory values are not final.

Not allowed yet:

- Claiming 100% current statutory compliance.
- Producing final tax filings.
- Claiming final IFRS/IFRS for SMEs compliance without professional review.
- Claiming Big Four equivalent assurance.
- Using country placeholders as final country packs.

The target model is conditional. It should be used to drive implementation and re-score preparation, not as a current score until the definition of done in `11-definition-of-done-and-rescore.md` is satisfied.
