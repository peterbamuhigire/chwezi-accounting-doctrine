---
name: engagement-quality-and-plain-language-output
description: Use when preparing, reviewing, or approving client-facing finance outputs that need preparer-reviewer-approver governance, competence and independence checks, ethics caveats, assurance-quality gates, and mandatory business-language, accounting-policy, and evidence/caveat layers.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Engagement Quality and Plain-Language Output

<!-- dual-compat-start -->
## Use When

Use when finance outputs need review governance, sign-off, ethics or independence caveats, or plain-language layers for non-accountants.

## Do Not Use When

Do not use to claim audit, assurance, tax, ethics, or independence conclusions without current official-source review and suitable engagement scope.

## Required Inputs

Draft output, intended audience, reviewer matrix, competence and independence check, source-register state where applicable, and release status.

## Workflow

Check the three output layers, confirm reviewer roles, evaluate caveats, reject unsupported claims, and record sign-off evidence before final release.

## Quality Standards

Plain language without loss of accounting accuracy, named reviews, visible caveats, source-backed statutory values, and status-controlled release.

## Anti-Patterns

Friendly summaries without accounting treatment, hidden caveats, self-approval of high-risk output, and premature final labels.

## Outputs

Three-layer client outputs, sign-off records, ethics and independence caveats, rejection notices, and reviewer-ready templates.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/policy-hierarchy.md`.
- Read `finance-ux-for-non-accountants` when writing for owners, operators, or non-accountants.
- Confirm output audience, output status, engagement role matrix, applicable jurisdiction, reporting framework, and whether tax, audit, assurance, or statutory advice is included.
- For current ethics, independence, quality-management, audit, assurance, or sustainability-assurance claims, require current official source review before final release.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Draft output | Preparer | Required | Business meaning, accounting treatment, evidence/caveat layers present. |
| Reviewer matrix | Engagement lead | Required | Preparer, technical reviewer, tax reviewer when needed, controller, and final approver named. |
| Competence and independence check | Engagement lead | Required | Role competence, conflict, and independence status recorded. |
| Source-register snapshot | Tax/statutory owner | Required when statutory values appear | Final values usable or visibly caveated. |
| Sign-off record | Reviewer or approver | Required for final release | Date, role, decision, caveats, and version recorded. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Three-layer client output | Client, reviewer, implementer | Business meaning, accounting treatment, evidence/caveat layer all present. |
| Reviewer sign-off | Release process | Named roles, status, caveats, and version captured. |
| Ethics and independence caveat | Engagement file | Conflicts, limitations, and non-assurance status visible where relevant. |
| Rejection notice | Preparer | Missing layer, missing review, or unsupported claim blocks final release. |
| Plain-language summary | Non-accountants | Clear business explanation without hiding accounting treatment. |

## Decision Rules

1. Every client-facing finance output has three layers: business meaning, accounting treatment, and evidence/caveat.
2. Final output requires named preparer and reviewer sign-off. Tax, payroll, statutory, complex IFRS, or consolidation outputs require specialist review.
3. The same person should not prepare and finally approve high-risk finance output unless a documented small-entity waiver applies.
4. Ethics, independence, assurance, and quality-management statements require current official-source review before final release.
5. Plain-language wording must not dilute accounting accuracy or hide limitations.
6. Caveats must name the affected figures, decisions, source states, and reviewer action needed.
7. Reject output that contains final statutory values without source-register support.
8. Use `draft`, `review-ready`, `approved-with-caveats`, or `final` status consistently in output metadata.

## Acceptance Evidence

- `references/reviewer-matrix.md` defines required roles and segregation.
- `references/plain-language-output-pattern.md` defines the three-layer structure.
- `references/quality-and-ethics-gates.md` defines release blockers.
- `examples/sign-off-template.md` shows required sign-off evidence.
- `examples/independence-ethics-caveat-template.md` shows caveat wording without claiming assurance.
- `examples/rejected-missing-plain-language-layer.md` proves the failure mode.

## Anti-Patterns

- Sending accounting treatment without a business-language explanation.
- Sending a friendly summary that omits journals, policies, evidence, or caveats.
- Treating tax, audit, assurance, or independence statements as static boilerplate.
- Letting the preparer self-approve high-risk output without waiver.
- Hiding unverified statutory values in appendices.
- Using "final" labels before reviewer sign-off.

## Required References

- `references/reviewer-matrix.md`
- `references/plain-language-output-pattern.md`
- `references/quality-and-ethics-gates.md`
- `finance-ux-for-non-accountants/SKILL.md`
- `doctrine/references/policy-hierarchy.md`
- `tax-statutory-source-register-and-country-packs/references/source-register-contract.md`

## Examples

- `examples/sign-off-template.md`
- `examples/independence-ethics-caveat-template.md`
- `examples/rejected-missing-plain-language-layer.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Engagement quality lead |
| Reviewer roles | Controller, tax reviewer when statutory content appears, assurance or ethics reviewer when assurance language appears |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-08-15 |
| Release state | Draft until validator checks three-layer output and sign-off metadata |
| Caveat | Ethics, independence, audit, assurance, and sustainability-assurance references must be checked against current official material before final use. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
