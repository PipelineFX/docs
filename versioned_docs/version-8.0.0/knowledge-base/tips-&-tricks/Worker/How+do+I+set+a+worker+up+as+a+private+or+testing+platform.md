---
sidebar_position: 6
---

# How do I set a worker up as a private or testing platform?

Sometimes when testing new software versions or during application or jobtype
development, it's handy to have a worker be "isolated", and only accept
specific jobs from the supervisor. What you want to do is to set the worker
up so that it's in a certain cluster and will only accept jobs that are in
that cluster, and then to submit jobs into that cluster, and restrict the job
so that it will only run on workers in that cluster

## Set up the worker in a new private cluster

This can be accomplished with a combination of
[worker_cluster](/administrators-guide/configuration-parameter-reference/worker_cluster) and
[worker_restrictions](/administrators-guide/configuration-parameter-reference/worker_restrictions).

* set the `worker_cluster` to something unique, eg. `/testing`
* set the `worker_restriction` to the same value as the `worker_cluster`

## Submit jobs into that private cluster, and confine them to that cluster

When it's time to submit a job that you want to run on this testing platform:

* set the job's `cluster` to the same as the test worker's cluster
* set the job's `restrictions` to the same as the job's cluster.

For the duration of your testing, you may want to set the
[client_cluster](/administrators-guide/configuration-parameter-reference/client_cluster) and
[client_restrictions](/administrators-guide/configuration-parameter-reference/client_restrictions)
to this cluster, so that your jobs go to this cluster and worker by default.

