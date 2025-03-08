---
sidebar_position: 30
---

# proxy_location

## Synopsis

`proxy_location` =  _path_

This specifies the physical location of the proxy application. It can be used to replace the proxy, or to specify where the proxy is if the administrator has located it in a different place.

## Example

```
proxy_location = /home/qube/sbin/proxy
```

## Defaults

* **Linux & macOS**: `$QBDIR/sbin/proxy`
* **Windows** : `%QBDIR%\sbin\proxy.exe`

