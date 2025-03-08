---
sidebar_position: 22
---

# qbresume

## Description
**qbresume** resumes a job which has been suspended.

## Usage 
qbresume [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --suspended | Resume suspended jobs |
| --user string | Resume jobs for user string |
| --type string --prototype string | Resume jobs with string type |
| --status string | Resume jobs with string status (ex. pending) |
| --name string | Resume jobs with string name |
| --kind string | Resume jobs of string kind |
| --pid int | Resume jobs with process ID int |
| --pgrp int | Resume jobs in int process group |
| --priority int | Resume jobs with int priority |
| --cluster string | Resume jobs in string cluster |
| --cpus int | Resume jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
This command only works on jobs which are suspended.

## Examples
Resume only subjob 12354.0:

% **qbresume** 12354.0

Resume all subjobs in 12345:

% **qbresume** 12345

Resume all of anthony's jobs:

% **qbresume** --user anthony 0 

## See also
[qbsuspend](qbsuspend)
