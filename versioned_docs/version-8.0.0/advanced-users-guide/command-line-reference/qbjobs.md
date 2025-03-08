---
sidebar_position: 12 
---

# qbjobs

## Description
**qbjobs** displays a list of currently active jobs in the Qube queueing system software.

## Usage
qbjobs [options] [JobID...|0]

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

With no arguments, qbjobs only lists the current user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --waiting | Display waiting jobs |
| --pending | Display pending jobs |
| --suspended | Display suspended jobs |
| --blocked | Display blocked jobs |
| --running | Display running jobs |
| --failed | Display failed jobs |
| --killed | Display killed jobs |
| --complete | Display complete jobs |
| --done | Display done (complete,failed,killed) jobs |
| --active | Display active (pending,running,blocked) jobs |
| --flags string... | Display jobs which have string flags enabled |
| --user string | Display jobs for the user login string |
| --cluster string | Display jobs with cluster string |
| --name string | Display jobs with string name |
| --label string | Display jobs with string label |
| --type string --prototype string | Display jobs with string type |
| --kind string | Display jobs with string kind |
| --priority int | Display jobs with int priority |
| --pgrp int | Display jobs with int pgrp ID |
| --pid int | Display jobs with int pid |
| --expression \<exp> | Display jobs which satisfy expression \<exp> |
| --status | Display the subjob and agenda status |
| --times | Display the start/complete times |
| --reverse | Reverse the sort order of the jobs |
| --password | Display encrypted password |
| --sortby string | Sort the jobs by string field |
| --long | Display jobs with additional detail |
| --data | Display jobs with data/package information |
| --delimit char | Format output using the char delimiter |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
With no arguments, qbjobs only lists the current user's jobs.

## Examples

## See Also
