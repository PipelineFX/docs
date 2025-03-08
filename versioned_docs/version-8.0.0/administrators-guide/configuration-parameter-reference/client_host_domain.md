---
sidebar_position: 6
---

# client_host_domain

## Synopsis

This field is used when sending client messages to the system (such as when
submitting jobs, etc.) to override the client environment's Windows domain
name.

## Example

```
client_host_domain = MYDOMAIN
```

## Defaults

* **Linux & macOS**: (not set)
* **Windows** : current domain  the domain is automatically detected if client_host_domain is left empty.

