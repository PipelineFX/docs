---
sidebar_position: 103
---

# worker_log_timeout

## Synopsis

`worker_log_timeout` = _time_

Amount of time the Worker will wait in seconds before transmitting the job
log's standard output and standard error to the Supervisor if the log mode is
set to "remote."

## Example

```
worker_log_timeout = 900
```

## Defaults

10

