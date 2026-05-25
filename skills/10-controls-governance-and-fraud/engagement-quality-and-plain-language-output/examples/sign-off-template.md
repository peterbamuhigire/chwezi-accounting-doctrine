# Example: Sign-Off Template

```yaml
output_id: MAY-2026-MANAGEMENT-PACK
entity: Example Entity
period: 2026-05
status: review-ready
version: 1
preparer:
  name: "<name>"
  role: Accountant
  signed_at: "<timestamp>"
reviewers:
  - name: "<name>"
    role: Controller
    decision: pending
    signed_at: null
tax_source_register_state: "not-applicable or verified-current snapshot"
caveats:
  - "No final statutory filing may be made from this draft."
```

## Pass criteria

- Final output requires all required reviewer decisions.
- Caveats remain visible until resolved or approved.
