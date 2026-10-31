# Validation record, kaizen pass 2: 2026-10-31

## How the registered gate was run on this host

`tools/validate-doctrine.ps1 -Strict` registers 17 checks. This host has no
`pwsh`. The gate was therefore run as follows, and the aggregate script itself
did not complete:

1. A scratch runner outside the repository (not part of the engine) mirrors the
   check list of `tools/validate-doctrine.ps1` and runs 16 of the checks, each
   with `-Json -Strict`, inside the existing local `mcr.microsoft.com/powershell`
   image with the network disabled and the repository bind-mounted read-only.
   No package was installed and no image was pulled.
2. The 17th check, `check-frontmatter-yaml.ps1`, only wraps
   `tools/check_frontmatter_yaml.py`. The image has no Python, so that script
   was run on the host with Python 3.14 and PyYAML.
3. Running `validate-doctrine.ps1 -Strict` itself in the container failed at
   check 3 (`python` not found). That is an environment limit, recorded as such.

**Windows PowerShell 5.1, the remote CI run and native `pwsh` on this host are
`NOT_ASSESSED`.** The CI workflow is unchanged.

## Commands and results

| Command / evidence | Result |
|---|---|
| `python3 -m unittest discover -s tests -p 'test_*.py'` | Exit 0; 56 tests passed (baseline 23: +17 integrity, +10 machine-path, +6 routing-proxy cases). |
| 16 PowerShell checks in the offline container (final run) | All exit 0, state `pass`, 0 findings: mojibake (737 files, 0 mojibake, 0 control bytes), skill contracts (108), advanced IFRS readiness, source register (30 entries: 28 `draft`, 1 `verified-current`, 1 `superseded`), links (201 local, 0 broken), repository discovery, router-map sync, accounting invariants (63 assertions, 0 failed), router-map controls (3), source-register controls (3, was 1), validation-state controls (10), mojibake controls (2), package file count, package-count controls (3), plugin packaging (108 skills on both host manifests), packaging controls (7). |
| `python3 tools/check_frontmatter_yaml.py --root .` | Exit 0; `pass`; 108 skills. |
| `python3 tools/source_register_integrity.py` | Exit 0; 30 entries, 0 errors, 8 attention items: 7 draft entries past their recheck date and 1 `verified-current` entry whose verifier does not name a reviewer. |
| `python3 tools/check_machine_paths.py` | Exit 0; 0 files over their ceiling. |
| `python3 tools/route_proxy.py --fixture ...` (two fixtures) | Exit 0; 7 of 7 and 5 of 5 cases first by at least the 0.05 margin. Tier-2 lexical proxy, not live routing. |
| Skill-engine-audit portable contract scan, read-only | 2 of 108 fully compliant (baseline 1): capability 103, degraded mode 102, trigger 29, sections 21, anti-pattern 14, metadata 14. |
| Source-register negative controls | 3 of 3 pass: duplicate identity (`SRC-008`, `SRC-009`), mixed-state overdue verified entry (`SRC-005`, `SRC-011`), recheck before access (`SRC-010`). The mixed-state fixture returned `pass` on the baseline checker. |
| `git diff --check 7bc6a02` (starting commit against working tree) | Exit 0. |
| Plugin manifests | `.claude-plugin`, `.codex-plugin`, `.agents` unchanged from the starting commit (0 files differ), so the 29 October native Claude and Codex install results are not repeated. `claude plugin validate` and the Codex install were not re-run: `NOT_ASSESSED` this cycle. |
| Tier 3 behavioural or model run | `NOT_ASSESSED`; none run; no paid model call. |

## Practitioner re-check

| Task | Result |
|---|---|
| 1. Trading month | The 10 fixture journals balance (8,940,000 each side); the trial balance balances at 5,045,000 gross or 4,865,000 with VAT netted; PAYE 38,250 recomputes. Rate lookup for 2026-10-15: PAYE, VAT, LST, WHT and EFRIS refused for final output; NSSF allowed (see the D5 decision in `06-next-cycle.md`). The VAT rate entry no longer reports a false "recheck overdue". Not a releasable close: LST, source documents, provider statement and reviewer are absent. |
| 2. Prior-period error | Router and proxy pick the Section 10 skill first with a margin of about 0.15 (was under 0.01). Content check as on 29 October: reversal and re-posting in an open period, no update or delete, Section 10 named. Third-edition paragraph numbers were not re-opened: `NOT_ASSESSED` this pass. |
| 3. Statements and PBC | Arithmetic reproduces (assets 3,365,000 = liabilities 1,865,000 + equity 1,500,000 with VAT netted). Cash-flow classification, tax provision and evidence remain `NOT_ASSESSED`. |
| Eleven practitioner queries through the proxy | 8 of 11 first-ranked as expected, the same as the baseline; the three misses are overlaps between adjacent skills (informal sample, not a benchmark). |

