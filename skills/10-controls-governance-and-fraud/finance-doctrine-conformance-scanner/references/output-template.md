# Output Template

Use this shape for conformance reports.

## Executive Verdict

| Field | Result |
|---|---|
| Target | `<path or artefact>` |
| Review type | `<codebase/system/plan/proposal/blog/mixed>` |
| Doctrine conformance | `<conformant/nonconformant-critical/nonconformant-high/conformant-with-gaps>` |
| Release recommendation | `<block/revise/conditional pass/pass>` |
| Top blockers | `<count and short labels>` |

## Scope And Method

- Scope reviewed:
- Files or sections inspected:
- Scanner command used, if any:
- Sources and source-register snapshots reviewed:
- Limitations:

## Findings

| Severity | Location | Doctrine | Finding | Risk | Alignment instruction | Acceptance check | Owner |
|---|---|---|---|---|---|---|---|
| critical/high/medium/low | file:line or section | doctrine path | issue | consequence | concrete fix | test/evidence | role |

## Doctrine Crosswalk

| Artefact area | Required doctrine | Current state | Gap |
|---|---|---|---|

## Evidence Requests

| Evidence needed | Why | Owner |
|---|---|---|

## Implementation Instructions

Write direct instructions grouped by owner:

- Engineering:
- Controller:
- Tax reviewer:
- Proposal/content owner:
- Security/privacy:
- UX/product:

## Acceptance Gate

List the checks that must pass before the artefact is treated as doctrine-aligned.

Last reviewed: 2026-05-25.
