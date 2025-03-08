---
sidebar_position: 71
---

# supervisor_pidfile

## Synopsis

`supervisor_pidfile` =  _path_

_Path_ is where the Supervisor writes the process ID for the main
controlling process.

## Example
```
supervisor_pidfile = /tmp/supepid
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/run/Supervisor.pid
Windows: | C:\ProgramData\pfx\qube\logs\supervisorpid

