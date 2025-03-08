---
sidebar_position: 47
---

# supervisor_heartbeat_timeout

## Synopsis

`supervisor_heartbeat_timeout` =  _interval_

_Interval_ is the size, in seconds, of a sliding window of time in which a
Worker must contact the Supervisor after failing to respond within the
`supervisor_heartbeat_interval` window. If there is no response, the Worker
will be marked as "down" and a second request sent. If that second request
gets no response within this timeout limit, then any instances currently
running on that Worker are migrated off. This value should be at least as
large as the value for `supervisor_heartbeat_interval`.

## Example
```
supervisor_heartbeat_timeout = 1200
```

## Defaults

720

## See Also

[supervisor_heartbeat_interval](./supervisor_heartbeat_interval)

