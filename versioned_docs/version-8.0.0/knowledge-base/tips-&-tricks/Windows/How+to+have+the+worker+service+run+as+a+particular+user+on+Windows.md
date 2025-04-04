---
sidebar_position: 4
---

# How to have the worker service run as a particular user on Windows

Configure the service to log on a a particular user. This user must be in the
local Administrator's group, and the following User Rights Assigments policies
must be applied to both the Administrator's and Network Service groups:

* replace a process-level token
* act as part of the operating system
* adjust memory quota for process

:::danger[Permissions]
Remember, the worker will read from and write to log files. The user under
which it runs must have read/write access where appropriate. PipelineFX
advises that you do not change the user under which either the worker or
supervisor service runs unless absolutely necessary.
:::

