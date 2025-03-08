---
sidebar_position: 2
---

# Priority
The priority algorithm is a numeric priority queue. Normally, the priorities are established such that lower values are considered to have higher priority. For example, a job with priority 1 will have a higher priority than a job with priority 10.

The default priority of all jobs is set in the Supervisor configuration, like so:

`supervisor_default_priority = 9999`

If this configuration parameter is not set, jobs submitted will have a default priority of 9999. Job priority can also be set by the user on job submission, subject to possible limits set by supervisor_highest_user_priority

:::warning

In the case of similar cluster specifications, priority values will be checked.

:::

## See Also
* [supervisor_default_priority](../../configuration-parameter-reference/supervisor_default_priority)
* [supervisor_highest_user_priority](../../configuration-parameter-reference/supervisor_highest_user_priority)
* [supervisor_max_priority](../../configuration-parameter-reference/supervisor_max_priority)

