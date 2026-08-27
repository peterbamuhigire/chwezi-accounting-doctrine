# Advanced IFRS Engine Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the Chwezi Accounting Doctrine engine ready for advanced full-IFRS analysis, IFRS 18 reporting review, consolidation review, and source-governed financial-statement analysis.

**Architecture:** Add focused specialist skills and reusable workpaper/reference artefacts, deepen the existing deferred IFRS 9/16/IAS 36 routes, and connect all new coverage to a deterministic readiness checker. Keep the accounting doctrine, source-register semantics, ledger invariants, human reviewer gates, and Digital Research evidence rules as the control spine.

**Tech Stack:** Markdown skill contracts, YAML source evidence, PowerShell repository validators, PowerShell/fixture tests, filesystem-derived router map, Git.

**Spec:** `docs/superpowers/specs/2026-08-27-advanced-ifrs-engine-design.md`

## Global Constraints

- Full IFRS and IFRS for SMEs remain separate reporting bases; neither is silently substituted for the other.
- The engine provides analysis, decision support, workpapers, routing, and evidence structures; it does not replace licensed IFRS Standards, professional judgement, audit opinion, statutory sign-off, or human reviewer.
- Current or amended-standard claims are admitted only through Digital Research source evaluation and verification; unresolved claims remain qualified or blocked.
- No source-register entry is promoted to `verified-current` without the existing reviewer and archive controls.
- No posted history, live ledger, user permission, tax filing, or production configuration is changed by this work.
- No completion, compliance, or readiness claim is made without fresh validator evidence.

---

### Task 1: Capture the approved scope and current IFRS evidence

**Files:**
- Create: `docs/research/ifrs-advanced-2026-08/source-evaluation.md`
- Create: `docs/research/ifrs-advanced-2026-08/verification-manifest.md`
- Create: `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/00-scope-and-evidence.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/01-baseline-scorecard.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/02-improvement-backlog.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/03-experiment-log.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/04-validation-record.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/05-final-report.md`
- Create: `docs/kaizen/2026-08-27-advanced-ifrs/06-next-cycle.md`

**Interfaces:**
- Consumes: Approved design spec, official IFRS Foundation pages checked on 2026-08-27, existing source-register schema, Digital Research source-evaluation/source-verification rules, Kaizen research loop.
- Produces: immutable source-evaluation records, verification states, and a reproducible baseline/backlog consumed by later skills and release evidence.

- [ ] **Step 1: Record primary-source evaluations**

  Record official IFRS Foundation source IDs and URLs for the Conceptual Framework, IFRS 7–18 as applicable, IAS 7, IAS 10, IAS 16, IAS 23, IAS 36, and IAS 37. For each, record source tier, provenance, date accessed, supported claim scope, limitations, and human-review status. Do not copy extensive Standard text.

- [ ] **Step 2: Record verification manifest**

  Use explicit claim states `supported`, `synthesis`, `inference`, `unsupported`, or `no-source`, with source ID lists, locators, access date, and verifier status. Keep claims about effective dates and standard summaries separate from implementation inferences.

- [ ] **Step 3: Record the Kaizen baseline and backlog**

  Score the ten dimensions from the full Kaizen prompt using evidence or `NOT ASSESSED`, publish the capped baseline, identify the advanced-IFRS depth gap, and define one reversible improvement experiment with guardrails for source coverage, invariant preservation, and reviewer routing.

- [ ] **Step 4: Run source-register shape validation**

  Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-source-register.ps1 -RepoRoot . -Json`.

  Expected: exit code 0; any source entry pending human review remains visibly blocked or caveated and is not promoted silently.

### Task 2: Add the Conceptual Framework and IFRS 18 specialist routes

**Files:**
- Create: `skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/SKILL.md`
- Create: `skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/references/conceptual-framework-decision-tree.md`
- Create: `skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/references/judgement-and-materiality-workpaper.md`
- Create: `skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/examples/no-specific-standard-policy.md`
- Create: `skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/SKILL.md`
- Create: `skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/references/ifrs-18-review-matrix.md`
- Create: `skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/references/mpm-reconciliation-workpaper.md`
- Create: `skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/examples/ifrs-18-transition-and-mpm.md`

**Interfaces:**
- Consumes: Reporting-basis memo, reporting date, draft statements, policy/judgement log, MPM inventory, source verification manifest.
- Produces: framework decision memo, IFRS 18 review matrix, MPM workpaper, disclosure exceptions, and reviewer route.

- [ ] **Step 1: Write contract-complete skill files**

  Each SKILL.md must include frontmatter, prerequisites, inputs, outputs, decision rules, acceptance evidence, anti-patterns, files, review metadata, and `## Evidence Produced`. Include the official IFRS source IDs without presenting this skill as licensed Standard text.

- [ ] **Step 2: Add transition and MPM fixtures**

  Cover current-period basis selection, 2027 transition/early-application states, required subtotals, operating/investing/financing classification, comparatives, aggregation/disaggregation, MPM reconciliation, and an IAS 1-only blocker.

