# Uganda EFRIS Offline and Device Operations

The supplied offline requirements and installation guide describe an offline
enabler between the seller system and URA. Public URA guidance currently
describes bounded offline operation and an upload deadline; the exact BIRDC
deployment and limits require current URA confirmation.

## Operating modes

| Mode | User-visible meaning | Control |
|---|---|---|
| Online | Authority response is obtained before final fiscal print | Timeout and unknown-result reconciliation |
| Authority-approved offline | Local fiscal operation is bounded and later uploaded | Enabler/device identity, clock, storage, upload age, exception log |
| Manual exception | System/enabler cannot operate | Numbered manual evidence, reason, owner, and upload within verified deadline |
| Disabled/not configured | Fiscal capability is not activated | Fail closed for production claims |

Never label an internal provisional receipt as an authority fiscal document.
Whether a provisional print is legally permitted is a current-source gate.

## Device boundary

Register each device/branch/thumbprint against the correct taxpayer profile.
Record device number, location, software version, certificate/thumbprint
approval, activation/deactivation history, and responsible operator. A single
offline enabler must not silently serve multiple TINs; obtain written authority
confirmation for any shared deployment.

## Recovery and ageing

Track each offline item from local creation through upload, authority response,
and reconciliation. Alert before the verified deadline, quarantine expired or
unmatched items, and expose a manual escalation path. Preserve local evidence
even after a successful upload.

Installation versions, ports, runtime dependencies, hardware requirements, and
local endpoints from the supplied v1.6 guide are deployment notes only. Pin them
to the approved URA package and test on the actual BIRDC host before release.
