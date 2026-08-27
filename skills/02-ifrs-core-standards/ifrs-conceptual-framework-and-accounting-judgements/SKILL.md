---
name: ifrs-conceptual-framework-and-accounting-judgements
description: Use when applying the IFRS Conceptual Framework to accounting policy development, recognition, measurement, materiality, presentation, disclosure, and judgement documentation when no Standard directly resolves the transaction or a Standard permits a policy choice.
status: active
metadata:
  portable: true
  category: 02-ifrs-core-standards
  compatible_with:
    - claude-code
    - codex
---

# IFRS Conceptual Framework and Accounting Judgements

## Use When

Use for full-IFRS policy analysis, new or unusual transactions, policy choices,
materiality judgements, recognition/derecognition questions, measurement-basis
selection, and explanations that bridge economic substance to the applicable
Standard.

## Do Not Use When

Do not use the Framework to override an applicable IFRS Accounting Standard, to
replace the licensed Standard text, or to certify a client conclusion without
the required evidence and professional review.

## Prerequisites

- `doctrine/accounting-finance-doctrine.md` and `doctrine/references/policy-hierarchy.md`.
- The applicable IFRS Standard, implementation guidance, agenda decision, and
  current source-verification record where the transaction is within a Standard.
- `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml` and the Digital
  Research source-evaluation and verification records.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---:|---|
| Transaction fact pattern | Engagement owner / operations | Required | Parties, rights, obligations, timing, uncertainty and evidence are identified. |
| Applicable-standard search | IFRS reviewer / researcher | Required | Standards considered, exclusions and source IDs are recorded. |
| Policy and judgement log | Controller / preparer | Required | Facts, requirements, estimates, judgements and inferences are separated. |
| Materiality context | Reporting owner | Required when presentation/disclosure is affected | Qualitative and quantitative factors and affected users are documented. |
| Reviewer route | Doctrine owner | Required | Named role, independence/competence check and approval state are present. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Conceptual Framework decision memo | Controller, IFRS reviewer, auditor liaison | Decision tree completed; applicable Standard precedence tested; source IDs and caveats present. |
| Policy/judgement workpaper | Financial statements and notes | Recognition, measurement, presentation, disclosure and materiality conclusions trace to evidence. |
| Alternatives and sensitivity log | Management and audit committee | Rejected alternatives, uncertainty, effects and reviewer route are visible. |
| Exception and release record | Release owner | Missing source, unresolved judgement or human-review blocker is not hidden. |

## Workflow

1. Define the reporting entity, reporting basis, transaction boundary, reporting
   date, primary users and decision to be supported.
2. Search for a directly applicable Standard, Interpretation, scope exception,
   implementation guidance and relevant current agenda decision before using the
   Framework.
3. If no Standard applies, use the Framework decision tree: identify the
   reporting entity and elements, assess recognition/derecognition, select a
   measurement basis, then design faithful presentation and material disclosure.
4. If a Standard permits an accounting-policy choice, list the permitted choices
   and apply the entity's documented policy consistently; do not use the
   Framework to invent a third option.
5. Separate source facts, Standard requirements, management estimates,
   judgements, analyst inferences and recommendations.
6. Reconcile the policy outcome to the CoA/reporting map, affected statements,
   notes, tax/statutory boundary, and control evidence.
7. Route complex judgement, material uncertainty, and final reporting to the
   named IFRS reviewer; unresolved evidence is `blocked` or `NOT ASSESSED`.

## Decision Rules

| Question | Decision | Required evidence |
|---|---|---|
| Does an IFRS Standard directly apply? | Apply that Standard and its scope/measurement/disclosure requirements. | Standard/source ID and scope analysis. |
| Does a Standard permit a policy choice? | Select and document one permitted policy; apply consistently and disclose material policy information. | Policy owner, effective date, alternatives and impact. |
| No Standard directly applies? | Develop a policy consistent with Framework definitions, recognition, measurement, presentation and disclosure concepts. | Framework memo and search record. |
| Framework conflicts with a Standard? | The Standard controls; record the conflict and do not override it. | Paragraph-level reviewer note. |
| Is the information material by nature or magnitude? | Present/disclose or aggregate only when aggregation does not obscure material information; document the judgement. | Materiality workpaper and affected-user analysis. |
| Is evidence, source currentness or reviewer authority missing? | Narrow the conclusion and mark it pending/blocked. | Exception register and recovery owner. |

## Acceptance Evidence

- `references/conceptual-framework-decision-tree.md` is completed for the
  transaction.
- `references/judgement-and-materiality-workpaper.md` contains facts, sources,
  alternatives, conclusion, impact, uncertainty and reviewer route.
- `examples/no-specific-standard-policy.md` demonstrates an illustrative
  policy-development path without presenting it as client advice.
- Applicable specialist routes are cross-referenced and the ledger/reporting
  impact reconciles to source evidence.

## Evidence Produced

| Category | Artifact | Format | Example |
|---|---|---|---|
| Correctness | Framework decision memo | Markdown decision record using `references/conceptual-framework-decision-tree.md` | `docs/ifrs-workpapers/framework-decision-<id>.md` |
| Release evidence | Judgement and materiality workpaper | Markdown workpaper using `references/judgement-and-materiality-workpaper.md` | `docs/ifrs-workpapers/judgement-<id>.md` |

## Anti-Patterns

- Citing the Framework while an applicable Standard was not searched.
- Treating the Framework as a higher-level rule that overrides a Standard.
- Combining facts, estimates and analyst inferences into one conclusion.
- Calling a policy choice “management preference” without listing permitted
  alternatives and financial-statement impact.
- Using materiality as a reason to omit a required control or to conceal a
  qualitatively material related-party, covenant, or risk item.
- Publishing an unsupported policy because the transaction is unusual.

## Files

- `references/conceptual-framework-decision-tree.md`
- `references/judgement-and-materiality-workpaper.md`
- `examples/no-specific-standard-policy.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | IFRS policy and judgement reviewer |
| Reviewer roles | IFRS technical reviewer; controller; auditor liaison where reporting is affected |
| Last reviewed | 2026-08-27 |
| Next review due | 2026-12-31 |
| Release state | Active doctrine route; final client output remains reviewer-gated |
| Caveat | The Conceptual Framework is not a Standard and cannot override an applicable Standard. |

Last reviewed: 2026-08-27. Next review due: 2026-12-31.

## References

- `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml`
- `docs/research/ifrs-advanced-2026-08/source-evaluation.md`
- `docs/research/ifrs-advanced-2026-08/verification-manifest.md`
