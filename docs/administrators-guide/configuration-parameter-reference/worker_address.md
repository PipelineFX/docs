---
sidebar_position: 87
---

# worker_address

## Synopsis

`worker_address` = _address_

Use dot notation in _address_ to set the IP address you want the Worker to
bind to. This is to override the behavior of binding to all addresses the
Worker has assigned to it.

:::note[Note for Qube! Worker hosts]
This is a Worker startup parameter. Since this parameter is involved in the
initial startup of the worker and affects the behavior of the worker before it
contacts the supervisor to request a "remote" configuration from the central
worker configuration file (see
[qbwrk.conf](../../centralized-worker-configuration)), it's considered
a _bootstrapping_ parameter and _can only be specified in the worker's local
qb.conf_  configuration file. Any mention in the global qbwrk.conf file will
be ignored.

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
:::

## Example
```
worker_address = 127.0.0.1
```

## Default

(all) (all IP addresses on this host)

