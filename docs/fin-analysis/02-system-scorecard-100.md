# System Scorecard Out Of 100

Assessment date: 2026-05-16
Current score: **94 / 100**
Previous baseline: **72 / 100**

## Current Score

| Category | Weight | Score | Evidence |
|---|---:|---:|---|
| Accounting doctrine correctness | 15 | 14 | Core doctrine, policy hierarchy, CoA rules, IFRS/SME posture, and 2027 transition references are present. Human reviewer sign-off remains. |
| Ledger architecture and invariants | 15 | 14 | `ledger-posting-engine-core`, posting contract, invariants, examples, and quality-gate fixtures are present. Consumer-repo executable tests remain. |
| Tax, statutory, and live verification | 12 | 10 | Source register exists and validates; Uganda NSSF is verified-current. VAT, PAYE, WHT, income-tax, EFRIS, FX, and non-Uganda packs remain draft. |
| Reporting and audit readiness | 12 | 11 | Audit export sample, reporting references, quality-gate fixtures, hashes/sign-off structure, and drilldown evidence exist. Release-specific hashes/sign-offs remain. |
| Internal controls and governance | 10 | 9 | Internal controls, maker-checker, SoD, reviewer roles, ethics/plain-language skill, and sign-off fixtures exist. Named reviewer execution remains. |
| UX for laymen and non-accountants | 8 | 8 | Finance UX, UI pattern library, workflow vocabulary, microcopy, and three-layer output pattern are present. |
| Skill architecture and composability | 10 | 10 | 25 active skills, required sections, and 69 declared references all validate. |
| Standards freshness | 8 | 8 | IFRS Required 2026, IFRS 18, IFRS for SMEs third edition, IAASB/IESBA source posture, and review cadence are represented. |
| Repository engineering quality | 6 | 6 | Validator, CI workflow, mojibake scan, source-register check, skill-contract check, link check, saved validation report, and mirror dry-run all pass. |
| East Africa/Africa extensibility | 4 | 4 | Country extension framework and skeleton packs exist with final-rate blocking discipline. |
| **Total** | **100** | **94** | Validator-clean doctrine package with bounded source/reviewer caveats. |

## Why The Score Is 94, Not 100

The repository now proves the doctrine package structure, skill completeness, quality gates, and source-register mechanics. The remaining deductions are deliberate:

- Uganda VAT, PAYE, WHT, income-tax, EFRIS, and exchange-rate entries are still draft.
- Kenya, Rwanda, Tanzania, and South Africa packs are skeletons.
- Human reviewer sign-offs are not yet recorded for a scored release.
- Quality-gate fixtures are repository evidence, but consumer applications still need executable tests.
- A release manifest template exists, but a completed tagged-release manifest is still required per release.

## Target Movement

| Target | Score | Required work |
|---|---:|---|
| Current validated state | 94 | Maintain validator pass with zero findings. |
| Source-complete Uganda release | 96 | Verify active Uganda VAT, PAYE, WHT, income-tax, EFRIS, and FX entries. |
| Reviewer-signed release | 97 | Add named accounting, tax, tooling, doctrine, and delivery sign-offs. |
| Consumer-tested doctrine engine | 98 | Add executable adoption tests in consumer repos for ledger, source-register, and quality gates. |
| 99+ | 99+ | Multi-country verified packs, archived official sources, live review calendar, and repeated release evidence across real client implementations. |

## Release Decision

Current release decision for the doctrine repository: **pass**.

Decision caveat: final statutory output is allowed only for source-register entries marked `verified-current` or reviewer-approved `verified-with-caveat`. Draft source entries cannot support final rates, filings, or statutory claims.
