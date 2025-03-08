---
sidebar_position: 9
---

# Worker Host Groups

Host groups are a simple way to target jobs to a list of machines without specifying them explicitly every time you submit a job. These groups are unrelated to Linux groups.

To set up a host group, the Worker needs only to be configured with the list of groups it belongs to:
```
worker_groups = group [, group...]
```
where group is one or more comma-delimited group names.

## Example
```
worker_groups = myGroup, groupB
```

## See Also
* [Host Groups](../../../advanced-users-guide/job-reference/Controlling+Host+Selection)
* [worker_groups](../../configuration-parameter-reference/worker_groups)
