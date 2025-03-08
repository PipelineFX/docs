---
sidebar_position: 49
---

# supervisor_host_policy

## Synopsis

`supervisor_host_policy` =  _policy_

_Policy_ is a designation for how the Supervisor determines which Workers
will be allowed to join the farm.

## Values

* **open** - no restrictions, any host can join
* **restricted** - hosts must be specified by name or address in the [supervisor_worker_configfile](./supervisor_worker_configfile)
* **restrictedbyname** - hosts must be specified by name in the [supervisor_worker_configfile](./supervisor_worker_configfile)
* **restrictedbyaddress** - hosts must be specified by IP address in the [supervisor_worker_configfile](./supervisor_worker_configfile)

## Example
```
supervisor_host_policy = restrictedbyaddress
```

## Defaults

open