## Currency checks (currentness gate)

Access date for every row: 2026-10-31. Official pages were fetched with a
page-reading tool that returns a summary, so figures were checked against the
page text it quoted and, where a PDF was image-only, against the page images
themselves. Fetched content was treated as data.

| Claim | Source | Support state | Review date | Limit |
|---|---|---|---|---|
| IFRS for SMEs third edition applies to periods beginning on or after 2027-01-01; earlier application permitted | IFRS Foundation standard page | Supported at page level | 2026-11-29 | Page lists no transition summary; register entry stays `draft` pending human IFRS review and archive. |
| Consolidation exception amendment | IFRS Foundation project page (exposure draft May 2026, comments closed 2026-09-09, issue planned by end-2026) | Partial: not issued | 2026-11-29 | Final text and effect `NOT_ASSESSED`. A news item of 2026-10-29 reports an IASB decision to proceed (recorded 29 October). |
| IFRS 18 applies from 2027-01-01, earlier application permitted | IFRS Foundation IFRS 18 page | Supported at page level | 2026-12-29 | Page gives no transition detail; issued text last opened 2026-10-29; statement-template impact not reviewed. |
| Uganda VAT standard rate 18%; registration threshold UGX 300,000,000 a year and UGX 75,000,000 over three consecutive months; return within 15 days of month end | URA VAT page and URA VAT guide Vol. 2 Issue 3 FY2026-27 (image-only PDF, read from page images) | Partial: regulator guidance only | 2026-12-29 | Neither names the amending Act nor an effective date. Secondary reports (not admitted) give passage on 2026-04-21 and commencement on 2026-07-01. Act text, gazette and reviewer `NOT_ASSESSED`. Recorded as `UG-VAT-REG-THRESHOLD` (`draft`). |
| Uganda PAYE resident and non-resident monthly schedules and the 30% multiple-employment rule | URA PAYE page | Supported at page level (matches the register entry) | 2026-12-26 | The page has no effective-date statement; 2026-07-01 rests on URA notices read on 2026-10-29. Reviewer and archive `NOT_ASSESSED`. |
| Uganda NSSF 5% employee and 10% employer, ages 16 to 55, remittance by the 15th | NSSF membership page | Supported at page level (matches) | 2026-11-16 | Page carries no date. Entry untouched; see D5. |
| Uganda WHT | URA withholding tax page | Opened; categories and percentages listed | 2026-12-29 | Page has no reference to the Income Tax (Amendment) Act 2026 and no effective-date statement; a 2026-27 WHT PDF is linked but was not opened. No rate admitted. |
| EFRIS notices and technical changes since 2026-08-28 | URA EFRIS page; web search | Partial | n/a | The page lists no notice or version. A search found no URA EFRIS notice after the one dated 2026-08-10/11 (read from secondary alerts). The FY2026-27 handbook contents were not opened: technical changes `NOT_ASSESSED`. |
| Uganda LST schedule and base | None new | `NOT_ASSESSED` | overdue (2026-10-27) | Not rechecked this cycle; no new source found or sought. |
| Kenya, Rwanda, South Africa | Not re-read | Unchanged from 2026-10-29 | 2026-11-29 | Two-day interval; their notes make no numeric claim. |
| Tanzania PAYE 2026/27 | Web search | No official schedule found | 2026-11-29 | Secondary sources disagree on whether PAYE changed under the Finance Act 2026 (effective 2026-07-01). Nothing admitted. |
| Model currentness (portfolio gate) | Not checked this pass | `NOT_ASSESSED` | n/a | The 29 October record stands (it noted the 2026-10-26 model release). No model-policy change proposed or made; Codex pins unchanged. |

## Environment notes

- A pre-tool shell hook blocked two of my commands. The first was a genuine
  recursive forced remove, which I did not retry. The second was
  `podman run --rm ... -NoProfile ...`, flagged as a recursive forced remove
  because the hook reads `--rm` as `rm` and `-NoProfile` as `-r` plus `-f`. The
  command removes nothing, so I re-expressed it without `-NoProfile` and
  without the override variable; no hook setting was changed.
- Host: Fedora, Python 3.14.8, Node 22, no `pwsh`, no `pytest`. Nothing was
  installed. The offline container used only the existing local image.
