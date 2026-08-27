# Advanced IFRS Engine Design

**Date:** 2026-08-27  
**Status:** Approved in conversation; implementation pending  
**Scope:** Chwezi Accounting Doctrine skill engine

## Goal

Extend the engine from broad, mostly active IFRS coverage into a source-aware,
reviewer-routable advanced IFRS capability for full IFRS application, IFRS 18
financial-statement review, sophisticated recognition and measurement
workpapers, consolidation and interests in other entities, management advice,
and analysis of published IFRS financial statements.

## Design choice

Use a layered capability pack rather than one monolithic “IFRS expert” skill.
The pack will preserve the existing framework hierarchy, posting invariants,
source-register gates, reviewer accountability, and skill-router architecture.
It will add focused skills and shared workpaper patterns, and deepen existing
skills where their current text explicitly defers advanced machinery.

## Boundaries

- Full IFRS and IFRS for SMEs remain separate reporting bases; neither is
  silently substituted for the other.
- The engine provides analysis, decision support, workpapers, routing, and
  evidence structures. It does not replace the licensed IFRS Standards,
  professional judgement, audit opinion, statutory sign-off, or human reviewer.
- Current or amended-standard claims are admitted only through Digital Research
  source evaluation and verification. Unverified or conflicting claims remain
  qualified or blocked.
- No source-register entry is promoted to `verified-current` without the
  existing reviewer and archive controls.
- No posted history, live ledger, user permission, tax filing, or production
  configuration is changed by this work.

## Components

### 1. Conceptual Framework route

Create a specialist skill for the 2018 Conceptual Framework. It will force an
explicit analysis of objective, reporting entity, qualitative characteristics,
element definitions, recognition and derecognition, measurement basis,
presentation/disclosure, materiality, and policy development when no Standard
directly applies. It will distinguish Framework reasoning from requirements in
an applicable Standard.

### 2. IFRS 18 presentation and MPM route

Create a specialist skill covering the IFRS 18 transition trigger and the
operational review of:

- complete financial statements and comparatives;
- operating, investing, and financing categories;
- operating profit and profit before financing and income taxes subtotals;
- management-defined performance measures, reconciliations, labels, and
  explanations;
- aggregation and disaggregation, line-item mapping, expense presentation,
  accounting-policy information, and cross-statement consistency; and
- transition, issued-not-effective disclosures, and current IASB project
  monitoring.

The existing transition reference remains the framework trigger; the new skill
becomes the substantive review workflow.

### 3. Deepened standards machinery

Upgrade the existing IFRS 9, IFRS 16, IAS 36, IFRS 15, IFRS 13, IAS 37, IAS 16,
IAS 10, IAS 7, and IAS 23 skills with advanced workpapers and failure paths.
The minimum coverage is:

- IFRS 9: classification, SPPI, business model, amortised cost/FVOCI/FVTPL,
  effective interest, derecognition, modification, ECL staging, forward-looking
  information, collateral/guarantees, hedge-accounting routing, and IFRS 7
  risk/disclosure linkage.
- IFRS 16: lease identification, term and options, commencement, ROU and
  liability measurement, discount rates, subsequent measurement, reassessment,
  modifications, sale-and-leaseback, lessor accounting, and disclosure linkage.
- IAS 36: annual and indicator-based tests, CGU allocation, goodwill, VIU
  modelling, FVLCD/FV less costs of disposal, sensitivity, headroom, reversal,
  and disclosure.
- IFRS 15: all five steps, contract combination/modification, variable
  consideration constraint, significant financing, non-cash consideration,
  principal/agent, warranties, licences, contract costs, progress measures,
  and disclosures.
- IFRS 10–12 / IAS 28 / IFRS 11: control assessment, structured entities,
  investment-entity exception, consolidation adjustments, NCI, joint-control
  classification, equity method, summarised financial information, restrictions,
  commitments, and risk disclosures.
- IFRS 13 / IAS 37 / IAS 16 / IAS 10 / IAS 7 / IAS 23: valuation hierarchy and
  inputs, obligation probability and discounting, componentisation and
  derecognition, adjusting/non-adjusting events, cash-flow classification and
  reconciliation, and qualifying-asset capitalisation.

### 4. Consolidated-statements review route

