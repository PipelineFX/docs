---
sidebar_position: 13 
---

# qbkill

## Description
**qbkill** requests the Supervisor to kill a list of jobs.

## Usage 
qbkill [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --work | Kill work (default: on) |
| --subjob | Kill subjobs (default: on) |
| --running | Kill running jobs |
| --pending | Kill pending jobs |
| --blocked | Kill blocked jobs |
| --badlogin | Kill badlogin jobs |
| --workrunning | Kill running work |
| --workpending | Kill pending work |
| --workblocked | Kill blocked work |
| --subjobrunning | Kill running subjobs |
| --subjobpending | Kill pending subjobs |
| --subjobblocked | Kill blocked subjobs |
| --subjobbadlogin | Kill badlogin subjobs |
| --user string | Kill jobs for user string |
| --type string --prototype string | Kill jobs for type string |
| --status status | Kill jobs with string (ex. pending) |
| --name string | Kill jobs named string |
| --kind string | Kill jobs with string |
| --pid int | Kill jobs with process ID int |
| --pgrp int | Kill jobs in process group int |
| --priority int | Kill jobs with priority value int |
| --cluster string | Kill jobs in string cluster |
| --cpus int | Kill jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
In order to kill jobs, the user must have either of the following qube privileges:

- kill
- admin

Refer to Permissions or qbusers for more detail on the Qube! permission scheme

## Examples
Kill only subjob 12354.0:

% **qbkill** 12354.0

Kill all subjobs in 12345:

% **qbkill** 12345

Kill all of user anthony's jobs:

% **qbkill** --user anthony 0

Kill all of user anthony's jobs which are running:

% **qbkill** --running --user anthony 0

Kill only the jobs which are pending in the list of jobs 11234 1235 and subjob 1236.0:

% **qbkill** --pending 11234 1235 1236.0

## See also
qbinterrupt, qbrequeue
