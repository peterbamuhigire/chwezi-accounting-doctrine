# Changelog

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
