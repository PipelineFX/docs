---
sidebar_position: 34
---

# qbusers

## Description
Modifies the permissions for an individual user.\
To modify the default permissions for all users not explicitly granted
privileges with qbusers, you must modify
[supervisor_default_security](/administrators-guide/configuration-parameter-reference/supervisor_default_security)
in the Supervisor's qb.conf file, and then restart the Supervisor service.

## Usage 
qbusers options [user...]

where JobID is one or more job IDs, and 0 is a wild card token representing
all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --add | add permission | |
| --delete | delete permission |
| --set | set to only permission |
| --group [group] | modify group permissions |
| --drop | drop user from Qube! |
| --submitjob | permit submit job |
| --submitcallback | permit submit callback |
| --submitglobalcallback | permit submit global callback |
| --kill | permit kill job |
| --remove | permit remove job |
| --modify | permit modify job |
| --preempt | permit preempt job |
| --block | permit block job |
| --interrupt | permit interrupt job |
| --unblock | permit unblock job |
| --suspend | permit suspend job |
| --resume | permit resume job |
| --bump | permit bump job |
| --migrate | permit migrate job |
| --retry | permit retry job
| --requeue | permit requeue job |
| --shove | permit shove job |
| --fail | permit fail job |
| --retire | permit retire job |
| --all | permit all privileges |
| --admin | permit admin privilege |
| --sudo | permit sudo admin privilege |
| --impersonate | permit impersonation |
| --lock | permit lock/unlock of workers |
| --list | list all users (see codeTable) |
| --member | list all users w/groups |
| --help | help for qbusers |

## Permission listing code table
| Code | Explanation |
|------|-------------|
|   | **Administrative** |
| a | admin - user has admin permissions |
| s | sudo admin - user has sudo admin permissions |
| i | impersonate user - user may submit job as any user |
| l | lock host - user may lock/unlock workers |
|   | **Submission** |
| j | submit job |
| c | submit callback |
| g | submit global callback |
|   | **Job Control** |
| k | kill job |
| r | remove job |
| m | modify job |
| p | preempt job |
| b | block job |
| u | unblock job |
| i | interrupt job |
| c | complete job |
| s | suspend job |
| e | resume job |
| y | retry job |
| q | requeue job |
| g	| migrate job |
| p	| bump job (top/bottom) |
| v	| shove job |
| f	| fail job |
| t	| retire job |
| n	| reset job |

## Notes
 
## Examples
Give the user 'monkey' the ability to submit jobs:

% **qbusers** --add --submitjob monkey

Add users george, ira, and oscar to the plfx group

% **qbusers** -add --group "plfx" george ira oscar

List all users and their permissions

% **qbusers** --list
```
total 4
---l jc- krmpbuicseyqg-vft      [default]
asil jcg krmpbuicseyqgpvft      Administrator
asil jcg krmpbuicseyqgpvft      qube
asil jcg krmpbuicseyqgpvft      root
asil jcg krmpbuicseyqgpvft      system
```
(Any user not explicitly listed here falls into the [default] class.)

Next, we'll add two new users, john and sue, and give them full user permissions.

% **qbusers** --add --all john sue

modified permissions

% **qbusers** --list

```
total 6
---l jc- krmpbuicseyqg-vft      [default]
asil jcg krmpbuicseyqgpvft      Administrator
---- jcg krmpbuicseyqgpvft      john
asil jcg krmpbuicseyqgpvft      qube
asil jcg krmpbuicseyqgpvft      root
asil jcg krmpbuicseyqgpvft      system
---- jcg krmpbuicseyqgpvft      sue
 
```

Finally, we'll delete two users, john and system.

% **qbusers** --drop john system

modified permissions

% **qbusers** --list

```
total 4
---l jc- krmpbuicseyqg-vft      [default]
asil jcg krmpbuicseyqgpvft      Administrator
asil jcg krmpbuicseyqgpvft      qube
asil jcg krmpbuicseyqgpvft      root
---- jcg krmpbuicseyqgpvft      sue
```

## See also
[Permissions](/administrators-guide/configuring-qube/Permissions)
