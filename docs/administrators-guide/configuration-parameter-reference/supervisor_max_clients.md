---
sidebar_position: 59
---

# supervisor_max_clients

## Synopsis

`supervisor_max_clients` = _clients_

_Clients_ is the maximum number of network messages a thread is allowed to
service before dying. By increasing this number, the administrator is able to
reduce the overhead of threads which re-spawn. The penalty however, is the
inability to release unused memory quickly.

## Example
```
supervisor_max_clients = 128
```

## Defaults

32

## See Also

<!-- [How the supervisor controls its thread count](./supervisor_thread_count) -->

[supervisor_max_threads](./supervisor_max_threads)

[supervisor_idle_threads](./supervisor_idle_threads)

