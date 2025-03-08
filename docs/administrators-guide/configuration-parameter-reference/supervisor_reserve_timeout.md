---
sidebar_position: 79
---

# supervisor_reserve_timeout

## Synopsis

`supervisor_reserve_timeout` =  _timeout_
_

The _timeout_ value, in seconds, specifies how much time a job is allowed
to hold a host in reserve before that job reports itself "running." If this
timeout passes, the job is assumed to be a start failure and the host is
released for use by other jobs.

## Example

```
supervisor_reserve_timeout = 100
```

## Defaults

600