- [ ] **Step 3: Run local structural validation**

  Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-skill-contracts.ps1 -RepoRoot . -Strict -Json`.

  Expected: exit code 0 and no missing declared references after the new files are registered.

### Task 3: Deepen core and specialised IFRS machinery

**Files:**
- Modify: `skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md`
- Create: `skills/02-ifrs-core-standards/ifrs-financial-instruments/references/advanced-ifrs9-classification-and-ecl.md`
- Create: `skills/02-ifrs-core-standards/ifrs-financial-instruments/examples/advanced-ifrs9-ecl-and-hedge-routing.md`
- Modify: `skills/02-ifrs-core-standards/ifrs-leases/SKILL.md`
- Create: `skills/02-ifrs-core-standards/ifrs-leases/references/advanced-ifrs16-lessee-workpaper.md`
- Create: `skills/02-ifrs-core-standards/ifrs-leases/examples/lease-modification-and-reassessment.md`
- Modify: `skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md`
- Create: `skills/03-ifrs-specialised-standards/ias-impairment/references/advanced-ias36-cgu-and-viu-workpaper.md`
- Create: `skills/03-ifrs-specialised-standards/ias-impairment/examples/goodwill-cgu-sensitivity.md`
- Modify: `skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md`
- Create: `skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/advanced-ifrs15-judgement-matrix.md`
- Create: `skills/02-ifrs-core-standards/ifrs-revenue-recognition/examples/variable-consideration-and-modification.md`
- Modify: `skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md`
- Modify: `skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md`
- Modify: `skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md`
- Modify: `skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md`
- Modify: `skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/SKILL.md`
- Modify: `skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md`

**Interfaces:**
- Consumes: Existing specialist contracts and references, official source register, conceptual-framework route.
- Produces: advanced technical decision matrices and workpapers that downstream consolidation, disclosure, and analysis routes can consume.

- [ ] **Step 1: Remove stale deferred-scope wording**

  Replace “full IFRS deferred” language in IFRS 9, IFRS 16, and IAS 36 with advanced coverage plus explicit model-risk, data, and reviewer gates. Preserve the distinction between doctrine coverage and client-release approval.

- [ ] **Step 2: Add advanced workpapers and failure paths**

  Add decision rules for IFRS 9 classification/SPPI/ECL/hedging, IFRS 16 lease term/discount/reassessment/modification, IAS 36 CGUs/goodwill/VIU/sensitivity, and advanced IFRS 15 judgements. Extend linked standards with compact advanced checks for IFRS 13, IAS 37, IAS 16, IAS 10, IAS 7, and IAS 23.

- [ ] **Step 3: Validate changed skills**

  Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-skill-contracts.ps1 -RepoRoot . -Strict -Json` and inspect the changed files for remaining contradictory deferred claims.

### Task 4: Add advanced consolidation, interests, and published-statement analysis routes

**Files:**
- Create: `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md`
- Create: `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/references/consolidation-review-matrix.md`
- Create: `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/references/interests-in-other-entities-disclosure-workpaper.md`
- Create: `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/examples/control-nci-joint-arrangement-review.md`
- Create: `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md`
- Create: `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/references/analysis-metric-and-risk-workpaper.md`
- Create: `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/references/audience-advice-matrix.md`
- Create: `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/examples/published-statement-review.md`

**Interfaces:**
- Consumes: entity hierarchy, control evidence, trial balances, intercompany match report, consolidation journals, draft statements/notes, published annual report, source/evidence manifest, and audience context.
- Produces: consolidation review memo, adjustment/disclosure register, analysis workpaper, audience-specific advice, and unresolved-issue/reviewer route.

- [ ] **Step 1: Implement consolidation review contract**

  Require control analysis before consolidation, joint-control/significant-influence classification, NCI, investment-entity exception, IFRS 12 risk/disclosure coverage, IFRS 7 risk linkage, and immutable local-ledger/elimination traceability.

- [ ] **Step 2: Implement published-statement analysis contract**

  Separate extracted facts, calculations, analyst inference, and recommendations. Include earnings quality, cash conversion, leverage/liquidity, covenant and funding risk, valuation/impairment sensitivity, revenue/lease/segment risk, MPMs, policy choices, restatements, and disclosure quality.

- [ ] **Step 3: Add worked fixtures**

  Use fictional/test-labelled entities and amounts only. Include at least one unresolved evidence path and one conclusion that must be narrowed because the source does not support it.

### Task 5: Add a deterministic advanced-IFRS readiness checker using TDD

**Files:**
- Create: `tests/advanced-ifrs/fixtures/minimal-incomplete-engine/`
- Create: `tests/advanced-ifrs/scripts/Test-AdvancedIfRSReadiness.ps1`
- Create: `tools/check-advanced-ifrs-readiness.ps1`
- Modify: `tools/validate-doctrine.ps1`
- Modify: `docs/quality-gate-fixture-map.md`

