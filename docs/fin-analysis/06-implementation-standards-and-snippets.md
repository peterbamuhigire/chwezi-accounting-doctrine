# Implementation Standards And Snippets

## Three-Layer Output Rule

Every generated finance output should have three layers:

| Layer | Audience | Purpose |
|---|---|---|
| Business meaning | Owner, manager, cashier, client | Explains what happened in plain language. |
| Accounting treatment | Accountant, implementer | Shows debits, credits, recognition, measurement, framework. |
| Evidence and caveats | Reviewer, auditor, tax adviser | Shows source documents, verification state, sign-off, gaps. |

Example:

```markdown
### Recording a VAT-inclusive sale

Business meaning: The customer paid the full shelf price. The business keeps the net sale amount and owes the VAT portion to the tax authority.

Accounting treatment: Debit cash or receivable for the gross amount. Credit revenue for the net amount. Credit output VAT control for the tax amount.

Evidence: Attach receipt/invoice, tax code, source-register entry, cashier identity, and settlement reference. Do not finalize if the tax rate is not verified-current.
```

## Posting Value Objects

```php
<?php
declare(strict_types=1);

final readonly class JournalEntry
{
    /**
     * @param list<JournalLine> $lines
     */
    public function __construct(
        public int $tenantId,
        public string $book,
        public string $idempotencyKey,
        public DateTimeImmutable $entryDate,
        public string $sourceType,
        public string $sourceId,
        public string $description,
        public array $lines,
        public ?int $reversesJournalId = null,
    ) {}
}

final readonly class JournalLine
{
    /**
     * @param array<string, string|int|null> $dimensions
     */
    public function __construct(
        public int $accountId,
        public string $currency,
        public int $debitMinor,
        public int $creditMinor,
        public array $dimensions = [],
    ) {}
}
```

## Ledger Invariant Test

```php
public function test_posted_journal_balances_by_currency(): void
{
    $entry = $this->fixture->vatInclusiveCashSale();

    $posted = $this->postingService->post($entry);

    $totals = $this->journalLines->totalsByCurrency($posted->journalId);

    foreach ($totals as $currency => $total) {
        self::assertSame(
            $total->debitMinor,
            $total->creditMinor,
            "Journal must balance for {$currency}"
        );
    }
}
```

## VAT-Inclusive Posting Fixture

```yaml
source:
  type: pos_sale
  gross_minor: 118000
  currency: UGX
  tax_code: UG-VAT-STANDARD
  tax_rate_source_state: verified-current
expected_journal:
  - account: cash_on_hand
    debit_minor: 118000
    credit_minor: 0
  - account: sales_revenue
    debit_minor: 0
    credit_minor: 100000
  - account: output_vat_control
    debit_minor: 0
    credit_minor: 18000
acceptance:
  - debits_equal_credits
  - tax_code_has_effective_period
  - output_vat_routes_to_control_account
  - report_drilldown_reaches_source_document
```

## Source Register Entry

```yaml
- topic: Uganda VAT standard rate
  jurisdiction: UG
  value_or_rule: "<verified value or draft placeholder>"
  source_url_or_doc: "<Tier 1 or Tier 2 source>"
  source_tier: 1
  date_accessed: "2026-05-14"
  verifier: "<named reviewer>"
  output_affected:
    - sales-tax-codes
    - vat-return-pack
  expiry_or_recheck: "2026-08-14"
  state: draft
  evidence_archive: "<path>"
  notes: "Do not use in final output until state is verified-current."
```

## Validator Requirements

Add a validator that checks:

- skill count is <= 25
- all skill frontmatter is valid
- all skills have required sections
- all declared references are present or explicitly planned
- local links resolve
- mojibake scan passes
- no final statutory values exist without source-register references
- every quality-gate blocker has a fixture
- `Last reviewed` and `Next review due` are present

