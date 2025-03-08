---
sidebar_position: 20
---

# qbremove

## Description
**qbremove** requests the Supervisor to remove a list of jobs.

## Usage 
qbremove [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

:::danger
Job removal is a fairly database- and disk-intensive operation; avoid removing a very large number of jobs at one time. Limit job removal to 1000 jobs at a time, and wait a few minutes between removals to avoid the supervisor's filesystem getting swamped with table deletion operations.
:::

## Options
| Option | Description |
| ---    | ---         |
| --failed | Remove failed jobs |
| --killed | Remove killed jobs |
| --complete | Remove complete jobs |
| --done | Remove done (complete,killed,failed) jobs |
| --pending | Remove pending jobs (admin only) |
| --running | Remove running jobs (admin only) |
| --active | Remove active (running,pending,blocked) jobs (admin only) |
| --user string | Remove jobs for user string |
| --type string --prototype string | Remove jobs with string type |
| --status string | Remove jobs with string status (ex. pending) |
| --name string | Remove jobs with string name |
| --kind string | Remove jobs of string kind |
| --pid int | Remove jobs with process ID int |
| --pgrp int | Remove jobs in int process group |
| --priority int | Remove jobs with int priority |
| --cluster string | Remove jobs in string cluster |
| --cpus int | Remove jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |


## Notes
This command only works on jobs which are considered complete, unless the use has the Qube 'admin' privilige, in which case the user could conceivably remove all jobs in queue.

For non-admin users, jobs which are still pending or running will be ignored. (ex. pending, running, blocked, suspended). 

Refer to User Permissions or qbusers for more detail on the Qube! permission scheme.

## Examples
Remove job 12345:

% **qbremove** 12345

Remove all of user anthony's jobs:

% **qbremove** --user anthony 0

## See also
Clean Up Old Jobs Automatically
