---
sidebar_position: 10 
---

# qbinterrupt

## Description
**qbinterrupt** requests the Supervisor to force a job off a host immediately killing it. The job is then placed back in the queue to be executed on another qualified host..

## Usage 
qbinterrupt [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --running | Interrupt running jobs |
| --pending | Interrupt pending jobs |
| --subjobrunning | Interrupt running subjobs |
| --subjobpending | Interrupt pending subjobs |
| --active | Interrupt active (pending,running,blocked) jobs |
| --user string | Interrupt jobs for user string |
| --type string --prototype string | Interrupt jobs with string type |
| --status string | Interrupt jobs with string status (ex. pending) |
| --name string | Interrupt jobs with string name |
| --kind string | Interrupt jobs of string kind |
| --pid int | Interrupt jobs with process ID int |
| --pgrp int | Interrupt jobs in int process group |
| --priority int | Interrupt jobs with int priority |
| --cluster string | Interrupt jobs in string cluster |
| --cpus int | Interrupt jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on jobs which are already in the running state.

In order to kill jobs, the user must have either of the following qube privileges:

- interrupt
- admin

Refer to User Permissions or qbusers for more detail on the Qube! permission scheme

## Examples
Interrupt only subjob 12354.0:

% **qbinterrupt** 12354.0

Interrupt all subjobs in 12345:

% **qbinterrupt** 12345

Interrupt all of anthony's jobs:

% **qbinterrupt** --user anthony 0

Interrupt all of anthony's jobs which are running:

% **qbinterrupt** --running --user anthony 0

## See also
qbkill
