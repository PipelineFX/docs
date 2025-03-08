---
sidebar_position: 33
---

# qb_directory

## Synopsis

`qb_directory` =  _path_

 _Path_  is the path to the directory containing the Qube! distribution.
Normally this distribution directory would be the one that contains the
Supervisor daemon executable.

:::note[Note for Qube Worker hosts]

This is a Worker startup parameter. Since this parameter is involved in the
initial startup of the worker and affects the behavior of the worker before it
contacts the supervisor to request a "remote" configuration from the central
worker configuration file (see [qbwrk.conf](../../centralized-worker-configuration)),
it's considered a _bootstrapping_ parameter and  _can only be specified in the
worker's local qb.conf_  configuration file. Any mention in the global
qbwrk.conf file will be ignored.

This is a complete list of the Worker bootstrap parameters  

* [qb_directory](./qb_domain)
* [qb_domain](./qb_domain)
* [qb_supervisor](./qb_supervisor)
* [worker_address](./worker_address)
* [worker_boot_delay](./worker_boot_delay)
* [worker_journal_location](./worker_journal_location)
* [worker_lookup](./worker_lookup)
* [worker_max_threads](./worker_max_threads)
* [worker_pidfile](./worker_pidfile)
* [worker_port](./worker_port)

## Example
```
qb_directory =/apps/pfx/qube
```

## Defaults

| OS       | Path                        |
|----------|-----------------------------|
| Linux:   | `/usr/local/pfx/qube`       |
| macOS:   | `/Applications/pfx/qube`    |
| Windows: | `C:\Program Files\pfx\qube` |

