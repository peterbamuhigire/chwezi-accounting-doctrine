# Changelog

## 2026-10-31 - Documentation update after Kaizen pass 2

Documentation only; no skill, doctrine or tool changed.

- README: added a Validation section (each command checked on Linux, its
  dependencies, which checks need PowerShell and the date-triggered gate),
  and a Quality and improvement section with the pass-2 raw and capped scores
  (58.2 and 58.2; 57.3 and 57.3 on 29 October), the open register findings
  and a calendar of gates that fail from 2026-11-17. `bash install.sh` replaces
  `./install.sh`, which is committed without the executable bit. (`4553cd5`)
- AGENTS.md: the two portfolio-managed sentences were re-rendered with the
  shared renderer so they no longer name a workstation path (`f405a5b`);
  validation bullets, the source-register lookup step and the engine handoff
  names were updated by hand (`ca7140b`).
- `governance/how-to-reference-this-doctrine.md`: the active-contract paragraph
  resolves the doctrine through the engine table and the catalogue instead of a
  workstation path (`dc8bd25`).
- Added `docs/README.md`, an index of the documentation folder (`b34416d`), and
  `docs/kaizen/2026-10-engine-kaizen-pass-2/07-docs-followups.md`, which
  records the tool, manifest and cross-engine items left for their owners
  (`0041616`).
- README: added the subsection "What the October 2026 kaizen improved" to the
  Quality and improvement section. It lists the kept changes of the 29 and 31
  October cycles by theme with commit hashes, and gives before and after
  figures, marking which were re-measured on 2026-10-31 and which are taken
  from the evidence files.
- README kaizen (branch `kaizen/2026-10-readme-kaizen`): the README now opens
  with an at-a-glance list, three start steps and a contents list. It adds a
  task-to-skill table, splits the 108-skill tables into four catalogue
  sections and rewrites the install, validation and quality text as short
  lists. The source list moved to `docs/cited-sources.md` and the full
  October notes to `docs/kaizen/2026-10-31-october-changes-detail.md`.
  Routing steps, the PAYE lookup note and the contract markers keep their
  wording. Method, limits and editing conventions are in
  `docs/kaizen/2026-10-readme-kaizen/readme-kaizen-record.md`. (`72d693c`,
  `aaa73f9`, `b298f54`, `29bb289`)

Pass-2 commits by theme, for reference (the pass-2 entry below is unchanged):

- Source-register gate judges each entry: `90323f5`.
- Register content and snapshots: `666655c` (Uganda VAT threshold, dates),
  `cfed502` and `74df846` (Uganda snapshot cites register keys that exist).
- Python checks: integrity `cfed502`, machine-specific paths `43e6fc5`,
  routing proxy and fixtures `3530f82`.
- Skill descriptions and content: `3530f82` (Section 10), `dc592e7`
  (source-register skill).
- Router and changelog teaching: `2d0ed36`.
- Evidence: `0ec9877` (baseline), `d14b7c7` (backlog), `e955bd0` (experiment
  log, validation record, final report and next cycle).

## 2026-10-31 - Finance engine Kaizen, pass 2

- Fixed a false negative in the strict source-register gate: state and recheck
  date are now judged per entry, not once per file, and two new findings cover
  a recheck date earlier than the access date and a verified entry whose
  archive file is missing. Two negative controls were added.
- Added a draft `UG-VAT-REG-THRESHOLD` entry (URA's own pages now state
  UGX 300,000,000 a year and UGX 75,000,000 over three months; the amending
  Act and its commencement date were not located), corrected a recheck date
  that preceded its access date, and rewrote the Uganda statutory snapshot to
  cite register keys that exist. No entry was promoted.
- Added Python checks that run without PowerShell: source-register integrity
  (including cited source keys), machine-specific path scan, and a Tier-2
  lexical routing regression check over labelled fixtures. Removed
  machine-specific paths from three active files.
- Aligned two skill descriptions with their content and added fixtures for the
  Section 10 and source-register skills; the source-register skill now states
  its per-entry, named-reviewer and degraded-mode rules.

## 2026-10-29 - Finance engine Kaizen

