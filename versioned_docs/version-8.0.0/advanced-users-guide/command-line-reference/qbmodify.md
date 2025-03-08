---
sidebar_position: 17 
---

# qbmodify

## Description
**qbmodify** requests the Supervisor to modify a list of jobs.

## Usage 
qbmodify [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option                | Description                                   |
|-----------------------|-----------------------------------------------|
| --running | Modify running jobs |
| --pending | Modify pending jobs |
| --blocked | Modify blocked jobs |
| --suspended | Modify suspended jobs |
| --active | Modify active (running,pending,blocked) jobs |
| --mname string | Modify job name to string |
| --mpriority int | Modify job priority to int |
| --mrequirements string | Modify job requirements to string |
| --mrestrictions string | Modify job restrictions to string |
| --mreservations string | Modify job reservations to string |
| --mcluster string | Modify cluster to string |
| --mcpus int | Modify requested number of instances to int |
| --mmax_cpus int (or "\*") | Modify max number of instances ("\*" means "no limit") |
| --mgroups string,...  | Modify host groups to string list |
| --mhosts string,...  | Modify host list to string list |
| --mhostorder string | Modify host order specification to string |
| --mtimeout int | Modify timeout limit to int seconds |
| --magenda_timeout [timeout] | modify agenda timeout limit |
| --mretrysubjob [retry] |	modify subjob retry count |
| --mretrywork [retry] |	modify work retry count |
| --mretrywork_delay [delay] |	modify work retry delay (in seconds) |
| --mmailaddress [mail] |	modify email address |
| --mnotes [notes] |	modify job notes |
| --mpgrp [pgrp] |	modify job pgrp |
| --mprod_show [show] |	modify production show name |
| --mprod_shot [shot] |	modify production shot name |
| --mprod_seq [seq] |	modify production seq name |
| --mprod_client [client] |	modify production client name |
| --mprod_dept [dept] |	modify production dept name |
| --mprod_custom1 [data] |	modify production custom data 1 |
| --mprod_custom2 [data] |	modify production custom data 2 |
| --mprod_custom3 [data] |	modify production custom data 3 |
| --mprod_custom4 [data] |	modify production custom data 4 |
| --mprod_custom5 [data] |	modify production custom data 5 |
| --qinterrupt | Interrupt the modified jobs |
| --qpreempt | Preempt the modified jobs |
| --qblock | Block the modified jobs |
| --user string | Modify jobs for user string |
| --type string --prototype string | Modify jobs with string type |
| --status string | Modify jobs with string status (ex. pending) |
| --name string | Modify jobs with string name |
| --kind string | Modify jobs of string kind |
| --pid int | Modify jobs with process ID int |
| --pgrp int | Modify jobs in int process group |
| --priority int | Modify jobs with int priority |
| --cluster string | Modify jobs in string cluster |
| --cpus int | Modify jobs with a total of int subjobs |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Modify job 12345 to priority 10:

% **qbmodify** --mpriority 10 12345

Modify all of user anthony's jobs to request 3 CPUs:

% **qbmodify** --user anthony --mcpus 3 0

## See also
qbpreempt

qbpreemptqbblock

qbinterrupt
