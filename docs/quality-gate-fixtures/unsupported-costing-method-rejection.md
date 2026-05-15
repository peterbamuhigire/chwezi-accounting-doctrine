# Unsupported Costing Method Rejection

Quality gate blocker covered: `B-003`.

## Fixture: LIFO Presented As IFRS Compliant

Fail input:

```yaml
inventory-policy:
  framework: IFRS for SMEs
  costing-method: LIFO
  disclosure: "Inventory is measured using LIFO and complies with IFRS for SMEs."
```

Expected finding: `B-003`.

## Fixture: Accepted Costing Method

Pass input:

```yaml
inventory-policy:
  framework: IFRS for SMEs
  costing-method: weighted-average
  disclosure: "Inventory is measured at the lower of cost and estimated selling price less costs to complete and sell."
```

Expected result: no `B-003` finding.

Review check: reject any artefact that labels LIFO as IFRS, IFRS for SMEs, or Chwezi doctrine compliant. If LIFO appears only as a migration legacy note, require a conversion adjustment and reviewer sign-off before release.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
