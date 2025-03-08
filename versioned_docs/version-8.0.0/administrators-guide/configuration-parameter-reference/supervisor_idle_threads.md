---
sidebar_position: 51
---

# supervisor_idle_threads

## Synopsis

`supervisor_idle_threads` = # of _threads_

The minimum number of Supervisor threads. This allows the Supervisor to
maintain a specified number of threads ready to service network messages. If
the Supervisor finds that it is unable to satisfy the incoming traffic, it
will spawn additional threads up to
[supervisor_max_threads](./supervisor_max_threads)

:::warning[&emsp;]
This doesn't include the 7 additional threads the Supervisor opens to identify
idle hosts ready to run jobs, contact dead Workers, and to execute time-based
events.
:::

By adjusting this field, the administrator may improve the Supervisor's
performance. However increasing the number of threads also increases the
Supervisor memory requirements. To prevent the system from thrashing, we
recommend using this formula to determine how much RAM is required:

`(2Mb + # of jobs * 1kb) ~= total amount of resident RAM`

## Example
```
supervisor_idle_threads = 64
```

## Defaults

50

## See Also

<!-- [How the supervisor controls its thread count](./supervisor_thread_count) -->

[supervisor_max_threads](./supervisor_max_threads)

[supervisor_max_clients](./supervisor_max_clients)

