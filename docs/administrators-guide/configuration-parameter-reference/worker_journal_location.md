---
sidebar_position: 102
---

# worker_journal_location

## Synopsis

`worker_journal_location` = _filepath_

_Filepath_ specifies the physical location of the Worker's journal file.
The journal is the Worker's offline storage file containing what jobs it's
working on, and the details associated with them.

**Note: It is vital that this file be available in the event the Worker needs
to be restarted.**

:::note[Note for Qube! Worker hosts]

This is a Worker startup parameter. Since this parameter is involved in the
initial startup of the worker and affects the behavior of the worker before it
contacts the supervisor to request a "remote" configuration from the central
worker configuration file (see
[qbwrk.conf](../../centralized-worker-configuration)), it's considered
a _bootstrapping_ parameter and _can only be specified in the worker's local
qb.conf_ configuration file. Any mention in the global qbwrk.conf file will
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
worker_journal_location = /var/spool/qube/worker.jnl
```

## Defaults
OS | Path
---|---
Linux & macOS: | /var/spool/qube/worker.jnl
Windows: | C:\ProgramData\pfx\qube\logs\worker.jnl

