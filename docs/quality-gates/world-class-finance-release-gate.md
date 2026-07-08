# World-Class Finance Release Gate

Benchmark target: Big 4 finance-transformation deliverable review plus controller-grade close evidence.  
Applies to: reports, templates, examples, SRS/SDS finance sections, proposals, business plans, software acceptance evidence, statutory packs, and audit exports.  
Last verified: 2026-07-08  

This gate supplements `governance/finance-accounting-quality-gate.md`. It is stricter about finished artefact quality, evidence sufficiency, and anti-slop output.

## Release States

| State | Meaning |
|---|---|
| `released` | All blockers cleared, evidence index complete, source-register entries current, reviewer sign-off recorded. |
| `pass-with-caveats` | No accounting damage risk remains, but statutory/current-source/professional-review caveats remain visible. Internal or draft use only unless reviewer approves caveated external release. |
| `blocked` | One or more release blockers remain. Do not publish, file, post to production, or represent as final. |

## P0 Blockers

| ID | Blocker | Pass/fail test |
|---|---|---|
| WC-001 | No framework stated | Every artefact states IFRS, IFRS for SMEs, IPSAS, local statutory basis, donor basis, or not applicable. |
| WC-002 | No source register | Final statutory, payroll, tax, FX, EFRIS, NSSF, PAYE, VAT, WHT, LST, or filing value lacks current source key and reviewer route. |
| WC-003 | No evidence chain | A report figure cannot drill to account, journal, source document, evidence file, and audit log. |
| WC-004 | Unbalanced or direct ledger posting | Any posted journal fails double-entry or bypasses posting service. |
| WC-005 | Control account not reconciled | Bank, cash, mobile money, POS clearing, AR, AP, inventory, payroll, tax, or grant control account lacks tie-out or exception owner. |
| WC-006 | Generic narrative | Commentary could fit any entity, any month, or any sector without changing facts. |
| WC-007 | Hidden caveat | Statutory, framework, donor, source, or judgement caveat appears only in a footnote or is omitted. |
| WC-008 | Missing reviewer | Release-grade output lacks preparer and reviewer identity, role, date, and assertion. |
| WC-009 | Template not executable | A template lacks required inputs, evidence fields, release status, and sign-off fields. |
| WC-010 | Example not reproducible | A worked example lacks source event, journal/report impact, reconciliation, and acceptance test. |

## Evidence Sufficiency

| Area | Minimum evidence |
|---|---|
| Source values | Source key, URL/path, access date, reviewer, recheck date, state. |
| Journals | Event ID, idempotency key, balanced lines, account mapping, period state, evidence ID. |
| Reconciliations | Book balance, external statement/source balance, reconciling items, unresolved items, owner, ageing. |
| Controls | Trigger, owner, mechanism, cadence, evidence, exception route. |
| Judgements | Alternatives considered, selected treatment, rejected alternatives, reviewer route, caveat. |
| Management commentary | Quantified driver, business meaning, action owner, due date. |

## Anti-Slop Tests

An artefact fails when it contains:

- Phrases like "it is important to note", "robust framework", "streamlined process", or "enhanced visibility" without a specific control, metric, or evidence item.
- Tables with empty meaning: rows that restate headings instead of performing a calculation, decision, or control.
- "Timing variance" with no date, owner, expected reversal, or cash impact.
- Statutory rates stated without source key and review state.
- Accounting explanations that skip the business-language layer for non-accountant users.
- Examples that do not include a failure mode.

## Final Reviewer Checklist

| Check | Reviewer assertion |
|---|---|
| Framework | I can identify the accounting/reporting basis in the first screen/page. |
| Source currency | I can see which values are current, blocked, or caveated. |
| Drilldown | I can trace a sample figure to source evidence without asking the preparer. |
| Reperformance | I can recompute key totals from the pack. |
| Controls | I can see who owns exceptions and what blocks release. |
| Plain language | A non-accountant decision-maker can understand the outcome and required action. |
| Specialist layer | An accountant/auditor can see technical treatment, policy basis, and review caveats. |

## See Also

- `governance/anti-slop-finance-output.md`
- `governance/finance-accounting-quality-gate.md`
- `docs/source-registers/ifrs-tax-statutory-2026.md`
- `tests/accounting-invariants/README.md`
