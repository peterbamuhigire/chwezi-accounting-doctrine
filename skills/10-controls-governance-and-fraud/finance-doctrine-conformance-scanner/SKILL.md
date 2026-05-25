---
name: finance-doctrine-conformance-scanner
description: Use when scanning a software system, codebase, implementation plan, proposal, policy memo, business plan, blog post, SRS, or finance/accounting product specification against the Chwezi accounting and finance doctrine. Produces a deep gap analysis, risk-ranked findings, and detailed alignment instructions tied to the doctrine skills and source-register rules.
status: active
metadata:
  portable: true
  category: 10-controls-governance-and-fraud
  compatible_with:
    - claude-code
    - codex
---

# Finance Doctrine Conformance Scanner

<!-- dual-compat-start -->
## Use When

Use when a system, codebase, plan, proposal, blog post, report, product specification, or implementation artefact must be tested against the Chwezi accounting and finance doctrine.

## Do Not Use When

Do not use as a replacement for human accounting, audit, tax, legal, security, accessibility, or sector-specialist review. Do not treat a clean heuristic scan as proof of doctrine conformance.

## Required Inputs

Target path or document, intended audience, entity type, jurisdiction, reporting framework, period, functional currency, statutory source-register snapshot where values appear, and the intended output type.

## Workflow

Run the deterministic scanner where a local target exists, read the target artefacts, map findings to doctrine areas, test source discipline, produce a ranked gap register, and write alignment instructions with owners, evidence required, and acceptance checks.

## Quality Standards

Traceable to doctrine, risk-ranked, source-disciplined, actionable, reviewer-routable, and explicit about unsupported claims, missing evidence, statutory uncertainty, and implementation risk.

## Anti-Patterns

Only running keyword checks, ignoring proposal prose, marking client-specific statutory values as verified without source-register evidence, or giving generic advice that does not point to a doctrine skill and concrete fix.

## Outputs

Conformance report, risk-ranked gap register, doctrine crosswalk, implementation instructions, evidence request list, reviewer route, and optional machine-readable scan JSON.

## References

Use `references/review-rubric.md`, `references/output-template.md`, and `tools/invoke-doctrine-conformance-scan.ps1`.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/policy-hierarchy.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `doctrine/references/status-taxonomy.md`.
- Read `references/review-rubric.md`.
- Confirm the target type: codebase, system design, plan, proposal, article, or mixed artefact.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Target artefact or path | User | Required | Exists locally or content is provided in the prompt. |
| Review scope | User or reviewer | Required | Names jurisdiction, framework, entity type, period, and output purpose where known. |
| Source-register snapshot | Country-pack owner | Required when statutory values appear | Must be verified-current for final statutory claims. |
| Doctrine baseline | Doctrine repo | Required | Uses current `skills/`, `doctrine/references/`, and source-register rules. |
| Output preference | User | Optional | Markdown report by default; JSON when machine ingestion is needed. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Conformance report | Product owner, controller, implementer | Overall state, scope, method, findings, and limits stated. |
| Gap register | Delivery team | Severity, doctrine reference, location, risk, fix instruction, owner, and acceptance check. |
| Doctrine crosswalk | Reviewer | Maps artefact areas to required doctrine skills and unresolved gaps. |
| Evidence request list | Client or project owner | Lists missing source documents, policies, statutory sources, contracts, reconciliations, and approvals. |
| Implementation instructions | Engineering or proposal team | Specific changes to workflows, data contracts, controls, reports, or prose. |

## Decision Rules

1. Separate code defects, process gaps, unsupported accounting claims, missing evidence, statutory uncertainty, and content-quality issues.
2. Rank as critical when the artefact can create wrong ledger entries, destroy accounting evidence, bypass period locks, release unsupported statutory values, or misstate financial statements.
3. Rank as high when the artefact lacks source-register support, reviewer routing, segregation of duties, control-account tie-out, related-party discipline, AI finance guardrails, or audit evidence.
4. Rank as medium when the artefact is directionally sound but missing workflow completeness, documentation, exception handling, accessibility, mobile/offline resilience, or management-reporting traceability.
5. For codebases, run `tools/invoke-doctrine-conformance-scan.ps1` first, then manually review the highest-risk files and any finance-domain files the scanner did not flag. Use `-NoFailOnFindings` when generating an advisory report where findings should not make the command fail.
6. For plans, proposals, and blog posts, scan claims manually for framework selection, source discipline, statutory values, over-promising, missing caveats, and alignment with the relevant doctrine skills.
7. Every recommendation must name the doctrine skill or reference it comes from and must include an acceptance check.
8. If a claim cannot be traced to a real source, mark it as a gap and remove or caveat it; do not rewrite it as if it were verified.

## Acceptance Evidence

- `references/review-rubric.md` is used to classify findings.
- `references/output-template.md` is followed for the final report shape.
- `tools/invoke-doctrine-conformance-scan.ps1` is run for local codebases or mixed repositories unless the user explicitly requests a manual-only review.
- Findings cite doctrine paths and provide implementable alignment instructions.
- Statutory and factual claims are blocked unless source-register or external evidence is current and traceable.

## Anti-Patterns

- Reporting "passes doctrine" when only a keyword scan was run.
- Treating marketing copy as harmless when it includes unsupported accounting, tax, ROI, or compliance claims.
- Ignoring blog posts or proposals because they are not code.
- Giving a list of risks without concrete fixes and acceptance checks.
- Failing to distinguish official doctrine requirements from reviewer judgement or inference.

## Files

- `references/review-rubric.md`
- `references/output-template.md`
- `examples/sample-scan-report.md`
- `tools/invoke-doctrine-conformance-scan.ps1`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Doctrine owner |
| Reviewer roles | Controller; accounting systems architect; tax reviewer where statutory values appear; security reviewer for codebases; proposal reviewer for bids and investment cases |
| Last reviewed | 2026-05-25 |
| Next review due | 2026-11-25 |
| Release state | Active doctrine scanner facility; heuristic tool output requires human review before final conformance sign-off. |
| Caveat | The scanner detects high-risk patterns and structures a deep review; it does not certify compliance on its own. |

Last reviewed: 2026-05-25. Next review due: 2026-11-25.
