---
sidebar_position: 109
---

# worker_max_threads

## Synopsis

`worker_max_threads` = _threads_

Where _threads_ is the total number of Worker threads. By adjusting this
field, the administrator may improve the Worker's performance. However the
increase in threads also increases the Worker's memory requirements. The
Worker typically doesn't need a lot of threads to deal with normal usage.

## Example

```
worker_max_threads = 10
```

## Defaults

8

