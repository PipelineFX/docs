---
sidebar_position: 106
---

# worker_logpath

## Synopsis

`worker_logpath` =  _path_

_Path_ specifies the directory which the Worker will create/use for the
job's standard output and standard error logging.

## Example

```
worker_logpath = /logs/qube
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/spool/qube
Windows: | C:\ProgramData\Pfx\Qube\logs

## See Also

[Writing Job Logs to a Network Filesystem](../configuring-qube/log-files/Writing+Job+Logs+to+a+Network+Filesystem)

