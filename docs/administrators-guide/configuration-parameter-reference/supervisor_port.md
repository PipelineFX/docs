---
sidebar_position: 74
---

# supervisor_port

## Synopsis

`supervisor_port` =  _port_

The network port number the Supervisor will use. Important: This must be
configured the same on all Worker hosts and client hosts.

## Example

```
supervisor_port = 2500
```

## Defaults

50001

:::warning[&emsp;]
This port is setting is not IETF compliant.
:::

