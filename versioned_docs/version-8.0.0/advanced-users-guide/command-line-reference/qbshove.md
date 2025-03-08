---
sidebar_position: 25
---

# qbshove

## Description
**qbshove** requests the Supervisor to re-evaluate the dispatch of a list of jobs.  Normally, a job is re-evaluated to see if it is a dispatch candidate when an "event" of some sort occurs; the job is submitted or modified, a Worker becomes free, etc. Sometimes job or Worker information has changed, but no event has occurred that will make the Supervisor re-evaluate the job list.

:::warning
Do not run this command on a periodic basis in an attempt to increase the dispatch rate of your farm.  Qube! is not a polling system, and doesn't wait for a certain amount of time before it re-evaluates all jobs.  Repeatedly running qbshove will only increase the load on your Supervisor, possibly resulting in diminished performance.
:::

## Usage 
qbshove [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --pending | Shove pending jobs |
| --running | Shove running jobs |
| --user string | Shove jobs for user string |
| --type string --prototype string | Shove jobs with string type |
| --status string | Shove jobs with string status (ex. pending) |
| --name string | Shove jobs with string name |
| --kind string | Shove jobs of string kind |
| --pid int | Shove jobs with process ID int |
| --pgrp int | Shove jobs in int process group |
| --priority int | Shove jobs with int priority |
| --cluster string | Shove jobs in string cluster |
| --cpus int | Shove jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on jobs which are considered pending or running.

## Examples
Shove job 12345:

% **qbshove** 12345

Shove all of user anthony's jobs:

% **qbshove** --user anthony 0

## See also
