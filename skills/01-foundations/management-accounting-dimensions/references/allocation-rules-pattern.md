# Allocation Rules Pattern

Allocation rules distribute costs or revenue from a source pool to recipient dimensions. Each allocation must be reproducible from stored rule, basis, and period data.

## Rule schema

```yaml
rule_id: "alloc-rent-branch-2026"
name: "Allocate head-office rent to branches"
source_account: "6100 Rent"
source_dimensions:
  cost-centre: "head-office"
basis: "floor-area"
basis_source: "approved branch floor-area register"
recipients:
  - branch: "mukono"
    basis_value: 120
  - branch: "jinja"
    basis_value: 80
posting_account: "6100 Rent"
approval_role: "Controller"
effective_from: "2026-01-01"
effective_to: null
state: "approved"
```

## Required allocation journal metadata

| Field | Purpose |
|---|---|
| Rule ID | Links the posting to the approved rule. |
| Period | Identifies the cost pool period. |
| Basis source | Names the source of driver values. |
| Basis values | Stores values used at posting time. |
| Approver | Shows Controller approval. |
| Reversal reference | Required if allocation is reversed. |

## Control rules

- Basis values are frozen for the period once allocation posts.
- Allocation cannot post into a locked period without reopen approval.
- Recipient dimensions must be active on the posting date.
- Allocation lines must balance to zero net effect on total profit unless the rule deliberately allocates revenue.
- Allocated fixed costs are clearly labelled in contribution-margin reports.

## Rejection conditions

- Missing approval.
- Source pool does not tie to GL.
- Recipient total basis is zero.
- Rule changed without effective date.
- Basis values are not stored with the journal.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
