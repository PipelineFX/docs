---
sidebar_position: 24
---

# qbretry

## Description
**qbretry** moves a job to pending from one of the following states:
- failed
- complete
- killed

## Usage 
qbretry [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --work | Retry work (default: on) |
| --subjob | Retry subjobs (default: on) |
| --running | Retry running jobs |
| --complete | Retry complete jobs |
| --failed | Retry failed jobs |
| --killed | Retry killed jobs |
| --done | Retry done (complete, killed, failed) jobs |
| --workcomplete | Retry complete work |
| --workfailed | Retry failed work |
| --workkilled | Retry killed work |
| --workdone | Retry done (complete, killed, failed) work |
| --subjobcomplete | Retry complete subjobs |
| --subjobfailed | Retry failed subjobs |
| --subjobkilled | Retry killed subjobs |
| --subjobdone | Retry done (complete, killed, failed) subjobs |
| --user string | Retry jobs for user string |
| --type string --prototype string | Retry jobs with string type |
| --status string | Retry jobs with string status (ex. pending) |
| --name string | Retry jobs with string name |
| --kind string | Retry jobs of string kind |
| --pid int | Retry jobs with process ID int |
| --pgrp int | Retry jobs in int process group |
| --priority int | Retry jobs with int priority |
| --cluster string | Retry jobs in string cluster |
| --cpus int | Retry jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Retry only subjob 12354.0:

% **qbretry** 12354.0

Retry all subjobs in 12345:

% **qbretry** 12345

Retry all of user anthony's jobs:

% **qbretry** --user anthony 0

## See also
