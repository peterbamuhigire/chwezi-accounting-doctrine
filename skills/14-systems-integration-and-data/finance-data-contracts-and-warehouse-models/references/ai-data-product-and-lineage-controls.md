# AI Data Product and Lineage Controls

This reference is a self-contained synthesis prepared from Sanjeev Mohan,
*Designing the AI-Driven Data Foundations: Architecture, Principles, and
Practice*.

## Finance data-product contract

Every finance data product names its business owner, consumers, reporting basis,
source systems, grain, dimensions, freshness, quality rules, lineage, access,
retention, residency, cost, reconciliation, and change owner. Keep operational,
analytical, and AI access distinct while preserving drilldown to source evidence.

## AI controls

For retrieval, analytics, or agent use, add data classification, permission
inheritance, prompt/tool boundary, stale-data behaviour, abstention, audit event,
human review, and rollback. Session-level cost and latency belong in operational
evidence. No AI output may bypass posting, approval, period, or reconciliation
controls.
