# Control Account Tie-Out Fixture

Quality gate blocker covered: `B-022`.

## Fixture: Untied Control Account

Fail input:

```yaml
control-account: "Accounts Receivable Control"
gl-balance: 12500000
subledger-balance: null
tieout-reviewed-by: null
```

Expected finding: `B-022`.

## Fixture: Tied Control Account

Pass input:

```yaml
control-account: "Accounts Receivable Control"
gl-balance: 12500000
subledger-balance: 12500000
variance: 0
tieout-reviewed-by: "Controller"
tieout-reviewed-at: "2026-05-15"
evidence: "reconciliations/ar-control-2026-04.md"
```

Expected result: no `B-022` finding.

Review check: every control account must carry a subledger source, balance date, variance amount, reviewer, and evidence path. Non-zero variance requires an approved reconciling item register.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
