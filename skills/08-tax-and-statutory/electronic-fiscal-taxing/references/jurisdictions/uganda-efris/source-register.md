# Uganda EFRIS Source Register

Status: supplied technical corpus plus current public URA verification; not a
production authorisation. Accessed 2026-08-28. Every technical constant used in
code must be promoted through the client's controlled register with a named
human verifier and archived evidence.

## Source corpus supplied by the client

| Source ID | Material | Use | State and limit |
|---|---|---|---|
| U-EFRIS-BR-1 | `EFRIS Interface User Requirement Specifications (Business Requirements) v1.5` | Business workflow, document content, print/report expectations | Supplied; versioned historical/technical reference; verify current rules |
| U-EFRIS-API-1 | `Interface Design for EFRIS v24.0.1 URA` | Envelope, interface catalogue, fields, codes, response shapes | Supplied technical version; production contract still requires URA confirmation |
| U-EFRIS-API-2 | `How to use the System to System API V3` | Registration, T101/T104 flow, encryption/signing narrative | Supplied older guide; conflicting spellings/versions must not be guessed |
| U-EFRIS-S2S-1 | `Step by step guide on how to integrate System2system on EFRIS` | Onboarding, UAT, migration, interface sequencing | Supplied guide; endpoint and accreditation details are not current until verified |
| U-EFRIS-OFF-1 | `EFRIS Offline Mode Enabler Requirements` | Offline architecture and taxpayer/device boundary | Supplied requirements; confirm limits and supported deployment |
| U-EFRIS-OFF-2 | `EFRIS Offline-Mode Enabler Installation Guide v1.6` | Installation, ports, runtime, local endpoint | Supplied installer guide; platform versions and ports are historical until confirmed |
| U-EFRIS-REG-1 | `Step by step guide for EFRIS device and thumbprint registration` | Portal registration and certificate/thumbprint process | Supplied operational guide; approval process must be confirmed |
| U-EFRIS-TRN-1 | `EFRIS Taxpayers Training Material v2` | Portal, catalogue, stock, documents, reports, validation | Supplied training material; explanatory rather than authoritative API contract |

## Public authority sources

| Claim surface | Source | State | Required treatment |
|---|---|---|---|
| EFRIS channel, registration, document artefacts, public offline guidance | Uganda Revenue Authority, “EFRIS”, `https://ura.go.ug/en/efris/` | verified public page, current check 2026-08-28 | Supports public orientation only |
| Handbook explanations and public taxpayer workflow | Uganda Revenue Authority, “EFRIS Handbook”, `https://ura.go.ug/en/efris-handbook/` | verified public page, current check 2026-08-28 | Supports taxpayer-facing concepts; not full S2S contract |
| Registration steps | Uganda Revenue Authority, “EFRIS Registration”, `https://ura.go.ug/en/efris/efris-registration/` | verified public page, current check 2026-08-28 | Supports onboarding sequence |
| Authenticated S2S endpoint, keys, codes, schemas, UAT and production approval | URA EFRIS onboarding / technical pack | blocked until obtained and archived | No production adapter activation |

## Conflicts and recheck triggers

- Supplied material varies between API labels such as `AP04`/`APP04`, older and
  newer interface versions, endpoint examples, cryptographic algorithms, and
  offline installation details. Preserve the received version and obtain the
  current pack; do not resolve by intuition.
- Public URA pages and supplied historical material cite different statutory
  section numbers and describe different taxpayer categories. The current
  legal position requires a current URA/legal source and reviewer.
- Recheck after any URA technical-pack revision, endpoint/certificate change,
  dictionary-version change, tax-law change, offline-policy change, or failed
  UAT result.

## Promotion rule

Before release, each code, endpoint, field rule, tax category, deadline, and
cryptographic rule has a row with source, exact version/date, verifier, archive
path, review date, confidence, and downstream tests. Missing or expired rows
remain `blocked` or `verified-with-caveat` and cannot support production claims.
