---
sidebar_position: 105
---

# worker_logmode

## Synopsis

`worker_logmode` = _mode_

_Mode_ specifies what job logging action this host will take.

## Values

  * mounted: Log files are written to a directory shared via network with the Supervisor host.
  * remote: Log files are written to local directory, then periodically transferred to the Supervisor and removed from the local directory.

## Example

```
worker_logmode = mounted
```

## Defaults

remote

## See Also

[Writing Job Logs to a Network Filesystem](../configuring-qube/log-files/Writing+Job+Logs+to+a+Network+Filesystem)

