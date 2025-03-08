---
sidebar_position: 2
---

# Supervisor Logs

The Supervisor outputs log information to a file called supelog. By default, the file is located in:

| OS            | Path                                 |
|---------------|--------------------------------------|
| Linux / macOS | /var/log/supelog                     |
| Windows       | C:\ProgramData\pfx\qube\logs\supelog |

:::tip Linux Note
Under Linux, the logs are periodically rolled over by an installed crontab script.
:::

## Setting the location of the Supervisor log file

1. Modify the following setting in the qb.conf file: \
&emsp;[supervisor_logfile](../../configuration-parameter-reference/supervisor_logfile) = logfile_path \
&emsp;where logfile_path is the path to the Supervisor log file.

2. Restart the Supervisor to establish the new setting.

