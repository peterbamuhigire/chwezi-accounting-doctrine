# Dimensions Specification

Dimensions are governed management-accounting attributes attached to ledger lines through the posting service. They are not free-text tags.

## Dimension registry fields

| Field | Rule |
|---|---|
| `dimension_code` | Stable machine code, lowercase with hyphens. |
| `name` | User-facing name. |
| `type` | One of standard dimension types or approved custom type. |
| `owner_role` | Role responsible for maintaining values. |
| `active_from` | Effective start date. |
| `active_to` | Optional end date. |
| `requires_approval` | True for project, grant, cost centre, allocation driver. |
| `allowed_accounts` | Accounts where the dimension is permitted or required. |
| `forbidden_accounts` | Accounts where the dimension must not appear. |

## Standard dimension types

| Type | Example value | Typical use |
|---|---|---|
| entity | `chwezi-demo-ltd` | Multi-entity reporting. |
| branch | `mukono` | Branch performance. |
| department | `sales` | Department cost control. |
| cost-centre | `warehouse` | Cost aggregation. |
| project | `clinic-fitout-2026` | Project profitability. |
| grant | `donor-a-education` | Restricted funding. |
| product-line | `retail-food` | Contribution margin. |
| customer-segment | `wholesale` | Revenue analysis. |
| channel | `pos` | Sales-channel reporting. |
| book | `tax` | Reporting book. |

## Account requirement matrix

```yaml
account: "4000 Sales - Goods"
required_dimensions:
  - branch
  - product-line
permitted_dimensions:
  - customer-segment
  - channel
forbidden_dimensions:
  - grant
```

The posting service rejects a line where a required dimension is missing or a forbidden dimension is present.

## Governance

- Dimension values are effective dated.
- Closed-period reports use the dimension state valid at posting date.
- Renames preserve the same code.
- Merges require Controller approval and a redirect record.
- Deactivation prevents new postings but does not rewrite history.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
