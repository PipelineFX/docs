---
sidebar_position: 3
---

# Worker Logs

The Worker outputs log information to a file called workerlog. By default, the file is located in:

| OS            | Path                                 |
|---------------|--------------------------------------|
| Linux / macOS | /var/log/supelog                     |
| Windows       | C:\ProgramData\pfx\qube\logs\supelog |

:::tip Linux Note
Under Linux, the logs are periodically rolled over by an installed crontab script.
:::

## Setting the location of the Worker log file

1 .Modify the following setting in the Worker qb.conf or qbwrk.conf file on the Supervisor:\
&emsp;[worker_logfile](../../configuration-parameter-reference/worker_logfile) = logfile_path \
&emsp;where logfile is the path to the worker log file.

2. If the Worker qb.conf was modified, restart the Worker to establish the changes to the settings

3. If the qbwrk.conf was modified, force a Worker reconfiguration:
```
  % qbadmin worker --reconfigure
```
