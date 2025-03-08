---
sidebar_position: 100
---

# worker_idle_threads

## Synopsis

`worker_idle_threads` = _threads_

The idle number of Worker threads. This allows the Worker to maintain a
specified number of threads ready to service network messages. If the Worker
finds that it is unable to satisfy the incoming traffic, it will spawn
additional threads up to [worker_max_threads](./worker_max_threads).

## Example

```
worker_idle_threads = 3
```

## Defaults

4

