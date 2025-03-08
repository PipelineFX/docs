---
sidebar_position: 64
---

# supervisor_max_threads

## Synopsis

The total number of Supervisor threads, the upper bound on the size of the
Supervisor thread pool.  This may contain idle Supervisor threads.

`supervisor_max_threads` =  _threads_

:::note
This does not include the 7 additional threads the Supervisor opens to
identify idle hosts ready to run jobs, contact dead Workers, and to execute
time-based events.
:::

By adjusting this field, the administrator may improve the Supervisor's
performance. The increase in threads, however, also increases Supervisor
memory requirements. Be mindful of memory usage on the Supervisor after making
an adjustment.

:::danger[PostgreSQL max_connections]
When increasing supervisor_max_threads, you _**must**_ increase the
max_connections value in PostgreSQL's postgresql.conf file on the supervisor.
Increasing supervisor_max_threads without also increasing the DB's
max_connections may lead to Supervisor threads that cannot communicate with
the database, rendering them useless and potentially leading to lost work. The
DB's max_connections should be set to supervisor_max_threads + 100. For
example, if the Supervisor's supervisor_max_threads = 128, DB's
max_connections should be set to 228. By default, max_connections is set to
500, which should be sufficiently large for most cases.
:::

## Recommendations

  * less than 100 workers: 128 threads
  * 101 - 200 workers: 150 threads
  * 201 - 400 workers: 250 threads
  * 401 - 750 workers: 350 threads
  * 751+ : 500 threads *

We recommend you do not go above 350 threads unless the disk on which the database resides is  _very_ fast, dedicated to PostgreSQL, is local to the Supervisor,  _and_ 350 threads has proven to be too low to meet your rendering needs.

## Example

supervisor_max_threads = 64

## Defaults

128

## See Also

<!-- [How the supervisor controls its thread count](./supervisor_thread_count) -->

[supervisor_idle_threads](./supervisor_idle_threads)

[supervisor_max_clients](./supervisor_max_clients)

