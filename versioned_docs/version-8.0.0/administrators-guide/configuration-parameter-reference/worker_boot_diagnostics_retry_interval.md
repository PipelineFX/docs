---
sidebar_position: 90
---

# worker_boot_diagnostics_retry_interval

## Synopsis

`worker_boot_diagnostics_retry_interval` = _interval_

Number of seconds the worker should wait before retrying the boot-time
diagnostic test in case of errors (see also
[worker_boot_diagnostics_retries](./worker_boot_diagnostics_retries)).

## Example
```
worker_boot_diagnostics_retry_interval = 15
```

## Defaults

30

