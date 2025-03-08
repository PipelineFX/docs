---
sidebar_position: 55
---

# supervisor_logfile

## Synopsis

`supervisor_logfile` =  _path_

_Path_ is used to specify the single log file for the supervisor's internal
operations.  This is not the same as
[supervisor_logpath](./supervisor_logpath) which determines the
location of the job logs.

## Example
```
supervisor_logfile = /var/log/supelog
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/log/supelog
Windows: | C:\ProgramData\pfx\qube\logs\supelog

