# Exception Indicators

Indicators for fraud, error, and control failure monitoring. Each indicator must have an owner, threshold, cadence, and evidence path.

## Core indicators

| Indicator | Default threshold | Owner | Cadence |
|---|---|---|---|
| Duplicate supplier by TIN, bank account, or mobile number | Any match | Controller | Weekly |
| Supplier bank-detail change followed by payment | Within 24 hours | Controller | Daily |
| Round-sum payment | Above entity threshold | Accountant | Daily |
| Cash drawer variance | Above drawer threshold | Branch Manager | Daily |
| Repeated reversals by same actor | 3 in 7 days | Controller | Weekly |
| Unmatched deposits ageing | Over 7 days | Accountant | Daily |
| Stale clearing items | Over close threshold | Controller | Close |
| Backdated posting | Any posting before current system date | Controller | Daily |
| Period reopen | Any | CFO and Controller | Event-based |
| Payroll master change before payroll run | Within 48 hours | Payroll Reviewer | Each payroll |
| Tax-rate change outside reviewer role | Any | Tax Reviewer | Event-based |

## Indicator record

```yaml
indicator_id: "cash-variance-branch"
description: "Drawer close counted cash differs from expected cash"
threshold: "UGX 10,000 per drawer"
owner_role: "Branch Manager"
review_cadence: "daily"
source_report: "cash-drawer-exception-report"
evidence_path: "evidence/<entity>/<period>/controls/cash-variance/"
escalation: "Controller if repeated or above UGX 50,000"
```

## Handling

1. Indicator appears in exception dashboard.
2. Owner assigns a resolution action and due date.
3. Resolution is evidenced by correction, explanation, or approved waiver.
4. Controller reviews unresolved items before close release.

## Release blockers

- High-risk indicator unresolved at close with no approved caveat.
- Exception owner missing.
- Evidence path missing.
- Repeated indicator suppressed from dashboard.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
