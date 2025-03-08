---
sidebar_position: 34
---

# qb_domain

## Synopsis

`qb_domain` =  _qube_domain_name_

The qb_domain value is distinct and separate from the DNS domain name
(e.g.  pipelinefx.com) or an ActiveDirectory domain name.

::::note[Note for Qube Worker hosts]

This is a Worker startup parameter. Since this parameter is involved
in the initial startup of the worker and affects the behavior of the 
worker before it contacts the supervisor to request a "remote"
configuration from the central worker configuration file (see
[qbwrk.conf](../../centralized-worker-configuration)), it's considered 
a _bootstrapping_ parameter and  _can only be specified in the worker's
local qb.conf_  configuration file. Any mention in the global qbwrk.conf 
file will be ignored.

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

## Usage Notes

The qb_domain is best left to the default value unless the administrator
intends to set up 2 or more farms, in which case only the smaller of the two
farms should use a non-default value.

A Qube! Supervisor will not respond to any request or transaction from a
worker or client whose qb_domain value does not match its own. 

If a Supervisor receives a worker registration request (such as when a new
worker first starts up on the farm), but detects a mismatch between the
workers and Supervisor's qb_domain value, the worker's registration request is
rejected, and the worker will attempt to find another supervisor to bind to. 
If there are no more supervisors to reply to the worker, the worker will never
appear in any supervisor's worker list.

If the request is a from a Qube! client, the request is ignored, and the
client will attempt to locate another supervisor.  If no supervisors is found
whose qb_domain value matches the client's, the client will usually issue an:

```
ERROR: udp receive socket timed out.
```

error message.

### About supervisor auto-discovery

:::warning[&emsp;]
Since auto-discovery uses network broadcast packets, and these packets are not
forwarded by routers, supervisors can only be discovered if they are on the
same IP subnet as the host issuing the broadcast.
:::

Qube workers that don't have the supervisor explicitly defined via the
[qb_supervisor](./qb_supervisor) value can issue a broadcast
across the network and ask any supervisor that's running to respond.  This is
normally sufficient unless there are multiple supervisors on the network that
can respond to the broadcast (on the same IP subnet as the worker).  In this
case, the [qb_domain](./qb_domain) value provides a check for
the auto-discovery mechanism: the [qb_domain](./qb_domain) value
is compared between the supervisor and the worker, and the supervisor only
responds to requests from workers whose [qb_domain](./qb_domain)
value matches the supervisor's.

## Example
```
qb_domain = MyDomain
```

## Defaults
```
qb_domain = qube
```

:::warning[&emsp;]
It's inadvisable to vary from the default qb_domain value for the main part of
your farm.
:::

The reason to stick with the defaults is that if you deviate from the default
qb_domain value on the Supervisor, you have to set it on every client and
worker in order to achieve proper operation.  Any new machines you add _will
require this configuration change before they will work properly_.  Deviating
from the default doesn't provide any advantages, and it's one more thing to
miss during new host setup.

