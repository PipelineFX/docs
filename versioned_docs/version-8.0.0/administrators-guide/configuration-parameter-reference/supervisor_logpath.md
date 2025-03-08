---
sidebar_position: 56
---

# supervisor_logpath

## Synopsis

`supervisor_logpath` =  _path_

_Path_ is used to specify the log directory to use to store job log data as
well as individual host and user histories. This is further explained in this
documentation under [Job Logs](../../administrators-guide/configuring-qube/log-files/Job+Logs)

## Example
```
supervisor_logpath = /var/spool
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/spool/qube
Windows: | C:\ProgramData\pfx\qube\logs

## See Also

[Writing Job Logs to a Network Filesystem](../../administrators-guide/configuring-qube/log-files/Writing+Job+Logs+to+a+Network+Filesystem)

