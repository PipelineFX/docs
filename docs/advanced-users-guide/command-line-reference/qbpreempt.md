---
sidebar_position: 19
---

# qbpreempt

## Description
**qbpreempt** requests the Supervisor to tell a job to release its host if and when it can do so without wasting CPU time.  The job will be removed from the host when it finishes the frame or agenda item it's working on, and asks the Supervisor for another agenda item.  Instead, the Supervisor will instruct the job to "get off" the worker. 

The job instance that was removed from the worker will then go back into a pending state, and await re-dispatch as workers again become available.

This command depends upon the job type and will only work if the job that is running supports a qube agenda-based system.

## Usage 
qbpreempt [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --pos int | Starting file position at int bytes |
| --sleep int | Refresh every int seconds (default: 60) |
| --follow | Similar to "tail -f" |
| --work | Preempt work (default: on) |
| --subjob | Preempt subjobs (default: on) |
| --running | Preempt running jobs |
| --workrunning | Preempt running work |
| --subjobrunning | Preempt running subjobs |
| --user string | Preempt jobs for user string |
| --type string --prototype string | Preempt jobs with string type |
| --status string | Preempt jobs with string status (ex. pending) |
| --name string | Preempt jobs with string name |
| --kind string | Preempt jobs of string kind |
| --pid int | Preempt jobs with process ID int |
| --pgrp int | Preempt jobs in int process group |
| --priority int | Preempt jobs with int priority |
| --cluster string | Preempt jobs in string cluster |
| --cpus int | Preempt jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on jobs which are in the running state.

## Examples
Preempt only subjob 12354.0:

% **qbpreempt** 12354.0

Preempt all subjobs in 12345:

% **qbpreempt** 12345

Preempt all of user anthony's jobs:

% **qbpreempt** --user anthony 0

Preempt all of user anthony's running jobs:

% **qbpreempt** --running --user anthony 0

## See also
[qbkill](qbkill)

[qbinterrupt](qbinterrupt)

[qbmigrate](qbmigrate)