- Extended the strict text-integrity scan to reject forbidden C0 controls and
  DEL in configured text files while allowing tabs; restored the matching
  damaged data-contract row in 74 skill references.
- Added a focused after-close material-error example separating the Chwezi
  immutable-ledger correction sequence from IFRS for SMEs Section 10
  retrospective restatement, with balanced fixture journals, content checks
  and a three-positive/two-negative expected-route fixture.
- Added Codex compatibility and local marketplace metadata, expanded Claude
  plugin metadata, and registered discovery, negative-control and 5,000-file
  package/full-checkout guards. Public marketplace acceptance is not claimed.
- Kept tax schedules that lack current primary-source/reviewer evidence blocked
  from final statutory output.

## 2026-08-27 - Advanced IFRS research and review capability

- Added Conceptual Framework and IFRS 18 routes, including materiality,
  transition, aggregation/disaggregation, and MPM workpapers.
- Deepened IFRS 9, IFRS 15, IFRS 16, IAS 36, IAS 37, IAS 16, IAS 10, IAS 7,
  IAS 23, and IFRS 13 review guidance with evidence-producing examples.
- Added advanced consolidated-statement review for IFRS 10/11/12 and published
  IFRS financial-statement analysis for management, audit committee, investor,
  and regulator audiences.
- Added Digital Research source evaluation/verification records, a complete
  Kaizen cycle, an advanced IFRS capability matrix, and a deterministic
  readiness checker with negative and live-repository tests.
- Kept new IFRS source-register entries in `draft` state pending named human
  IFRS review and source capture/archive.

## 2026-08-16 - Product-first commercial and inventory boundary

- Added the canonical rule that Products are sold while Stock Items are
  purchased, received, manufactured, grown, consumed, transferred, counted,
  and valued.
- Defined explicit Product-to-Stock-Item and Product-to-component mappings for
  inventory relief, including bundled products.
- Defined sale price lists as Product-based and purchase price lists as
  Stock-Item-based with `is_purchase_item = 1`.
- Deprecated `is_sales_item` and `is_saleable` as customer-sales gates; they
  remain migration-compatibility fields until downstream consumers are
  removed and audited.

## 2026-07-08 - Engine Upgrade Foundation, Enrichment, and Polish

- Added root-level source register `docs/source-registers/ifrs-tax-statutory-2026.md` for IFRS, IFRS for SMEs, IAASB, COSO, Uganda VAT, PAYE, NSSF, WHT, LST, EFRIS, NGO, and retail/POS source surfaces.
- Added human-readable Uganda statutory snapshot `references/uganda-statutory.md`.
- Added research integration log `docs/engine-upgrade-july-2026/research-engine-integration-log.md`, now backed by the live Digital Research Skills Engine at `C:\wamp64\www\digital-research-engine`.
- Added book knowledge map `docs/engine-upgrade-july-2026/book-knowledge-map.md` mapping all attached books to engine outputs.
- Added strict frontmatter report and repair tool `scripts/fix-frontmatter-report.ps1`.
- Added full retail VAT/POS transaction-to-report journal pack under `examples/journal-packs/retail-vat-pos/`.
- Added benchmark-quality retail POS exemplar under `docs/world-class-exemplars/retail-vat-pos-pack.md`.
- Added deterministic accounting invariant fixtures and runner under `tests/accounting-invariants/`.
- Added NGO sector report pack template under `templates/sector-report-packs/ngo/`.
- Added world-class release gate `docs/quality-gates/world-class-finance-release-gate.md`.
- Added anti-slop finance output governance `governance/anti-slop-finance-output.md`.
- Corrected Digital Research Skills Engine path to `C:\wamp64\www\digital-research-engine`, added it to global Codex routing memory, re-ran source verification through the engine's source-evaluation/source-verification/legal-research workflow, and added `docs/engine-upgrade-july-2026/research-verification-manifest.md`.
- Revised Uganda VAT registration threshold treatment to block final output across the URA 150m, introduced Bill 250m, and Parliament Hansard 300m conflict until assented Act/Gazette or updated URA guidance is verified.

Review consequence: final statutory outputs still require named human reviewer sign-off for volatile Uganda statutory values. Digital Research Skills Engine integration is active at `C:\wamp64\www\digital-research-engine`.
