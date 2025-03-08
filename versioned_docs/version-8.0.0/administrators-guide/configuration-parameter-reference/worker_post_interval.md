---
sidebar_position: 113
---

# worker_post_interval

## Synopsis

`worker_post_interval` = _time_

_Time_ specifies how often the Worker should report its status to the
Supervisor when it doesn't have anything to do. It is meant to keep the
Supervisor up-to-date in the event it forgets about the Worker. The default is
12 hours.

## Example

```
worker_post_interval = 600
```

## Defaults

43200

