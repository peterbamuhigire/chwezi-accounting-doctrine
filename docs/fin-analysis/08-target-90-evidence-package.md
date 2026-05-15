# Target 90+ Evidence Package

Prepared: 2026-05-15
Source: `.codex-report-v2-extract.md`

## Status

This file defines the evidence package required for a defensible 90+ re-score. It does not claim the repository is already above 90. The target score is **92-94 / 100** only after the evidence exists, local validation passes, and reviewer sign-off is recorded.

## Required Release Evidence

| Evidence item | Purpose | Minimum release evidence | Caveat if missing |
|---|---|---|---|
| Validation harness | Proves doctrine quality gates automatically. | Saved validation report with zero blocker and zero high findings, or named high waivers with owner and expiry. | Score remains capped because governance is manual. |
| Reference manifest | Accounts for promised files and links. | Manifest classifies every declared file as present, planned, external, deprecated, or waived. | Missing references remain hidden defects. |
| Source register | Supports statutory, tax, payroll, FX, and e-invoicing claims. | Schema plus Uganda entries for active statutory surfaces, with source, verifier, state, archive, and recheck date. | Final statutory outputs must remain draft or caveated. |
| Standards transition pack | Handles 2026 baseline and 2027 transition. | IFRS 18, IFRS for SMEs third edition, and decision-tree references with fixtures. | Future-period reporting basis may be wrong or incomplete. |
| Ledger posting engine core | Makes double-entry behavior deterministic. | Posting contract, journal schema, event map, idempotency/reversal rules, invariant tests, and failure fixtures. | Downstream implementations can diverge. |
| Skill contract normalization | Makes the 25-skill catalogue composable. | Inputs, Outputs, Decision Rules, Acceptance Evidence, Anti-Patterns, references, and review metadata in each active skill. | Agents may infer incompatible contracts. |
| Country pack gates | Prevents misuse of country placeholders. | Uganda verified minimum pack; Kenya, Rwanda, Tanzania, and South Africa skeletons explicitly block final rates until verified. | Regional outputs can leak unverified assumptions. |
| Audit export sample | Demonstrates report pack, drilldown, sign-off, hashes, and manifest shape. | `docs/audit-export-sample/` bundle with manifest, index, report placeholders, ledger CSV headers, signoffs, and hash guidance. | Reporting/audit-readiness score remains evidence-light. |
| Release manifest | Records release state and caveats. | `docs/release-manifest-template.yaml` completed per release with commit, validation state, standards basis, sign-offs, and open caveats. | Consumers cannot prove which doctrine version and caveats apply. |
| Reviewer sign-off | Converts implementation evidence into release evidence. | Accounting, tax, tooling, doctrine owner, and delivery sign-offs, with dates and scope. | Re-score narrative must remain conditional. |

## Target Score Model

| Category | Weight | Baseline | Target | Evidence driver |
|---|---:|---:|---:|---|
| Accounting doctrine correctness | 15 | 12 | 14 | 2027 standards transition, framework decision tree, reviewer sign-off. |
| Ledger architecture and invariants | 15 | 12 | 14 | Posting-engine core skill, balanced fixtures, failure fixtures, idempotency and reversal tests. |
| Tax, statutory, and live verification | 12 | 7 | 11 | Source-register schema, Uganda verified pack, stale or missing source gates. |
| Reporting and audit readiness | 12 | 9 | 11 | Audit export sample, report manifest, hashes, drilldown, sign-off workflow. |
| Internal controls and governance | 10 | 7 | 9 | Engagement quality, ethics, independence, reviewer competence, maker-checker evidence. |
| UX for laymen and non-accountants | 8 | 7 | 8 | Mandatory three-layer output pattern. |
| Skill architecture and composability | 10 | 6 | 9 | 25-skill catalogue and explicit Inputs/Outputs. |
| Standards freshness | 8 | 5 | 8 | 2026 required baseline, IFRS 18, IFRS for SMEs third edition, IAASB 2025, IESBA 2025. |
| Repository engineering quality | 6 | 3 | 6 | CI or local validator, mojibake scan, link check, mirror dry-run. |
| East Africa/Africa extensibility | 4 | 4 | 4 | Country skeletons that block final rates until verified. |
| **Total** | **100** | **72** | **94** | Complete release-evidence bundle. |

## Release Evidence Package Boundary

The report-v2 evidence package should include:

- A saved validation report.
- Source-register snapshot and source archive notes.
- Standards-transition fixture results.
- Ledger invariant fixture results.
- Skill contract validation results.
- Audit export sample bundle.
- Release manifest.
- Sign-off records.
- Open-caveat list.

The package may support a 90+ re-score when blocker findings are closed and high findings are either closed or formally waived. It must not be described as a clean release if non-Uganda country packs remain skeletons or source archive captures are still missing.
