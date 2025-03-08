---
sidebar_position: 89
---

# worker_boot_diagnostics_retries

## Synopsis

`worker_boot_diagnostics_retries` = _retries_

Number of times the worker should retry its boot-time diagnostic tests (check
the worker_logpath permissions, the existence of proxy program at
proxy_location, and the validity of the proxy_account) when there are errors,
before giving up and going into the "panic" state.

## Example
```
worker_boot_diagnostics_retries = 5
```

## Defaults

1

