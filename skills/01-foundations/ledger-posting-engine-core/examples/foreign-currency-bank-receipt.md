# Fixture: Foreign Currency Bank Receipt

## Source event

- Event type: `customer_receipt`
- Transaction currency: foreign currency
- Functional currency: entity currency
- Source amount: `1,000.00`
- Functional amount: required
- Exchange-rate source-register key: required for final output.

## Expected behavior

- Bank line carries transaction currency amount.
- AR clearing line carries equivalent functional amount.
- Exchange difference, if any, posts to approved FX gain or loss account.
- Final output is blocked when the exchange-rate source entry is missing or stale.
