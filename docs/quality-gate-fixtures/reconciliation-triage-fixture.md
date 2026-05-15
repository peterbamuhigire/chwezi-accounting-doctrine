# Reconciliation Triage Fixture

Quality gate blocker covered: `B-061`.

## Fixture: Download-Only Reconciliation

Fail input:

```yaml
reconciliation-output:
  type: downloadable-report
  unmatched-items-visible: true
  triage-actions:
    match: false
    split: false
    mark-exception: false
    defer: false
```

Expected finding: `B-061`.

## Fixture: Triage UI

Pass input:

```yaml
reconciliation-output:
  type: triage-ui
  unmatched-items-visible: true
  triage-actions:
    match: true
    split: true
    mark-exception: true
    defer: true
  audit-log:
    actor: required
    action: required
    timestamp: required
    source-item: required
```

Expected result: no `B-061` finding.

Review check: reconciliation interfaces must let reviewers resolve unmatched items in workflow, not only export a report for offline correction.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
