# Ledger Boundary And Lock Fixtures

Quality gate blockers covered: `B-010`, `B-013`.

## Fixture: Direct Journal Line Write

Fail input:

```yaml
code-path: "src/controllers/invoice_controller.php"
operation: "INSERT INTO journal_lines (...) VALUES (...)"
posting-service-used: false
```

Expected finding: `B-010`.

Pass input:

```yaml
code-path: "src/controllers/invoice_controller.php"
operation: "postingService.post(invoiceDocument)"
posting-service-used: true
posting-service-invariants:
  - balanced-lines
  - audit-log-required
  - period-lock-check
```

Expected result: no `B-010` finding.

## Fixture: Locked Period Posting

Fail input:

```yaml
period: 2026-03
period-state: locked
attempted-posting: "supplier-credit-note"
reopen-workflow:
  requested: false
  approved: false
```

Expected finding: `B-013`.

Pass input:

```yaml
period: 2026-03
period-state: reopened
attempted-posting: "supplier-credit-note"
reopen-workflow:
  requested: true
  approved-by: "Controller"
  approval-evidence: "close/reopen-2026-03.md"
  reversal-link: "JV-2026-04-117"
```

Expected result: no `B-013` finding.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
