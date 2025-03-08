---
sidebar_position: 58
---

# supervisor_manifest_flags

## Synopsis

`supervisor_manifest_flags` = _mask_

_Mask_ specifies which events the administrator wants to track in the
manifestlog. The field is described by a integer with the individual bits to
signify which components to log. This log is located by default here:

OS | Path
---|---
Linux & macOS: | /var/spool/qube/manifestlog
Windows: | C:\ProgramData\pfx\qube\logs\manifestlog

## Values

Flag | Value
---|---
job | 1
subjob | 2
work | 4


## Examples
```
supervisor_manifest_flags = 3  
supervisor_manifest_flags = "job,subjob"
```

## Defaults
```
supervisor_manifest_flags="job,subjob,work"
```

## See Also

[supervisor_manifest](./supervisor_manifest)

