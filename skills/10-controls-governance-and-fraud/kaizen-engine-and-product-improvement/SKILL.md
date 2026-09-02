---
name: kaizen-engine-and-product-improvement
description: Use when auditing or improving the finance doctrine engine or any accounting, control, reporting, tax, budget, reconciliation, or finance-system product it produces.
metadata:
  portable: true
  compatible_with:
  - claude-code
  - codex
---

# Kaizen Engine and Product Improvement
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com.

Last reviewed: 2026-08-04
Next review due: 2026-11-04

<!-- dual-compat-start -->
## Use When

- Auditing this doctrine engine or a finance/accounting artefact, control, report, model, integration, or system.
- Turning close, reconciliation, control, audit, incident, user, or reviewer findings into a tested standard improvement.

## Do Not Use When

- A single skill safety or statutory-source check is sufficient.
- Current IFRS, tax, statutory, or regulatory claims have not been routed through current source registers and verification.

## Prerequisites

Read the accounting-finance doctrine, finance release gate, applicable source register, and the Digital Research Skills Engine source-evaluation and source-verification skills.

## Inputs

| Artefact | Source/provider | Required? | Purpose | If absent |
|---|---|---:|---|---|
| Scope/reporting basis, source register, transaction/control evidence, product type, current score, risks, reviewer, and target | Finance project and doctrine | yes | Set audit scope and improvement target | Stop or mark unassessed |

## Workflow

1. Read the local adoption plan, doctrine, quality gate, and portfolio standard.
2. Inventory doctrine, skills, source registers, control matrices, examples, invariants, tests, and cross-engine routes.
3. Score each applicable dimension and product type. Publish `min(raw score, 65)`; never use the cap to waive a control failure.
4. Audit accounting correctness, completeness, cut-off, reconciliation, controls, segregation of duties, privacy/security, explainability, usability, evidence, and handoff.
5. Write a 95/100 remediation plan with owner, root cause, experiment, acceptance evidence, residual risk, and rollback.
6. Run a small control/process improvement. If evidence or controls fail, stop, recover the safe state, and re-perform.
7. Standardise only after evidence; update doctrine/reference/fixture/test, re-test, and schedule re-audit.

## Outputs

| Artefact | Consumer | Acceptance condition |
|---|---|---|
| Capped audit scorecard, control/evidence gap register, 95/100 plan, experiment result, and residual-risk decision | Controller, reviewer, and release owner | Evidence, owner, control impact, acceptance proof, rollback, and next review are explicit |

## Evidence Produced

| Evidence | Format | Acceptance condition |
|---|---|---|
| Source checks, invariants, re-performance, report rebuild, independent review, and residual-risk record | Validator output, workpaper, or evidence pack | Another reviewer can reproduce the conclusion and verify the control remained effective |

<!-- dual-compat-end -->
## Capability Contract

Read and search are required. Audits are read-only by default; posting, control, source, or production changes require explicit authority and permission. Route current facts to Digital Research.

## Degraded Mode

If the source register, transaction population, control evidence, reviewer, or validator is unavailable, return a qualified result, mark the gap not assessed, and do not certify compliance or release readiness.

## Decision Rules

| Condition | Action | Failure or risk avoided |
|---|---|---|
| A control objective would be removed to save time | Reject and redesign for waste reduction | Misstatement or fraud |
| A posting or report change lacks re-performance | Stop, test invariants, and rebuild | Silent accounting drift |
| A change passes controls and independent review | Standardise it and schedule re-audit | Repeated exceptions |

## Acceptance Evidence

Run the doctrine validator, source-register checks, accounting invariants, finance release gate, changed-skill validation, and independent controller review. Record residual risk and the next review date.

## Quality Standards

Finance doctrine remains authoritative. Kaizen cannot weaken period locks, audit trails, segregation of duties, reconciliation, statutory verification, privacy, or approval controls. A faster process that increases misstatement or fraud risk is a failed experiment.

## Mandatory 65-to-95 gate

The first pass is an initial analysis, not a certification: calculate the raw result,
publish `min(raw_score, 65)`, and keep control failures and unassessed evidence
separate from the score. Only then may a reversible improvement cycle target 95/100.
Each proposed change must state its root cause, control guardrail, owner, measure,
stop/rollback rule, re-performance evidence, residual risk, and re-audit date.
Run the gate at engine level (doctrine, skills, controls, references, validators,
and handoffs) and product level (report, reconciliation, budget, control, or finance
system). A product cannot inherit a passing result from the engine.

## Anti-Patterns

- Treating lean as fewer controls. Fix: remove waste, not control objectives.
- Changing a posting rule without re-performance. Fix: run invariants and report rebuilds.
- Using historical book claims as current statutory facts. Fix: use dated source registers.
- Closing remediation without residual-risk owner. Fix: keep open or formally accept.
- Hiding exceptions in a score. Fix: record blockers separately.

## Worked Example

If a reconciliation workaround removes a repeated manual step but weakens the audit trail, reject the change, retain the control, and test an automated evidence-preserving alternative.

## Mandatory Digital Research currentness gate

Every Kaizen cycle must begin with `digital-research-skills` source evaluation
and source verification. Record scope, dates, freshness class, support status,
uncertainty, and review date for current IFRS, tax, statutory, regulatory,
technology, control, and lifecycle claims; quarantine unsupported claims as
`NOT_ASSESSED`. Apply the [portfolio Kaizen currentness gate](../../../../digital-research-skills/docs/continuous-improvement/kaizen-currentness-gate.md).

## References

- [Local adoption plan](../../../docs/continuous-improvement/kaizen-adoption-2026-08.md)
- Portfolio standard: resolve `digital-research-skills` through the global engine-routing table and read its `docs/continuous-improvement/portfolio-kaizen-standard-2026-08.md`.
- [Book-driven value, cash, and working capital](../../../doctrine/references/book-driven-value-cash-and-working-capital.md) - durable finance synthesis and current IFRS/source gate.
- [Book-driven Kaizen Wave 3](references/book-driven-kaizen-wave-3-2026-09-02.md) - metric lineage, exception evidence, change control, segregation, approval, and automation rollback.
- `skills/06-close-consolidation-and-reporting/finance-module-audit/`
- `governance/finance-accounting-quality-gate.md`
