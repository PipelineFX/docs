---
sidebar_position: 57
---

# supervisor_manifest

## Synopsis

`supervisor_manifest` =  _path_

_path_ were the manifest log is located. This log contains all events
concerning jobs and their actions. The format is similar to the job \*.hst file
format and provides a quick mechanism for looking at all logged events at one
time.

## Example
```
supervisor_manifest = /tmp/manifestlog
```

## Defaults

OS | Path
---|---
Linux & macOS: | /var/spool/qube/manifestlog
Windows: | C:\ProgramData\pfx\qube\logs\manifestlog

## See Also

[supervisor_manifest_flags](./supervisor_manifest_flags)

