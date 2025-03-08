---
sidebar_position: 99
---

# worker_host_domain

## Synopsis

`worker_host_domain` = _domain_

Setting this value forces the worker to use the given domain to authenticate
the proxy user.  Without this setting, the local computer domain will be
used, then any visible network domains will used until the account it
authenticated or authentication fails.

## Example

`worker_host_domain = mydomain`

## Defaults

(empty)

