---
sidebar_position: 1
---

# Bootstrapping Parameters

Parameters involved in the initial startup of the worker and affecting the behavior of the worker before it contacts the supervisor to request a "remote" configuration from the central worker configuration file (see qbwrk.conf), it's considered a bootstrapping parameter and can only be specified in the worker's local qb.conf configuration file. Any mention in the global qbwrk.conf file will be ignored.

This is a complete list of the Worker bootstrap parameters

* [qb_directory](../../configuration-parameter-reference/qb_directory)
* [qb_domain](../../configuration-parameter-reference/qb_domain)
* [qb_supervisor](../../configuration-parameter-reference/qb_supervisor)
* [worker_address](../../configuration-parameter-reference/worker_address)
* [worker_boot_delay](../../configuration-parameter-reference/worker_boot_delay)
* [worker_journal_location](../../configuration-parameter-reference/worker_journal_location)
* [worker_lookup](../../configuration-parameter-reference/worker_lookup)
* [worker_max_threads](../../configuration-parameter-reference/worker_max_threads)
* [worker_pidfile](../../configuration-parameter-reference/worker_pidfile)
* [worker_port](../../configuration-parameter-reference/worker_port)
