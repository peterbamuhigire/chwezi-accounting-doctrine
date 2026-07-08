# Changelog

## 2026-07-08 - Engine Upgrade Foundation, Enrichment, and Polish

- Added root-level source register `docs/source-registers/ifrs-tax-statutory-2026.md` for IFRS, IFRS for SMEs, IAASB, COSO, Uganda VAT, PAYE, NSSF, WHT, LST, EFRIS, NGO, and retail/POS source surfaces.
- Added human-readable Uganda statutory snapshot `references/uganda-statutory.md`.
- Added research integration log `docs/engine-upgrade-july-2026/research-engine-integration-log.md`, now backed by the live Digital Research Skills Engine at `C:\wamp64\www\digital-research-skills`.
- Added book knowledge map `docs/engine-upgrade-july-2026/book-knowledge-map.md` mapping all attached books to engine outputs.
- Added strict frontmatter report and repair tool `scripts/fix-frontmatter-report.ps1`.
- Added full retail VAT/POS transaction-to-report journal pack under `examples/journal-packs/retail-vat-pos/`.
- Added benchmark-quality retail POS exemplar under `docs/world-class-exemplars/retail-vat-pos-pack.md`.
- Added deterministic accounting invariant fixtures and runner under `tests/accounting-invariants/`.
- Added NGO sector report pack template under `templates/sector-report-packs/ngo/`.
- Added world-class release gate `docs/quality-gates/world-class-finance-release-gate.md`.
- Added anti-slop finance output governance `governance/anti-slop-finance-output.md`.
- Corrected Digital Research Skills Engine path to `C:\wamp64\www\digital-research-skills`, added it to global Codex routing memory, re-ran source verification through the engine's source-evaluation/source-verification/legal-research workflow, and added `docs/engine-upgrade-july-2026/research-verification-manifest.md`.
- Revised Uganda VAT registration threshold treatment to block final output across the URA 150m, introduced Bill 250m, and Parliament Hansard 300m conflict until assented Act/Gazette or updated URA guidance is verified.

Review consequence: final statutory outputs still require named human reviewer sign-off for volatile Uganda statutory values. Digital Research Skills Engine integration is active at `C:\wamp64\www\digital-research-skills`.
