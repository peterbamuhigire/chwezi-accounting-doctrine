# Source Register Contract

The source register records the evidence that allows a statutory value, rule, schedule, return field, e-invoicing requirement, or exchange rate to be used.

## Entry fields

| Field | Required | Rule |
|---|---|---|
| `id` | yes | Stable key, such as `UG-VAT-STANDARD-RATE`. |
| `topic` | yes | Human-readable topic. |
| `jurisdiction` | yes | ISO country code. |
| `value_or_rule` | yes | Verified rule text or a placeholder when draft. |
| `source_url_or_doc` | yes | Official URL or archived local evidence path. |
| `source_tier` | yes | Tier from live-rate verification protocol. |
| `date_accessed_utc` | yes | Date and time source was checked. |
| `verifier` | yes | Named reviewer or named run owner. |
| `output_affected` | yes | Reports, returns, postings, or schedules using the entry. |
| `effective_from` | conditional | Required when the source has effective dates. |
| `expires_or_recheck_due` | yes | Date after which final use is blocked. |
| `state` | yes | State machine value. |
| `archive_snapshot` | required for release | Archive URL or local evidence path. |
| `notes` | optional | Caveat, interpretation note, or reviewer instruction. |

## State machine

| State | Can support final output? | Meaning |
|---|---|---|
| `draft` | No | Source identified but not reviewed. |
| `verified-current` | Yes | Official source checked, reviewer named, recheck date active. |
| `verified-with-caveat` | Only with approval | Source checked but scope or interpretation caveat remains. |
| `stale` | No | Recheck date passed. |
| `superseded` | No | Replaced by newer authority entry. |
| `no-source-found` | No | Search attempted; no authoritative source found. |

## Final-output rule

Final statutory output must fail if the source-register key is missing, stale, draft, superseded, unsupported by archive evidence, or outside its effective date range.
