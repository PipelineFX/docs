---
sidebar_position: 1
---

# First Come, First Served (FCFS)
The queue algorithm is a simple first-in, first-out system. Jobs are queued out
in the order in which they are submitted. In this queuing scheme, jobs are
sorted by their IDs, so jobs with lower IDs will be dispatched to run before
jobs with higher IDs.


If priority and cluster specification are the same, the job ID will be used to
determine priority as the ultimate "tiebreaker."


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
In this example we have a site with ten Nuke licenses, but only one is allowed
to run per host:
```
supervisor_global_resources = scoped.nuke=10
worker_resources = scoped.nuke=1
```

## See Also
* [supervisor_global_resources](../../configuration-parameter-reference/supervisor_global_resources)
* [worker_resources](../../configuration-parameter-reference/worker_resources)

