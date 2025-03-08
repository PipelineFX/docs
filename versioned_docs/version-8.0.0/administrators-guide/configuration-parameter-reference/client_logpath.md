---
sidebar_position: 8
---

# client_logpath

## Synopsis

`client_logpath` =  _path_

When this specifies a valid path to the qube job logs, the client utilities will read the job logs directly off the network, rather than requesting the supervisor to send them.

## Example

```
client_logpath = \\server\share\qube\logs  
client_logpath=/mnt/qube/logs/
```

## Defaults

None

## See Also

[Writing Job Logs to a Network Filesystem](../configuring-qube/log-files/Writing+Job+Logs+to+a+Network+Filesystem)

