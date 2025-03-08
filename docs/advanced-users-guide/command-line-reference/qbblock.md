---
sidebar_position: 3
---

# qbblock

## Description
**qbblock** requests the Supervisor to suspend a job by immediately killing it, and marking it as blocked. This will effectively stop a job and place it in an idle state to be requeued or killed later.

## Usage 
qbblock [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs. 

## Options
| Option | Description |
| ---    | ---         |
| --work | Block work (default: on) | |
| --subjob | Block subjobs (default: on) |
| --running | Block running jobs |
| --pending | Block pending jobs |
| --workrunning | Block running work |
| --workpending | Block pending work |
| --subjobrunning | Block running subjob |
| --subjobpending | Block pending subjob |
| --user string | Block jobs for user string |
| --type string --prototype string | Block jobs with string type |
| --status string | Block jobs with string status (ex. pending) |
| --name string | Block jobs with string name |
| --kind string | Block jobs of string kind |
| --pid int | Block jobs with process ID int |
| --pgrp int | Block jobs in int process group |
| --priority int | Block jobs with int priority |
| --cluster string | Block jobs in string cluster |
| --cpus int | Block jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
**This command only works on jobs which are considered active. Jobs which have already completed will be ignored. (ex. complete, killed, failed)**

In order to kill jobs, the user must have either of the following qube privileges:
- block
- admin

Refer to User Permissions or qbusers for more detail on the Qube! permission scheme

## Examples
Block only subjob 12354.0:

% **qbblock 12354.0**

Block all subjobs in 12345:

% **qbblock 12345**

Block all of user anthony's jobs:

% **qbblock --user anthony 0**

Block all of user anthony's jobs which are running:

% **qbblock --running --user anthony 0**

Block only the jobs which are pending in the list of jobs 11234, 1235, and subjob 1236.0:

% **qbblock --pending 11234 1235 1236.0**

## See Also
qbunblock
