---
sidebar_position: 35
---

# qb_supervisor

## Synopsis

`qb_supervisor` =  _supervisor_

A host name or ip address which the client applications will access for
information about the queue.

:::note[Note for Qube! Worker hosts]
This is a Worker startup parameter. Since this parameter is involved in the
initial startup of the worker and affects the behavior of the worker before it
contacts the supervisor to request a "remote" configuration from the central
worker configuration file (see
[qbwrk.conf](/Documentation/centralized-worker-configuration)), it's considered
a _bootstrapping_ parameter and  _can only be specified in the worker's local
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
qb_supervisor = sv001
```

## Defaults

(empty - Automatically detected)

In the absence of a qb_supervisor value, workers and clients will resort to
"supervisor auto-discovery" and attempt to find a supervisor by network
broadcast.

### About supervisor auto-discovery

:::warning[&emsp;]
Since auto-discovery uses network broadcast packets, and these packets are not
forwarded by routers, supervisors can only be discovered if they are on the
same IP subnet as the host issuing the broadcast.

Qube! workers that don't have the supervisor explicitly defined via the
[qb_supervisor](./qb_supervisor) value can issue a broadcast
across the network and ask any supervisor that's running to respond.  This is
normally sufficient unless there are multiple supervisors on the network that
can respond to the broadcast (on the same IP subnet as the worker).  In this
case, the [qb_domain](./qb_domain) value provides a check for
the auto-discovery mechanism: the [qb_domain](./qb_domain) value
is compared between the supervisor and the worker, and the supervisor only
responds to requests from workers whose [qb_domain](./qb_domain)
value matches the supervisor's.

## Notes

* Although Qube! supports auto-discover of its Supervisor on the same subnet,
it is more efficient if the Supervisor has been explicitly specified. The clients
will always default to auto-discovery if blank.
* This parameter is only applicable for the Worker or Client.

## See Also

[qb_domain](./qb_domain)

