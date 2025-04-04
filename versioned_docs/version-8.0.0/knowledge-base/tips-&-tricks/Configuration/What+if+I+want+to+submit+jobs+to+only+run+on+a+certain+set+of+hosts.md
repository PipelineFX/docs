---
sidebar_position: 4
---

# What if I want to submit jobs to only run on a certain set of hosts?
The simplest way to accomplish this is to put the set of workers into a
[host group](/administrators-guide/configuring-qube/worker-configuration/Worker+Host+Groups).
Workers in a host group will accept any job, but jobs will only run on workers
that are in the group specified by the job's
[hosts](/advanced-users-guide/job-reference/Controlling+Host+Selection) value.

## See Also

[Controlling Host Selection](/advanced-users-guide/job-reference/Controlling+Host+Selection)

