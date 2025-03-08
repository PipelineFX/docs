---
sidebar_position: 104
---

# worker_logfile

## Synopsis

`worker_logfile` = _filepath_

_Filepath_ is the physical location of the Worker's log file. The Worker
writes the events/actions it takes during its execution in this file.

## Example

```
worker_logfile = /usr/tmp/workerlog
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/log/workerlog
Windows: | C:\ProgramData\pfx\qube\logs\workerlog

