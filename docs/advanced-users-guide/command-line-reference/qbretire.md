---
sidebar_position: 23
---

# qbretire

## Description
**qretire** is used to "shrink" the number of job instances running, without throwing away work performed.  

Will request a job instance to release it host, and then go prematurely to "complete" state, even if there are pending agenda items.  This command depends upon the job type and will only work if the job that is running supports a qube agenda based system.

## Usage 
qbretire [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --work | Retire work (default: on) |
| --subjob | Retire subjobs (default: on) |
| --running | Retire running jobs |
| --user string | Retire jobs for user string |
| --type string --prototype string | Retire jobs with string type |
| --status string | Retire jobs with string status (ex. pending) |
| --name string | Retire jobs with string name |
| --kind string | Retire jobs of string kind |
| --pid int | Retire jobs with process ID int |
| --pgrp int | Retire jobs in int process group |
| --priority int | Retire jobs with int priority |
| --cluster string | Retire jobs in string cluster |
| --cpus int | Retire jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on running jobs.

## Examples
Retire only subjob 12354.0:

% **qbretire** 12354.0

Retire all subjobs in 12345:

% **qbretire** 12345

Retire all of user anthony's jobs:

% **qbretire** --user anthony 0

Retire all of user anthony's running jobs:

% **qbretire** --running --user anthony 0

## See also
[qbmodify](qbmodify)

[qbkill](qbkill)
