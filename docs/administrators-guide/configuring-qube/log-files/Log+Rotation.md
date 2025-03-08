---
sidebar_position: 5
---

# Log Rotation

The Qube! supervisor and workers communicate between themselves in order to coordinate the dispatch and running of jobs, and log this communication in the supelog and workerlog files respectively.  Over time, these logs may become very large, can consume an inordinate amount of disk space, and can be unwieldy to should they need to be read for troubleshooting purposes.

Automated log rotation on the supervisor and workers is available via a Windows Scheduled Task, launchctl on macOS, and a cron job on Linux.

## Setup and configuration
<details>
<summary>
Linux
</summary>
**Setup**
No additional tasks are necessary for log rotation on Linux.  

**Configuration**
The log rotation on Linux is managed by the Linux daemon logrotated , and is specified in `/etc/logrotate.d/supervisor` .  See the man pages for logrotated if you wish to customize the rotation policies.

**Rotation Policy**
Rotate out the logs weekly, keeping 4 copies.
</details>

<details>
<summary>
macOS
</summary>
**Setup**
No additional tasks are necessary for log rotation on macOS.   

**Configuration**
The log rotation on macOS is managed by launchctl/launchd, and the associated .plist files are:
```
    /Library/LaunchDaemons/com.pipelinefx.logrotate.supervisor.plist
    /Library/LaunchDaemons/com.pipelinefx.logrotate.worker.plist
```
Both of these plists call `/Applications/pfx/qube/utils/logrotate.py`; see The [logrotate.py](./The+Logrotate+Script) script.

**Rotation Policy**
Rotate out the logs when they exceed 100MB in size (the default size in the logrotate.py script).
</details>

<details>
<summary>
Windows
</summary>
**Setup**
Enabling log rotation on Windows requires that the Python programming language be installed and in the System SEARCH PATH.  The easiest way to accomplish this is to download and install a free Community Edition version of Python from http://www.python.org. Download and run one of these installers, and allow it to add Python to the System Search Path.  You should see the logs rotate out within the hour. If you're unsure which version to install, choose the 64-bit installer.

**Configuration**
All Scheduled Tasks call `%QBDIR%/pfx/qube/utils/logrotate.py`, with only the path to the log as an argument.  

**Rotation Policy**
Rotate out the logs when they exceed 100MB in size (the default size in the logrotate.py  script).
</details>

## Verifying that log rotation is occurring
Locate the log directory

| OS             | Path                         |
|----------------|------------------------------|
| Linux & macOS: | /var/log/                    |
| Windows:       | C:\ProgramData\Pfx\qube\logs |

You will see at least on workerlog or supelog file.  When rotation occurs, these logs are renamed and/or zipped/compressed.

* supelog --> supelog.1
* supelog.1 --> supelog.2.zip
* supelog.2.zip --> supelog.3.zip
* supelog.3.zip --> supelog.4.zip
* supelog.4.zip is deleted

You will only see supelog and supelog.1 the first time the rotation occurs.  The other files will appear when additional log rotation cycles occur as time passes.

