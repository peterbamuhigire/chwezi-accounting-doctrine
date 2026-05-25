# Inventory Domain Acceptance Tests

| Test | Expected result |
|---|---|
| FIFO receipt and sale | Oldest layers are relieved; COGS equals relieved layer cost. |
| Weighted-average receipt and sale | Average cost recalculates after receipt; issue uses current average. |
| Stock count variance | Approved difference posts to variance account through posting service. |
| NRV write-down | Inventory value is written down when NRV is below cost; evidence retained. |
| Unsupported costing method | LIFO or unsupported method is rejected when IFRS or IFRS for SMEs compliance is claimed. |
| Control tie-out | SKU-location valuation equals inventory control account. |
| Negative-stock policy | Unauthorized negative quantity is rejected. |
| Tax source gate | Final taxable inventory posting has source-register-backed tax code. |
