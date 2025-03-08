---
sidebar_position: 31
---

# qbunblock

## Description
qbunblock requests the Supervisor to unblock a job and make it immediately available for execution on the farm.

## Usage 
qbunblock [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --work | Unblock work (default: on) | |
| --subjob | Unblock subjobs (default: on) |
| --running | Unblock running jobs |
| --pending | Unblock pending jobs |
| --blocked | Unblock blocked jobs |
| --workrunning | Unblock running work |
| --workpending | Unblock pending work |
| --workblocked | Unblock blocked work |
| --subjobrunning | Unblock running subjob |
| --subjobpending | Unblock pending subjob |
| --subjobblocked | Unblock blocked subjobs |
| --user string | Unblock jobs for user string |
| --type string --prototype string | Unblock jobs with string type |
| --status string | Unblock jobs with string status (ex. pending) |
| --name string | Unblock jobs with string name |
| --kind string | Unblock jobs of string kind |
| --pid int | Unblock jobs with process ID int |
| --pgrp int | Unblock jobs in int process group |
| --priority int | Unblock jobs with int priority |
| --cluster string | Unblock jobs in string cluster |
| --cpus int | Unblock jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Unblock only subjob 12354.0:

% qbunblock 12354.0

Unblock all subjobs in 12345:

% qbunblock 12345

Unblock all of user anthony's jobs:

% qbunblock --user anthony 0

## See also
[qbblock](qbblock)
