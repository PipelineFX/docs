---
sidebar_position: 16 
---

# qbmigrate

## Description
**qbmigrate** requests the Supervisor to tell a job to release its host immediately. This job is then restricted from starting on the same host(s) again for the duration of supervisor_migrate_timeout.

## Usage 
qbmigrate [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option                | Description                                   |
|-----------------------|-----------------------------------------------|
| --work                | Migrate work (default: on)                    |
| --subjob              | Migrate subjobs (default: on)                 |
| --running             | Migrate running jobs                          |
| --pending             | Migrate pending jobs                          |
| --user string         | Migrate jobs for user string                  |
| --type string --prototype string | Migrate jobs with string type      |
| --status string       | Migrate jobs with string status (ex. pending) |
| --name string         | Migrate jobs with string name                 |
| --kind string         | Migrate jobs of string kind                   |
| --pid int             | Migrate jobs with process ID int              |
| --pgrp int            | Migrate jobs in int process group             |
| --priority int        | Migrate jobs with int priority                |
| --cluster string      | Migrate jobs in string cluster                |
| --cpus int            | Migrate jobs with a total of int subjobs      |
| --xml                 | Output in XML format                          |
| --help                | Command help                                  |
| --version             | Command version                               |

## Notes
This command only works on running jobs.

## Examples
Migrate only subjob 12354.0:

% **qbmigrate** 12354.0

Migrate all subjobs in 12345:

% **qbmigrate** 12345

Migrate all of anthony's jobs:

% **qbmigrate** --user anthony 0

Migrate all of anthony's jobs which are running:

% **qbmigrate** --running --user anthony 0

## See also
