---
sidebar_position: 21
---

# qbrequeue

## Description
**qbrequeue** moves a job back into a blocked state from one of the following states: failed, complete, killed.

It's most useful to put a "done" job back into the queue, but in a waiting state, so that it can be modified before it's unblocked and allowed to run.

## Usage 
qbrequeue [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --work | Requeue work (default: on) |
| --subjob | Requeue subjobs (default: on) |
| --running | Requeue running jobs |
| --pending | Requeue pending jobs |
| --complete | Requeue complete jobs |
| --failed | Requeue failed jobs |
| --killed | Requeue killed jobs |
| --done | Requeue done (complete, killed, failed) jobs |
| --workcomplete | Requeue complete work |
| --workfailed | Requeue failed work |
| --workkilled | Requeue killed work |
| --workdone | Requeue done (complete, killed, failed) work |
| --subjobcompleterequeue | complete subjobs |
| --subjobfailed | Requeue failed subjobs |
| --subjobkilled | Requeue killed subjobs |
| --subjobdone | Requeue done (complete, killed, failed) subjobs |
| --user string | Requeue jobs for user string |
| --type string --prototype string | Requeue jobs with string type |
| --status string | Requeue jobs with string status (ex. pending) |
| --name string | Requeue jobs with string name |
| --kind string | Requeue jobs of string kind |
| --pid int | Requeue jobs with process ID int |
| --pgrp int | Requeue jobs in int process group |
| --priority int | Requeue jobs with int priority |
| --cluster string | Requeue jobs in string cluster |
| --cpus int | Requeue jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Requeue only subjob 12354.0:

% **qbrequeue** 12354.0

Requeue all subjobs in 12345:

% **qbrequeue** 12345

Requeue all of anthony's jobs:

% **qbrequeue** --user anthony 0

## See also
