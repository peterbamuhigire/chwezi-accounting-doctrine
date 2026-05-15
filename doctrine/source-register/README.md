# Source Register

The source register records the authority, review state, and recheck date for statutory, tax, payroll, exchange-rate, and e-invoicing rules used by Chwezi accounting outputs.

It is a control surface, not a rate table. A value in this folder is not final unless its entry state allows final use.

## File Shape

Country topic files are YAML sequences:

```yaml
- id: UG-VAT-STANDARD-RATE
  topic: Uganda VAT standard rate
  jurisdiction: UG
  value_or_rule: "Pending reviewer extraction from official source."
  source_url_or_doc: "https://ura.go.ug/wp-content/uploads/2024/12/Taxation-Handbook-FY-2024-25.pdf"
  source_tier: 2
  date_accessed_utc: "2026-05-14T21:07:52Z"
  verifier: "tax reviewer pending"
  output_affected:
    - sales-tax-codes
    - vat-return-pack
  effective_from: "pending-review"
  expires_or_recheck_due: "2026-08-14"
  state: draft
  archive_snapshot: "capture-required-before-release"
  notes: "Draft entries cannot support final statutory output."
```

See `schema.yaml` for required fields and allowed states.

## State Rules

| State | Meaning | Can support final output? |
|---|---|---|
| `draft` | Source identified but not reviewed. | No. |
| `verified-current` | Official source checked, date recorded, reviewer named, archive captured. | Yes. |
| `verified-with-caveat` | Source checked, but scope or interpretation caveat remains. | Only with caveat and reviewer approval. |
| `stale` | Recheck date passed. | No. |
| `superseded` | Replaced by a newer authority entry. | No. |
| `no-source-found` | Search attempted; no official source found. | No. |

## Release Rule

Final statutory output fails when a required source key is missing, stale, draft, superseded, or unarchived. A verified-with-caveat entry may support final output only when the output visibly carries the caveat and the reviewer approval is attached.

## Authority Hierarchy

| Tier | Sources |
|---|---|
| 1 | Enacted Acts, statutory instruments, finance acts, gazettes, court decisions where applicable. |
| 2 | Revenue authorities, statutory funds, central banks, company registries, accounting regulators. |
| 3 | Regulator handbooks, notices, FAQs, implementation guides, e-invoicing manuals. |
| 4 | Professional bodies and standards setters. |
| 5 | Accredited firm publications. |
| 6 | Secondary commentary. |

Tier 1 or Tier 2 evidence is required for verified-current rates and statutory thresholds. Tier 3 to Tier 5 sources can support interpretation but do not replace primary authority for final values.

## Current Pack Status

| Country | Status | Release consequence |
|---|---|---|
| Uganda | One verified-current NSSF mandatory contribution entry; VAT, PAYE, WHT, income-tax, exchange-rate, and EFRIS entries remain draft seeds. | Final output may rely only on the verified NSSF contribution fields within their caveated scope; other statutory outputs remain blocked until reviewer verification and archives are added. |
| Kenya | VAT and eTIMS skeletons present. | Final rates and eTIMS claims blocked. |
| Rwanda | Skeleton README only. | Planning use only. |
| Tanzania | Skeleton README only. | Planning use only. |
| South Africa | Skeleton README only. | Planning use only. |

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
