---
sidebar_position: 4
---

# qbbottom

## Description
**qbbottom** requests the Supervisor to move a job/jobs below other jobs having the same priority.

## Usage 
qbbottom [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --running | Bottom running jobs |
| --pending | Bottom pending jobs |
| --blocked | Bottom blocked jobs |
| --active | Bottom active (pending,running,blocked) jobs |
| --user string | Bottom jobs for user string |
| --type string --prototype string | Bottom jobs with string type |
| --status string | Bottom jobs with string status (ex. pending) |
| --name string | Bottom jobs with string name |
| --kind string | Bottom jobs of string kind |
| --pid int | Bottom jobs with process ID int |
| --pgrp int | Bottom jobs in int process group |
| --priority int | Bottom jobs with int priority |
| --cluster string | Bottom jobs in string cluster |
| --cpus int | Bottom jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
 

## Examples
Move job 12345 to the bottom of the queue within the priority:

% **qbbottom** 12345

Move all of user anthony's jobs:

% **qbbottom** --user anthony 0

Move all of user anthony's jobs which are running:

% **qbbottom** --running --user anthony 0

## See also
qbmodify
qbtop
