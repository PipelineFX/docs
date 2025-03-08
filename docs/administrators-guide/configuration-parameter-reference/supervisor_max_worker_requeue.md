---
sidebar_position: 65
---

# supervisor_max_worker_requeue

## Synopsis

`supervisor_max_worker_requeue` =  _retries_

_Retries_ is the maximum number of attempts the Supervisor will make to
assign a job to a Worker host that claims to have available CPUs. It will
continue to make the attempts every 4 minutes until the  _retries_  attempts
have been made and give up on that host until the next event, either a job
submission or modification.

## Example
```
supervisor_max_worker_requeue = 12
```

## Defaults

8

