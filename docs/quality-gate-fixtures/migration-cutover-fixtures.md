# Migration Cutover Fixtures

Quality gate blockers covered: `B-023`, `B-050`, `B-051`.

## Fixture: Migration Suspense Not Cleared

Fail input:

```yaml
cutover-date: 2026-04-30
migration-suspense-balance: 450000
waiver:
  approved: false
```

Expected finding: `B-023`.

Pass input:

```yaml
cutover-date: 2026-04-30
migration-suspense-balance: 0
waiver: null
reviewed-by: "Controller"
```

Expected result: no `B-023` finding.

## Fixture: Missing Opening-Balance Sign-Off

Fail input:

```yaml
cutover-date: 2026-04-30
opening-balance-signoff: null
subledger-tieouts:
  ar: attached
  ap: missing
  inventory: attached
```

Expected finding: `B-050`.

Pass input:

```yaml
cutover-date: 2026-04-30
opening-balance-signoff:
  signed-by: "Controller"
  signed-at: "2026-05-02"
  evidence: "migration/opening-balance-signoff-2026-04-30.md"
subledger-tieouts:
  ar: attached
  ap: attached
  inventory: attached
```

Expected result: no `B-050` finding.

## Fixture: Trial-Balance-Only Migration

Fail input:

```yaml
legacy-scope:
  open-customers: true
  open-suppliers: true
  inventory-on-hand: true
migration-inputs:
  trial-balance: attached
  subledgers: missing
```

Expected finding: `B-051`.

Pass input:

```yaml
legacy-scope:
  open-customers: true
  open-suppliers: true
  inventory-on-hand: true
migration-inputs:
  trial-balance: attached
  customer-open-items: attached
  supplier-open-items: attached
  stock-count: attached
```

Expected result: no `B-051` finding.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
