---
sidebar_position: 36
---

# supervisor_address

## Synopsis

`supervisor_address` = _IPaddress_

_IPaddress_ is used lock down the Supervisor to a specific IP address. This
is used for hosts with multiple interface cards as with multiple IP addresses
assigned to it. By default the Supervisor will use all IP addresses on the
host.

## Example
```
supervisor_address = 192.168.1.50
```

## Defaults

"all ip addresses on host"

