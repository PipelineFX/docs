---
sidebar_position: 86
---

# supervisor_worker_configfile

## Synopsis

`supervisor_worker_configfile` = _file_

_File_ is the Worker config file used for centralized Worker configuration.
The Supervisor has the ability to use a macro-based configuration system via
the Worker config file.

## Example

```
supervisor_worker_configfile = /etc/myqbworkers.conf
```

## Defaults

OS | Path
---|---
Linux & macOS: | /etc/qbwrk.conf  
Windows: | C:\ProgramData\Pfx\qube\qbwrk.conf

