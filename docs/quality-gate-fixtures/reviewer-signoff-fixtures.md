# Reviewer Sign-Off Fixtures

Quality gate blockers covered: `B-090`, `B-091`.

## Fixture: Missing Required Reviewer Role

Fail input:

```yaml
artefact: payroll-release
scope:
  payroll: true
  tax: true
reviewer-role-registry:
  Accountant: "assigned"
  Payroll statutory reviewer: null
  Controller: "assigned"
```

Expected finding: `B-090`.

Pass input:

```yaml
artefact: payroll-release
scope:
  payroll: true
  tax: true
reviewer-role-registry:
  Accountant: "assigned"
  Payroll statutory reviewer: "assigned"
  Controller: "assigned"
```

Expected result: no `B-090` finding.

## Fixture: Missing Final Release Sign-Off

Fail input:

```yaml
artefact: ledger-affecting-release
state: ready-for-production
audit-log:
  final-release-signoff: null
```

Expected finding: `B-091`.

Pass input:

```yaml
artefact: ledger-affecting-release
state: ready-for-production
audit-log:
  final-release-signoff:
    signed-by: "Controller"
    signed-at: "2026-05-15T09:00:00+03:00"
    evidence-pack: "release/evidence-pack-2026-05-15.md"
```

Expected result: no `B-091` finding.

Review check: the required role matrix is derived from artefact scope. Final statutory, ledger-affecting, payroll, tax, migration, and client-facing releases require named sign-off in the audit log.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
