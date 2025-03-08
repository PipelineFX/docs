---
sidebar_position: 7
---

# Specifying a Worker's Job Slots

The maximum number of job instances that a Worker can run is specified by the [worker_cpus](../../configuration-parameter-reference/worker_cpus) parameter. This value can be set in either the worker's local qb.conf file, or the centrally-managed qbwrk.conf file.

By default, Qube sets the number of job slots equal to the number of CPU cores on the system.  

:::warning
Hyper-threaded cores are seen as a core, so a machine with 12 physical cores that has hyper-threading enabled and worker_cpus=0 will be configured with 24 job slots.
:::

:::tip
If the usage of your farm will exclusively consist of jobs that are expected to run as many threads as there are cores in the system (multi-threaded rendering often can auto-detect the number of cores), it is often advisable to set the maximum number of processes that a Worker can run to 1 instead of the maximum number of cores since multi-threaded processes themselves can automatically take advantage of all available cores; this an application-specific solution, and is commonly used with AfterEffects, Cinema4D, Maya software renderer, mentalray, Pixar RenderMan, etc. When configured this way, your users will never have to ensure that the job's slot reservations match the thread count.
:::

In this example, set the number of job slots to 2:
```
worker_cpus = 2
```
