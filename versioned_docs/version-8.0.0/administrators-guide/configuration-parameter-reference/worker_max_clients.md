---
sidebar_position: 108
---

# worker_max_clients

## Synopsis

`worker_max_clients` = _clients_

_Clients_ is the maximum number of network messages a thread is allowed to
service before dying. By increasing this number, the administrator is able to
reduce the overhead of threads which re-spawn. The penalty however, is the
inability to release unused memory quickly.

## Example

```
worker_max_clients = 128
```

## Defaults

256

