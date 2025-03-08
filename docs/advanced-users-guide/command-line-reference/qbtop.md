---
sidebar_position: 30
---

# qbtop

## Description
**qbtop** requests the Supervisor to move a job/jobs to the top relative to other jobs having the same priority.

## Usage 
qbtop [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --running | Top running jobs | |
| --pending | Top pending jobs |
| --blocked | Top blocked jobs |
| --user string | Top jobs for user string |
| --type string --prototype string | Top jobs with string type |
| --status string | Top jobs with string status (ex. pending) |
| --name string | Top jobs with string name |
| --kind string | Top jobs of string kind |
| --pid int | Top jobs with process ID int |
| --pgrp int | Top jobs in int process group |
| --priority int | Top jobs with int priority |
| --cluster string | Top jobs in string cluster |
| --cpus int | Top jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Move all subjobs in 12345:

% **qbtop** 12345

Move all of user anthony's jobs:

% **qbtop** --user anthony 0

Move all of user anthony's jobs which are running:

% **qbtop** --running --user anthony 0

## See also
[qbmodify](qbmodify)

[qbbottom](qbbottom)
