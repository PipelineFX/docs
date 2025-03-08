---
sidebar_position: 29
---

# qbsuspend

## Description
**qbsuspend** issues a suspend command upon the job's processes. Jobs can be resumed using the command qbresume.

## Usage 
qbsuspend [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs. 

## Options
| Option | Description |
| ---    | ---         |
| --running | Suspend running jobs | |
| --subjobrunning | Suspend running subjob |
| --user string | Suspend jobs for user string |
| --type string --prototype string | Suspend jobs with string type |
| --status string | Suspend jobs with string status (ex. pending) |
| --name string | Suspend jobs with string name |
| --kind string | Suspend jobs of string kind |
| --pid int | Suspend jobs with process ID int |
| --pgrp int | Suspend jobs in int process group |
| --priority int | Suspend jobs with int priority |
| --cluster string | Suspend jobs in string cluster |
| --cpus int | Suspend jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on jobs which are int the running state. 

## Examples
Suspend only subjob 12354.0:

% **qbsuspend** 12354.0

Suspend all subjobs in 12345:

% **qbsuspend** 12345

Suspend all of user anthony's jobs:

% **qbsuspend** --user anthony 0

## See also
[qbresume](qbresume)
