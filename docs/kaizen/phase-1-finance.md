# Phase 1 Kaizen — finance evidence contracts and workpapers

Date: 2026-09-19  
Repository: `C:\\wamp64\\www\\chwezi-accounting-doctrine`  
Scope: B03-A01, B03-A02, B07-A01, B07-A02  
Write boundary: this repository only

## Decision

Standardise four bounded evidence surfaces: a finance-AI forecast contract, a
rolling forecast/cash bridge fixture, a financial-intelligence statement/ratio
workpaper, and a working-capital lever register. Each surface preserves the
deterministic calculation or source trace, separates fact from inference,
retains failure evidence, and routes judgement to a reviewer.

## Currentness and model disposition

The preflight found no need to introduce a current tax rate, exchange rate,
statutory value, or IFRS treatment. Durable control concepts come from the
local doctrine and matched skills; any future current claim must pass Digital
Research source evaluation and verification before use.

On 2026-09-19 the official OpenAI model catalogue and release pages were
checked for the pinned execution model. `gpt-5.6-luna` is available and suited
to cost-sensitive execution; the local `.codex/ensure_model_policy.py
--runtime codex --check` passed in both canonical repositories. The authorised
Luna execution pin is retained. Account entitlement and latency/cost in this
specific run are not independently measured (`NOT_ASSESSED`).

| Claim ID | Source ID and scope | Publication/as-of | Access/verify/review | Status and limitation |
|---|---|---|---|---|
| CUR-001 | `OPENAI-MODELS`; official OpenAI model catalogue; `gpt-5.6-luna` availability and stated task fit | Catalogue as accessed 2026-09-19 | 2026-09-19 / 2026-09-19 / 2026-10-19 | `verified` for catalogue scope; account entitlement remains `NOT_ASSESSED` |
| CUR-002 | `OPENAI-GPT56`; official GPT-5.6 launch page; family availability/context | 2026-07-30 | 2026-09-19 / 2026-09-19 / 2026-10-19 | `context-bound`; does not establish this runtime's entitlement |
| CUR-003 | `OPENAI-RELEASES`; official release notes; Codex model-retirement context | 2026-09-14 | 2026-09-19 / 2026-09-19 / 2026-10-19 | `context-bound`; used only for currentness review |
| CUR-004 | `LOCAL-CODEX-POLICY`; both repositories' policy helper checks | 2026-09-19 | 2026-09-19 / 2026-09-19 / 2026-10-19 | `verified` for local configuration check; no account or latency claim |

Source locations: [OpenAI Models](https://platform.openai.com/docs/models/gpt-4-turbo-and-gpt-4),
[GPT-5.6 launch](https://openai.com/index/gpt-5-6/), and [OpenAI Release Notes](https://openai.com/products/release-notes/).

## Kaizen record

| Step | Record |
|---|---|
| Observe | Existing skills described controls but lacked one shared AI evidence contract and explicit failure fixtures for forecast and working-capital decisions. |
| Baseline | Evidence chain and deterministic bridge were described in separate skills; production/model behaviour and human sign-off were `NOT_ASSESSED`. |
| Select | Add four small, skill-owned references/examples with normal and failure paths. |
| Experiment | Use test-labelled data, deterministic formulas, source IDs, explicit statuses, and reviewer decision records. |
| Check | Re-perform arithmetic and run documentation/structure and finance-native validators. |
| Standardise | Link the artifacts from the owning skills and root README; retain the prior control boundaries. |
| Teach | Add the files to the skill `References`/`Files` sections and the engine README. |
| Re-measure | Re-audit by 2026-10-19 or when a real forecast/model consumer is supplied. |

## Safety boundary and deferred evidence

No posting, source promotion, period change, production model, client fact,
statutory filing, or professional sign-off was performed. Production data
quality, deployed model behaviour, current source verification for a real
engagement, independent controller re-performance, and ledger integration are
`NOT_ASSESSED`.
