---
sidebar_position: 5
---

# client_drive_map

## Synopsis

Each job submitted will include the drive map.  If the Worker [auto_mount](./worker_flags) flag is set, the Worker will attempt to map the \_drive_ to the \_server_.

`client_drive_map` = \{\_drive_ | \_server_\}

## Example

```
client_drive_map = {D:|//home/geebers}
```

## Defaults

(empty)

## See also

See [worker_drive_map](./worker_drive_map) for more details.

