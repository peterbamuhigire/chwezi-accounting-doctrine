# Advanced IFRS Capability Matrix

This matrix maps the requested advanced IFRS outcomes to active doctrine
routes, concrete evidence, and release conditions. It describes capability of
the doctrine engine; it is not an audit opinion, a substitute for entity data,
or a named reviewer sign-off.

| Requested capability | Active route | Evidence | Release condition |
|---|---|---|---|
| Conceptual Framework and technical judgements | `skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/SKILL.md` | Decision tree, materiality workpaper, no-specific-Standard example | Framework selection, facts, policy hierarchy, materiality and reviewer conclusion must be documented. |
| Consolidated statements and IFRS 18 | `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md`; `skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/SKILL.md` | Consolidation matrix, IFRS 12 workpaper, IFRS 18 matrix and MPM reconciliation | Control/effective-date conclusions and final presentation require entity evidence and reviewer approval. |
| Revenue under IFRS 15 five-step model | `skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md` | Advanced judgement matrix and variable-consideration/modification example | Contract facts, constraint, principal/agent, allocation and timing conclusions must be supported. |
| Financial instruments under IFRS 9 and IFRS 7 | `skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md` | Classification/ECL workpaper and ECL/hedge example | Business model, SPPI, data, forward-looking assumptions and risk disclosures require validation. |
| Leases under IFRS 16 | `skills/02-ifrs-core-standards/ifrs-leases/SKILL.md` | Lessee workpaper and modification/reassessment example | Contract population, term, options, discount rate and modification evidence are required. |
| Interests in other entities under IFRS 10/11/12 | `skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md` | Control/NCI/joint-arrangement example and disclosure workpaper | Legal agreements, decision rights, returns, restrictions and structured-entity facts are required. |
| IAS 36 impairment and IFRS 13 fair value | `skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md`; `skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md` | CGU/VIU workpaper, goodwill sensitivity example, fair-value handoff | Forecasts, valuation inputs, hierarchy, sensitivities and independent valuation review must be evidenced. |
| IAS 37, IAS 16 and IAS 10 | Existing specialised/core routes with advanced review handoffs | Obligation/probability, componentisation/derecognition, and event-log evidence requirements in each route | Facts, estimates, discounting, component records, and post-reporting-period evidence require review. |
| IAS 7 and IAS 23 | Existing cash-flow and borrowing-cost routes with advanced review handoffs | Source-based classification/reconciliation and qualifying-asset capitalization evidence requirements | Cash reconciliation, non-cash items, borrowing pools, suspension and cessation must tie to records. |
| IFRS 8 segment reporting from CODM perspective | `skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/SKILL.md`, linked by the consolidation/analysis routes | Existing IFRS 8 route plus CODM-oriented analysis and disclosure handoff | Internal reports, CODM identity, aggregation, reconciliations and major-customer/geography data required. |
| Management, audit committee, investor and regulator advice | `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md` | Audience advice matrix and published-statement review example | Separate facts, calculations, inferences and advice; label uncertainty and avoid assurance or investment claims. |
| New/amended standards, materiality and IFRS 18 MPMs | Conceptual Framework and IFRS 18 routes | Source register, transition example, MPM reconciliation workpaper | Current source verification, transition assessment, reconciliations and human IFRS review required. |
| Published IFRS statement analysis | `skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md` | Metric/risk workpaper, source-backed statement review example | Primary statements must reconcile to notes and claims must be traceable to the published source. |

## Readiness controls

- `tools/check-advanced-ifrs-readiness.ps1` checks all 14 in-scope routes for
  existence, decision rules, evidence output, review metadata, and explicit
  deferred-scope language.
- `tests/advanced-ifrs/scripts/Test-AdvancedIfRSReadiness.ps1` proves the
  checker rejects an incomplete fixture and passes the live repository.
- `doctrine/source-register/ifrs/ifrs-advanced-2026.yaml` records the official
  IFRS source basis. Entries are intentionally `draft` until a named human IFRS
  reviewer verifies and archives the source captures.

## Boundary

The engine can structure sophisticated IFRS analysis and evidence packs. It
must not present a client-specific accounting conclusion, statutory filing,
audit assurance, legal conclusion, or investment recommendation as final until
the required current sources, entity evidence, calculations, approvals, and
reviewer sign-offs are present.

Last reviewed: 2026-08-27. Next review due: 2026-12-31.
