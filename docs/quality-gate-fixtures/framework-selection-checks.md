# Framework Selection Checks

Quality gate blockers covered: `B-001`, `B-002`, `B-004`, `B-082`.

## Fixture: Missing Framework Header

Fail input:

```yaml
artefact: monthly-management-accounts
entity: Chwezi Demo Ltd
period: 2026-04
basis-note: "Prepared for internal review."
```

Expected finding: `B-001` because there is no explicit `Framework:` header.

Pass input:

```yaml
artefact: monthly-management-accounts
entity: Chwezi Demo Ltd
period: 2026-04
Framework: IFRS for SMEs
basis-note: "Prepared for internal review."
```

Expected result: no `B-001` finding.

## Fixture: US GAAP Without Client Selection

Fail input:

```yaml
Framework: US GAAP
client-framework-selection: null
```

Expected finding: `B-002` because US GAAP is applied without explicit client selection.

Pass input:

```yaml
Framework: US GAAP
client-framework-selection:
  selected-by: "Client board resolution"
  selected-at: "2026-05-01"
  evidence: "board-pack/framework-election-2026-05-01.pdf"
```

Expected result: no `B-002` finding if the evidence is attached.

## Fixture: Mixed Framework Policy Change

Fail input:

```yaml
entity: Chwezi Demo Ltd
period: 2026
comparatives-framework: IFRS for SMEs
current-framework: Full IFRS
policy-change-documentation: null
```

Expected finding: `B-004`.

Pass input:

```yaml
entity: Chwezi Demo Ltd
period: 2026
comparatives-framework: IFRS for SMEs
current-framework: Full IFRS
policy-change-documentation:
  reason: "Entity became publicly accountable."
  approval: "board-pack/framework-change-2026-01-15.pdf"
  transition-note: "notes/standards-transition-2026.md"
```

Expected result: no `B-004` finding if the policy-change evidence is attached.

## Fixture: Business Plan Framework Header

Fail input:

```yaml
artefact: business-plan-financials
projection-period: 2026-2028
Framework: null
```

Expected finding: `B-082`.

Pass input:

```yaml
artefact: business-plan-financials
projection-period: 2026-2028
Framework: IFRS for SMEs
assumption-basis: "Management forecast, not statutory financial statements."
```

Expected result: no `B-082` finding.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
