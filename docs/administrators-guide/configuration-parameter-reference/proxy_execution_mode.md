---
sidebar_position: 29
---

# proxy_execution_mode

## Synopsis

`proxy_execution_mode` =  _mode_

_Mode_ sets the execution mode for the proxy, either under the submitting user, or under a single "proxy" userid.

## Values

* **user** : Run jobs under the submitting user's userid.  (Note: the submitting user's account must exist on all workers - typically via a central authentication system)
* **proxy** : Run jobs under proxy_account userid.

## Example

```
proxy_execution_mode = user
```

## Defaults

proxy

## See Also

[Service Mode Authentication: User vs Proxy](../configuring-qube/worker-configuration/Service+Mode+Authentication+User+vs+Proxy)

[proxy_account](./proxy_account)

[proxy_password](./proxy_password)

