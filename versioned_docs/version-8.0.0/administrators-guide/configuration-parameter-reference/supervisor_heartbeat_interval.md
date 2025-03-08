---
sidebar_position: 46
---

# supervisor_heartbeat_interval

## Synopsis

`supervisor_heartbeat_interval` =  _interval_

_Interval_ is the duration in seconds, within which the Workers must report
their status to the Supervisor. Any Worker not reporting within the _interval_
 is contacted for a status report. That request must be answered before
`supervisor_hearbeat_timeout` seconds - if not, the Worker is marked as
"down".

## Example
```
supervisor_heartbeat_interval = 1000
```

## Defaults

360

## See Also

[supervisor_heartbeat_timeout](./supervisor_heartbeat_timeout)

