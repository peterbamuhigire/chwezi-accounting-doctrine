# Example: Country Pack Skeleton

```yaml
country: KE
status: skeleton
authority_hierarchy:
  - KRA
  - Kenya Law
  - CBK
  - ICPAK
statutory_surfaces:
  - VAT
  - PAYE
  - social-security
  - withholding-tax
  - e-invoicing
  - exchange-rates
final_values_allowed: false
notes:
  - "Authority hierarchy is a planning scaffold."
  - "Final rates and schedules require promoted source-register entries."
```

## Expected behavior

- The pack can guide discovery and implementation scaffolding.
- The pack cannot produce final statutory calculations until entries are verified.
