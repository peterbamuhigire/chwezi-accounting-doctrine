# Fixture: Rejected Unsupported Costing Method

## Setup

- Entity claims IFRS or IFRS for SMEs compliance.
- SKU costing method is set to `LIFO`.

## Expected result

- Posting or policy approval is rejected.
- Reason: unsupported costing method for the claimed framework.
- Reviewer action: change to FIFO, weighted-average, or approved specific identification, or mark the output non-compliant with an explicit caveat.
