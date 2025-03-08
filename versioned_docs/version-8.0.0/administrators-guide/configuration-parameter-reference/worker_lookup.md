---
sidebar_position: 107
---

# worker_lookup

## Synopsis

`worker_lookup` =  _precedence_

Specifies the _precedence_ for this Worker's configuration look up. This
allows an administrator to either disable all remote configuration, rely only
on remote configuration or determine which overrides the other. By default the
Supervisor's transmitted configuration overrides the local configuration.

:::note[Note for Qube! Worker hosts]

This is a Worker startup parameter. Since this parameter is involved in the
initial startup of the worker and affects the behavior of the worker before it
contacts the supervisor to request a "remote" configuration from the central
worker configuration file (see
[qbwrk.conf](../../centralized-worker-configuration)), it's considered
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

:::tip[&emsp;]
In order to prevent the worker from requesting a remote configuration from the
supervisor, set the [worker_lookup](./worker_lookup) = `local`
:::

## Examples

Use only local configuration:

```
worker_lookup = local
```

Use only remote configuration:

```
worker_lookup = supervisor
```

Local configuration overrides the Supervisor's config:

```
worker_lookup = supervisor,local
```

Supervisor's configuration overrides the local config:

```
worker_lookup = local,supervisor
```

## Defaults

local,supervisor

