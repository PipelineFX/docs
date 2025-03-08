---
sidebar_position: 67
---

# supervisor_migrate_timeout

## Synopsis

`supervisor_migrate_timeout` =  _timeout_

The _timeout_ value, in seconds, specifies how much time a job must wait
before the host it was migrated off becomes available to it again.

## Example
```
supervisor_migrate_timeout = 100
```

## Defaults

1200

