---
sidebar_position: 35
---

# How to use clustering for workers

Lets say you wish to partition your render farm into two departments, post
and promo. Qube! supports the idea of partitioning your render farm into
"clusters". You can divide up your farm between any number of departments,
while still allowing the departments to share the machines.

As an example, you could allocate some of your render nodes to the /post
cluster, and some to the /promo cluster (Qube! workers - your render nodes -
belong to one and only one cluster). Users would submit their jobs to either
the /post cluster or the /promo cluster - this can be configured so that it's
transparent to the user.

A worker in the /post cluster will run the lowest-priority job in the /post
cluster before it will run the highest-priority job in the /promo cluster.

A worker in the /promo cluster will run the lowest-priority job in the /promo
cluster before it will run the highest-priority job in the /post cluster.

You could also add machines to the / cluster (the "root" cluster). Workers
in the / cluster will give equal priority to jobs from all departments.


The simplest way to set a worker's cluster is in WranglerView running on the
supervisor, see:[Centralized Worker Configuration](/centralized-worker-configuration).

The relavant configuration parameter is
[worker_cluster](/administrators-guide/configuration-parameter-reference/worker_cluster).

```
worker_cluster = /post
```

## Clustering and restrictions

Optionally, some or all workers in either the /post or /promo cluster can be
configured to _only_ run jobs in their respective clusters via the
worker_restrictions value. You can have some of the /post workers be
available to promo department if there are no post jobs, while other /post
workers will remain dedicated to the post department.

The most common case is that the worker is restricted to only accepting jobs
that are submitted into the worker's cluster:

```
worker_cluster = /promo
worker_restrictions = /promo
```

but more complex scenarios are outline in the documentation for
[worker_restrictions](/administrators-guide/configuration-parameter-reference/worker_restrictions).

## See Also

* [Clustering](/administrators-guide/configuring-qube/queuing-algorithms/Clustering)
* [Job Priority](/advanced-users-guide/job-reference/Job+Priority)
* [worker_cluster](/administrators-guide/configuration-parameter-reference/worker_cluster)
* [worker_restrictions](/administrators-guide/configuration-parameter-reference/worker_restrictions) 
* [How to use qbwrk.conf](/knowledge-base/how-to/How+to+use+qbwrk.conf)

