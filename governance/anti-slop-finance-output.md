# Anti-Slop Finance Output Governance

Applies to: every Chwezi Core Systems accounting, finance, tax, statutory, reporting, control, template, example, and client-facing finance artefact.  
Benchmark target: top-tier controller, Big 4, and specialist finance-transformation output.  
Last verified: 2026-07-08  

## Output Standard

Finance output must be specific, evidenced, framework-aware, and decision-useful. It must read like work a competent accountant, controller, auditor, or finance transformation lead would sign, not like generic advisory prose.

## Required Layers

| Layer | Required content |
|---|---|
| Business layer | What happened, why it matters, cash/reporting/control impact, owner, next action. |
| Accounting layer | Framework, recognition/measurement/presentation/disclosure treatment, journal/report impact. |
| Evidence layer | Source documents, source-register keys, reconciliations, audit log, reviewer sign-off. |
| Caveat layer | Statutory, source, judgement, donor, framework, or system limits stated visibly. |

## Banned Patterns

- Generic benefits language: "improves transparency", "enhances efficiency", "robust controls", unless followed by a concrete control, metric, evidence item, and pass/fail rule.
- Unowned recommendations: every recommendation needs owner role, evidence, due date or trigger, and release impact.
- Unverifiable claims: no "current", "compliant", "audit-ready", or "statutory-ready" claim without source date and reviewer state.
- Hidden judgement: no blending facts, estimates, policy choices, and management assumptions in the same sentence.
- Report-only reconciliation: reconciliation must be a control workflow with exceptions, not a static download.
- Hardcoded live values: no VAT, PAYE, WHT, NSSF, LST, EFRIS, exchange-rate, return-template, or filing deadline value without source key.
- Summary-only dashboards: every figure must have drilldown or documented source limitation.

## Required Writing Moves

1. Start with the entity, period, framework, and release state.
2. Name the source of every volatile value.
3. Quantify material movements and variances.
4. Explain cause, impact, and action separately.
5. Use tables for calculations, reconciliations, sign-offs, and evidence; use prose for judgement.
6. State caveats where the user will see them before relying on the output.
7. End release-grade artefacts with reviewer assertions, not generic conclusions.

## Example Rewrite

Weak:

> The finance process should be improved to enhance transparency and ensure compliance.

Chwezi standard:

> Store KLA-01 card settlement clearing has UGX 94,400 of provider fees supported by gateway batch VISA-KLA01-20260630 and bank line BNK-20260630-08. The clearing account reaches zero after JE-003. Controller review is complete for management reporting; VAT return release remains blocked until the `UG-VAT-STANDARD-RATE` source key is refreshed for the filing period.

## Release Gate

## Machine-error editorial gate (ME1-ME7)

Apply Digital Research's dated machine-error gate to finance narratives, control explanations,
management commentary, and audit findings:

| ID | Finance adaptation |
|---|---|
| ME1 | Does the sentence add a different balance, variance, control result, or decision? |
| ME2 | Is a balanced comparison supported by the accounting basis, or is it decorative symmetry? |
| ME3 | Can the reviewer act from the existing note without another restatement? |
| ME4 | Does the wording exceed the evidence, period, reporting basis, or reviewer state? |
| ME5 | Is the example tied to the entity, account, period, source key, or journal? |
| ME6 | Has the same advisory phrase become a repeated finance-reporting mannerism? |
| ME7 | Does the paragraph add a reconciliation result, control judgement, assumption, or release consequence? |

Do not remove repeated ledger lines, source keys, reconciliation fields, or control assertions when
they preserve auditability. Record the functional reason. Cut narrative repetition that adds no new
financial evidence or decision.

### Impeccable-derived AS overlay

Apply AS1-AS7 to dashboards, board packs, presentations, and rendered finance outputs. In finance
narrative use AS1, AS3, AS5, and AS6; mark visual checks `not_applicable` when no rendered artifact
is in scope.

| ID | Finance overlay test |
|---|---|
| AS1 | Is the reporting layout, colour, type, or copy pattern justified by the entity and decision? |
| AS2 | Do badges, hero metrics, chips, or section numbers clarify a control/result or decorate it? |
| AS3 | Do repeated tables/cards distinguish balances, movements, and controls rather than clone a template? |
| AS4 | Does motion, glow, or gradient communicate a real changing status or control state? |
| AS5 | Are examples, assets, and figures tied to entity, period, source key, and reporting basis? |
| AS6 | Are buzzwords, em-dash cadence, aphoristic contrasts, and theatrical framing absent from judgement? |
| AS7 | Is the rendered output readable, contrasted, complete, and free of hidden or clipped evidence? |

Purple gradients, glassmorphism, neon glow, AI-beige defaults, decorative editorial scaffolding,
and decorative motion are no-ship choices for visual finance outputs. Preserve repeated ledger
lines, source keys, reconciliation fields, and control assertions when they preserve auditability.

Use `docs/quality-gates/world-class-finance-release-gate.md` before marking any finance artefact released.