Create an advanced review skill that consumes entity profiles, group structure,
trial balances, consolidation journals, intercompany matches, policy and
judgement logs, and draft statements. It will produce a consolidation review
memo, adjustment register, disclosure matrix, unresolved-issue log, and
reviewer routing record. It will not modify local ledgers to force agreement.

### 5. Published-statement analysis route

Create a specialist analysis skill for management, audit committees, investors,
and regulators. It will separate extracted facts, calculated metrics, analyst
inferences, and recommendations. It will cover earnings quality, cash
conversion, leverage, liquidity, covenant risk, impairment and valuation
sensitivity, revenue concentration, lease leverage, segment economics, MPMs,
accounting-policy choices, restatements, and disclosure quality, with source and
period traceability.

### 6. Digital Research and Kaizen evidence layer

Add a dated IFRS source-evaluation record using official IFRS Foundation pages
and the 2026 issued-standards corpus as the primary source class. Add a
source-verification manifest structure, currentness/uncertainty states, and a
Kaizen cycle record with baseline, hypothesis, reversible experiment, guardrail,
result, standardisation decision, and next re-measurement.

### 7. Routing and validation

Update the filesystem-derived router map, reference manifest, skill matrix,
release evidence bundle, advanced IFRS fixture set, and deterministic tests.
Changed specialist skills will declare concrete evidence produced. The final
validation record will distinguish structural, behavioural, research/source,
and human-review evidence; unavailable human review remains `NOT ASSESSED`.

## Data and evidence flow

```text
engagement scope + reporting basis
        -> source evaluation and currentness gate
        -> standard/Framework route selection
        -> fact, judgement, estimate, and inference separation
        -> workpaper / adjustment / disclosure / analysis artefact
        -> reconciliation and cross-statement consistency checks
        -> reviewer route and unresolved-issue log
        -> release evidence bundle
```

Every material conclusion must carry the applicable framework, reporting date,
source identifiers, evidence locator, confidence/uncertainty state, preparer,
reviewer route, and caveat. A conclusion with missing required evidence is not
release-ready.

## Acceptance criteria

1. All new skills pass the repository skill contract and local link checks.
2. The router map and reference manifest contain every new path.
3. No existing advanced-scope skill still says its listed full-IFRS machinery
   is deferred where this design says it is covered.
4. Fixtures exercise at least one correct path and one blocked, judgemental, or
   evidence-deficient path for each new route.
5. Consolidation fixtures prove local-ledger immutability, elimination trace,
   NCI/interest classification routing, and unresolved mismatch visibility.
6. IFRS 18 fixtures prove transition routing, required subtotal checks, MPM
   reconciliation, comparative handling, and IAS 1-only blocker behaviour.
7. Research records identify official primary sources, access date, source tier,
   verification status, limitations, and human-review gap where applicable.
8. Kaizen evidence records reproducible baselines and guardrails; no invented
   performance improvement is reported.
9. `tools/validate-doctrine.ps1 -Strict` and the accounting invariant suite pass.
10. Final handoff states residual risks explicitly and does not certify IFRS
    compliance without named professional review.

## Risks and controls

| Risk | Control |
|---|---|
| Treating summaries as the Standard | Link each technical rule to the official source and require paragraph-level review when client output is prepared. |
| IFRS 18 transition confusion | Separate current-period basis, issued-not-effective, early application, and mandatory application states. |
| Overclaiming “full IFRS” | Keep caveats, reviewer gates, source currentness, and licensed-text boundary explicit. |
| Wrong consolidation method | Require control/joint-control/significant-influence evidence before method selection. |
| Model-driven false precision | Expose assumptions, sensitivity, uncertainty, and independent review for valuation/ECL/VIU outputs. |
| Kaizen reducing controls | Reject experiments that weaken posting, approval, immutability, reconciliation, SoD, or evidence. |

## Research basis captured for implementation

Primary IFRS Foundation pages checked on 2026-08-27 include the Conceptual
Framework, IFRS 18, IFRS 9, IFRS 10, IFRS 11, IFRS 12, IFRS 13, IFRS 15, IFRS 16,
IAS 7, IAS 23, IAS 36, IAS 37, IFRS 7, and IFRS 8. The official IFRS 18 page
states the 1 January 2027 effective date, earlier application permission, new
profit-or-loss subtotals, MPM disclosures, and aggregation/disaggregation
principles. These are research inputs, not a substitute for the licensed
Standard text or reviewer sign-off.
