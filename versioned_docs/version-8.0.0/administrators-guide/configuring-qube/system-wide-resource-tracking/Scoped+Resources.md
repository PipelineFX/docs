---
sidebar_position: 9
---

# Scoped Resources

Scoped resources are similar to global resources in that they govern a resource available to the entire system. However, they may also be restricted on a per-host basis as well. For example, a site may have a certain number of software licenses, and be restricted to running only one instance of the software per host.

Therefore, the scoped resource specification must not only be set in Supervisor qb.conf, but also for the Worker in either a local qb.conf or the global qbwrk.conf:

## Supervisor
```
supervisor_global_resources = resspec [, resspec,...]
```

## Worker
```
worker_resources = resspec [, resspec,...]
```

Instead of global however, resspec uses the keyword scoped;
```
scoped.name=quantity
```

When thinking about how to set up a scoped resource, ask these two questions:

1. How many total resources are available (Supervisor)?
2. How many can each host get (Worker)?

## Example
In this example we have a site with ten Nuke licenses, but only one is allowed to run per host:
```
supervisor_global_resources = scoped.nuke=10
worker_resources = scoped.nuke=1
```

## See Also
* [supervisor_global_resources](../../configuration-parameter-reference/supervisor_global_resources)
* [worker_resources](../../configuration-parameter-reference/worker_resources)

