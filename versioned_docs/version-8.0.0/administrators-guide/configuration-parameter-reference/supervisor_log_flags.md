---
sidebar_position: 54
---

# supervisor_log_flags

## Synopsis

`supervisor_log_flags` = _mask_

_Mask_ specifies which events the administrator wants to track in the job's
history file. The field is described by a integer with the individual bits to
signify which components to log.

## Values

Flag | Value
---|---
job | 1
subjob | 2
work | 4
callback | 8
user | 16
admin | 32
mail | 64

## Examples
```
supervisor_log_flags = 3  
```
or
```
supervisor_log_flags = "job,subjob"
```

## Defaults
```
supervisor_log_flags = "job,subjob,work,callback,user,admin,mail"
```

