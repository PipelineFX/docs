---
sidebar_position: 83
---

# supervisor_universal_callback_path

## Synopsis

`supervisor_universal_callback_path` = _path[,path]_

Specify path to the directory where Universal Callbacks (the callbacks.conf
file and the implementation files) are found. May be a comma-separated list to
specify multiple locations.

## Example

```
supervisor_universal_callback_path = /apps/qube/callbacks
```

## Defaults

$QBDIR/callback

