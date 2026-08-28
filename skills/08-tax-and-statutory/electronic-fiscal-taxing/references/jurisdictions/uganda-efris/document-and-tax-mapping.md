# Uganda EFRIS Document and Tax Mapping

## Document classes

| Internal event | EFRIS treatment to verify | Accounting treatment |
|---|---|---|
| Original sale to a VAT taxpayer | E-invoice workflow | Revenue, output tax, AR/cash, stock/COGS through approved service |
| Original sale to a non-VAT customer | E-receipt workflow if applicable | Same decomposition using governed tax status |
| Downward correction/return | Credit-note application/approval rules | Linked reversal or reduction; original immutable |
| Upward correction | Debit-note rules | Linked increase; original immutable |
| Cancellation/void | Authority cancellation capability and timing | Approved void/reversal policy; never erase evidence |

## Supplied v24 field families

The supplied interface design groups an invoice around seller details, basic
information, buyer details, goods/services details, tax details, summary,
payment, and extension/reason fields. The internal mapping must retain:

- seller legal identity, TIN, branch/place of business, operator, device;
- internal invoice/reference number and authority-assigned FDN/verification/QR;
- buyer type and identity; B2B/B2G TIN readiness must be explicit;
- product code, description, UOM, quantity, unit price, discount, tax category,
  excise/other special treatment, and catalogue mapping;
- tax totals by category plus net, tax, gross, item count, currency, and payment;
- original invoice linkage and reason codes for corrections.

Use the ledger's effective-dated tax code and customer/product master as the
source of accounting tax classification. Authority dictionary IDs are mapped
values, not substitutes for the ledger tax policy.

## Validation gates

- No fiscal submission without a complete seller profile and active device/branch
  assignment.
- No B2B/B2G submission without the current buyer-identification rule satisfied.
- No line without product/UOM/category mapping, unless the current authority
  pack explicitly permits an approved fallback.
- Tax totals must recompute from governed line values and agree with the source
  invoice before submission.
- Credit/debit values, original-document linkage, approval, and ledger effect
  must agree; negative values must follow the provider contract.
