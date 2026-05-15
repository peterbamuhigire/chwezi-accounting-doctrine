# Doctrine Validation Report Template

Use this template when attaching validation evidence to a release, mirror run, or reviewer sign-off packet.

## Run Metadata

| Field | Value |
|---|---|
| Repository | `C:\wamp64\www\chwezi-accounting-doctrine` |
| Doctrine version | `<version or commit>` |
| Source commit | `<git sha>` |
| Validator command | `powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate-doctrine.ps1` |
| Ran at | `<YYYY-MM-DDTHH:MM:SS+03:00>` |
| Ran by | `<human or agent>` |
| Validation state | `pass | pass-with-caveats | fail` |

## Structured Summary

| Metric | Value |
|---|---|
| Blocker findings | `<count>` |
| High findings | `<count>` |
| Medium findings | `<count>` |
| Caveat findings | `<count>` |
| Active finance skills | `<count>` |
| Missing undeclared references | `<count>` |
| Mojibake matches | `<count>` |
| Broken local links | `<count>` |
| Source-register verified-current entries | `<count>` |
| Quality-gate blockers covered | `<covered>/<total>` |

## Check Results

| Check | State | Evidence |
|---|---|---|
| Mojibake | `<state>` | `<summary or report path>` |
| Skill contracts | `<state>` | `<summary or report path>` |
| Source register | `<state>` | `<summary or report path>` |
| Links | `<state>` | `<summary or report path>` |

## Caveats

| ID | Owner | Expiry | Caveat | Release impact |
|---|---|---|---|---|
| `<id>` | `<owner>` | `<date>` | `<named caveat>` | `<allowed only for internal draft / blocks final statutory output / blocks full pass>` |

## Reviewer Sign-Off

| Role | Name | Decision | Date | Notes |
|---|---|---|---|---|
| Doctrine owner | `<name>` | `approve | reject | caveated approve` | `<date>` | `<notes>` |
| Accounting reviewer | `<name>` | `approve | reject | caveated approve` | `<date>` | `<notes>` |
| Tax reviewer | `<name>` | `approve | reject | caveated approve` | `<date>` | `<notes>` |
| Tooling reviewer | `<name>` | `approve | reject | caveated approve` | `<date>` | `<notes>` |

## Release Decision

Use these rules:

| State | Decision |
|---|---|
| `pass` | Release evidence supports operational use for the validated scope. |
| `pass-with-caveats` | Internal draft or non-final use only. Final statutory, ledger-affecting, or client-facing financial statement output remains blocked where caveats apply. |
| `fail` | Do not release. Resolve blocker or high findings first. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
