---
sidebar_position: 7
---

# How to configure Qube! to use dedicated workers before non-dedicated workers

A Qube! farm can contain a mix of machines that users never log into, such as
machines installed in a rack in a server room (**dedicated** workers), and
user's machines that are available when they're not in use (**non-
dedicated**).  Qube! does not naturally differentiate between dedicated and
non-dedicated workers, it assumes that all
[unlocked](/administrators-guide/managing-qube/common-worker-actions/Worker+Locking)
machines are equivalent. 

If you wish to have the supervisor "prefer" to send jobs to dedicated
machines, you could add an artificial host property such as "host.dedicated"
to all workers via the qbwrk.conf, setting it to "1" for dedicated machines,
and "0" for non-dedicated.

## Via the worker's local qb.conf:

Set (or add to) the [worker_properties](/administrators-guide/configuration-parameter-reference/worker_properties)
value to make a dedicated worker:

`worker_properties = "host.dedicated=1"`

...or a non-dedicated worker:

`worker_properties = "host.dedicated=0"`

## Via the central qbwrk.conf:

In the [default] section of the qbwrk.conf make all workers non-dedicated:

`worker_properties = "host.dedicated=0"`

...then, in whatever section of the qbwrk.conf you define the dedicated
machines, (or in each dedicated machine's block in the qbwrk.conf), you would
set:

`worker_properties = "host.dedicated=1"`

Then, all your jobs would need to have their "hostorder" value set to
"host.dedicated", which will result in workers with "host.dedicated=1"
receiving jobs before the non-dedicated machines.