**Interfaces:**
- Consumes: live filesystem, required skill paths, advanced fixture markers, source evidence, and stale deferred-scope scans.
- Produces: JSON readiness result with required coverage, missing paths, stale-scope findings, evidence gaps, and exit status suitable for the root validator.

- [ ] **Step 1: Write the failing test**

  Create a test that invokes `tools/check-advanced-ifrs-readiness.ps1` against `tests/advanced-ifrs/fixtures/minimal-incomplete-engine` and asserts a non-zero exit plus findings for missing IFRS 18, Conceptual Framework, consolidation review, and published-analysis routes. The test must fail before the checker exists.

- [ ] **Step 2: Run the test and record the expected failure**

  Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\tests\advanced-ifrs\scripts\Test-AdvancedIfRSReadiness.ps1`.

  Expected: non-zero because the checker is not yet implemented.

- [ ] **Step 3: Implement the minimal checker**

  Check required live skill paths, required evidence sections, fixture presence, and forbidden stale phrases such as `full IFRS.*deferred` in the upgraded skills. Emit machine-readable JSON and return 1 on missing coverage or stale scope.

- [ ] **Step 4: Run the test and verify green**

  Run the same test. Expected: the incomplete fixture fails with the intended findings, and a live-repository invocation exits 0 after all implementation files exist.

- [ ] **Step 5: Wire the checker into the root validator**

  Add it to `tools/validate-doctrine.ps1`, preserve JSON output, and map any advanced-IFRS finding to the repository’s normal validation state.

### Task 6: Update routing, documentation, and release evidence

**Files:**
- Modify: `docs/router-map.md` via `tools/update-router-map.ps1`
- Modify: `docs/reference-manifest.md`
- Modify: `docs/analysis/04-skills-matrix.md`
- Modify: `docs/analysis/03-gap-register.md`
- Modify: `docs/analysis/05-roadmap-for-uplift.md`
- Modify: `CHANGELOG.md`
- Create: `docs/release-evidence/advanced-ifrs-2026-08-bundle.md`
- Create: `docs/advanced-ifrs-capability-matrix.md`
- Modify: `README.md` only where live counts and routes are demonstrably stale

**Interfaces:**
- Consumes: completed skills, checker output, source evidence, Kaizen validation record.
- Produces: discoverable routing, accurate counts, capability matrix, release bundle, and handoff documentation.

- [ ] **Step 1: Regenerate router map**

  Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\update-router-map.ps1` and confirm the generated map contains every new skill.

- [ ] **Step 2: Update manifests and matrices**

  Add every created file with correct state/owner/release impact; update counts from filesystem discovery rather than manually guessing.

- [ ] **Step 3: Write release evidence bundle**

  Map correctness, security, data safety, performance, operability, UX quality, and release evidence to concrete artifacts or justified `N/A` entries. Mark human IFRS review and named sign-off as `NOT ASSESSED` or pending where absent.

### Task 7: Run full verification, complete Kaizen record, commit, and push

**Files:**
- Modify: `docs/kaizen/2026-08-27-advanced-ifrs/03-experiment-log.md`
- Modify: `docs/kaizen/2026-08-27-advanced-ifrs/04-validation-record.md`
- Modify: `docs/kaizen/2026-08-27-advanced-ifrs/05-final-report.md`
- Modify: `docs/kaizen/2026-08-27-advanced-ifrs/06-next-cycle.md`

**Interfaces:**
- Consumes: all changed files, fresh validator outputs, Git diff, and source verification evidence.
- Produces: final residual-risk handoff, commit on the requested branch, and pushed `main` state.

- [ ] **Step 1: Run the full validation suite**

  Run, capture outputs, and stop on any failure:

  ```powershell
  .\tools\validate-doctrine.ps1 -Strict
  .\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1
  .\tests\advanced-ifrs\scripts\Test-AdvancedIfRSReadiness.ps1
  .\scripts\fix-frontmatter-report.ps1 -Strict
  git diff --check
  git status --short
  ```

- [ ] **Step 2: Complete the Kaizen validation record**

  Record exact commands, exit codes, findings, changed measures, failed paths, residual risk, no-fabrication limits, and next re-audit date. Do not invent performance results or human sign-offs.

- [ ] **Step 3: Review the complete diff**

  Run `git diff --stat` and `git diff --name-status`; inspect new skills and manifests for unintended edits, placeholder text, stale counts, broken paths, or unsupported claims.

- [ ] **Step 4: Commit the verified changes**

  ```powershell
  git add --all
  git commit -m "feat: add advanced IFRS research and review capabilities"
  ```

- [ ] **Step 5: Push to main**

  Confirm the current branch and remote, then run `git push origin main`. If the branch or remote differs, stop and report the exact state rather than pushing elsewhere.

- [ ] **Step 6: Verify the pushed state**

  Run `git status --short --branch` and `git log -1 --oneline`; confirm the working tree is clean and the pushed commit is the latest local commit. Report any remote verification limitation explicitly.
