# Kaizen Experiment Log

## Experiment IFRS-ADV-001

| Field | Record |
|---|---|
| Observation | Advanced IFRS routes were broad but IFRS 18 was transition-only and IFRS 9/16/IAS 36 explicitly deferred full machinery. |
| Baseline | 103 live skills; 6 skill files contained Tier-3/deferred language; no advanced-IFRS readiness checker; 0 advanced-IFRS source-register files. Reproduce with `Get-ChildItem -Recurse -File skills -Filter SKILL.md`, `rg -l --glob 'SKILL.md' 'Tier-3 scope|deferred until|full IFRS.*defer' skills`, and `Get-ChildItem doctrine/source-register -Recurse -Filter '*.yaml'`. |
| Hypothesis | If focused advanced routes, evidence manifests, fixtures, and a stale-scope checker are added, then coverage and routing defects will become detectable without weakening accounting controls. Guardrails: source states remain draft pending review; existing invariant tests remain green; no ledger or approval control changes. |
| Experiment | Add project-local documentation, specialist skills, fixtures, and a read-only readiness checker; compare before/after structural and deterministic validation. |
| Owner / authorisation | Doctrine improvement workstream; project-local reversible edits authorised by requester. |
| Stop rule | Stop and revert the experiment if any validator shows an accounting invariant regression, source state is silently promoted, or a new instruction weakens SoD/immutability/reconciliation. |
| Result | Structural and deterministic validation passed on 2026-08-27: 107 active routes, 14 advanced routes checked, 63 accounting-invariant assertions passed, and the negative readiness fixture failed as designed. |
| Failed-path result | The incomplete-engine fixture must fail with missing-route findings; an unsupported source or missing human review remains blocked. |
| Standardisation decision | Standardise the route, evidence-pack, and readiness-checker pattern. Keep source entries draft and client-facing conclusions reviewer-gated until human IFRS review and source archive evidence are complete. |
