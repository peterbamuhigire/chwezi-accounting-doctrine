# Chwezi Accounting Doctrine Agent Guide

## Universal agent integration

See `.skills-engine/engine-manifest.yaml` for the declarative contract used by the optional universal coordination package. The router and domain SKILL.md files remain authoritative.

The package may read the router, discover skills, inspect Git, and run only declared checks. Missing evidence is NOT ASSESSED; writes, pulls, publication, submissions, ledger/filing changes, deployment, or control changes require explicit approval.

## Mandatory Digital Research currentness gate for Kaizen

Every Kaizen audit, skill edit, reference update, validator change, and
standardisation decision MUST begin with the Digital Research Engine at
`C:\wamp64\www\digital-research-engine`. Read its `source-evaluation` and
`source-verification` skills and the currentness gate reference
`docs/continuous-improvement/kaizen-currentness-gate.md`.

Before admitting any standard, policy, law, technology, platform capability,
software version, command, security control, benchmark, or lifecycle claim,
record source scope, publication/version date, access date, freshness class,
review date, support status, and uncertainty. Use current authoritative
primary sources; quarantine stale/ambiguous/unsupported claims and mark them
`NOT_ASSESSED`. Books are durable concept inputs only.

This is the model-neutral discovery and operating entry point for this
repository. Read it before using a specialist skill; the accounting doctrine
remains the authority for finance content and controls.

## Read first

1. `README.md` for scope, reporting-basis hierarchy, boundaries, and release
   states.
2. `doctrine/accounting-finance-doctrine.md` for the canonical finance doctrine.
3. `governance/finance-accounting-quality-gate.md` for release-blocking controls.
4. The applicable `skills/**/SKILL.md` and its directly linked references.
5. `doctrine/source-register/` for mutable statutory, tax, payroll, and FX
   source state. Draft, stale, superseded, and no-source-found entries cannot
   support final statutory output.

## Discovery and validation

- Discover active skills from the filesystem under `skills/`; do not infer the
  catalogue from a manually repeated count.
- Use `docs/router-map.md` for human navigation. Rebuild and check it with
  `tools/update-router-map.ps1`.
- Run `tools/validate-doctrine.ps1 -Strict` for the principal structural gate.
- Run `tests/accounting-invariants/scripts/Test-AccountingInvariants.ps1` for
  deterministic ledger, source-state, duplicate, reversal, and evidence cases.
- Treat structural, behavioural, render, system, and production evidence as
  separate categories. If a check cannot run, record `NOT ASSESSED`.

## Working rules

- Preserve existing user edits and inspect `git status` before editing.
- Keep canonical instructions model-neutral and capability-based. Runner-specific
  instructions belong only in a thin adapter.
- Never invent a rate, threshold, source, reviewer, organisation, URL, quote, or
  successful test result. Mark missing evidence as a gap.
- Do not promote a source-register entry from draft to current without verified
  evidence and the required reviewer.
- Posted history is immutable; corrections use linked reversal or correction
  postings. Do not bypass posting, period, approval, evidence, or segregation
  controls.
- Use fictional or explicitly test-labelled data in fixtures.
- Do not commit, push, fetch, pull, reset, or delete broadly as part of routine
  repository work.

## Handoff

Route current or uncertain external claims through the Digital Research Engine.
Route visual and presentation authority to the Design System Engine. Keep
accounting content, ledger invariants, source-state semantics, and finance
control evidence in this repository.

## PORTFOLIO CRAFT CONTRACT

Load `C:\wamp64\www\chwezi-engine-agents\docs\operations\portfolio-craft-standard-2026-09-04.md` when available. Build finance work in bounded, reconciled slices: frame the reporting or control decision, select one transaction flow or statement area, inspect the applicable doctrine and source state, make the smallest reversible change, exercise normal, exception, reversal, and approval paths, reconcile the result, refine, and record evidence. Do not generate a complete ledger, model, or finance module as an opaque batch. Apply `Observe -> Baseline -> Select -> Experiment -> Check -> Standardise -> Teach -> Re-measure` to kaizen itself. Missing source, reviewer, reconciliation, control, audit-trail, or runtime evidence is `NOT ASSESSED`, never a pass.
