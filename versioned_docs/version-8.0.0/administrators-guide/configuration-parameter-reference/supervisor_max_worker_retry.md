---
sidebar_position: 66
---

# supervisor_max_worker_retry

## Synopsis

`supervisor_max_worker_retry` =  _retries_

_Retries_ is the total number of attempts the Supervisor will make before
giving up on a Worker host. When a host is marked as DOWN, the Supervisor will
check the host on a periodic basis to insure that hosts which may have been
temporarily lost (due to scenarios such as a dead network) the Supervisor will
however stop trying to contact the host after it has tried to do so, and the
max retry limit has been reached.

## Example
```
supervisor_max_worker_retry = 128
```

## Defaults

64

