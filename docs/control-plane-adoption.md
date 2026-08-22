# Control-plane adoption

This doctrine adopts the shared ten-engine contract from
`C:\wamp64\www\skills-web-dev\docs\engine-control-plane.md`. It remains the
source of truth for accounting, IFRS, tax, close, reconciliation, controls,
and finance-system change decisions.

## Local roles and commands

| Role | Responsibility | Segregation rule |
|---|---|---|
| Controller | Own period policy, control interpretation, and release decision. | Must not be sole preparer and approver. |
| Reconciliation reviewer | Tie source, subledger, control account, and report balances. | Independent review for material reconciliations. |
| Audit-evidence collector | Assemble source documents, lineage, approvals, and audit trail. | Never substitutes a claim for a source. |
| Tax-source reviewer | Verify jurisdiction, effective date, statutory source, and calculation basis. | Unverified tax values remain `NOT ASSESSED`. |

Route thin commands `close`, `reconcile`, `audit-pack`, and `period-control` to
canonical doctrine and skills. Mutating commands must be idempotent and reject
or quarantine duplicate events.

## Hook and release contract

- `preflight` confirms entity, period, reporting basis, jurisdiction, actor,
  permissions, and whether the period is open.
- `context` loads authoritative source documents, CoA/mappings, rates, prior
  reconciliations, control state, and approval ledger.
- `before_write` checks double-entry invariants, SoD, idempotency, period
  locks, backup/recovery, and approval requirements.
- `after_write` verifies balances, reconciliation, audit trail, drill-down,
  duplicate rejection, and report consistency.
- `release` requires source register, ledger invariant, reconciliation, and
  approval-ledger evidence plus an independent reviewer where applicable.
- `stop` records period state, unposted or quarantined items, failed controls,
  evidence gaps, and the responsible handoff owner.

Direct writes to posted history, missing approvals, stale statutory sources,
and unreconciled balances fail closed. Native hooks are optional; explicit
control steps and audit evidence are not.

## Human approval adapter

Ledger, close, tax, payment, and reporting controls are detailed in
[`approval-enforcement.md`](approval-enforcement.md) and catalogued in
[`approval-adapter.json`](approval-adapter.json). The accounting boundary must
link every L3 mutation to an independent approval before posting.
