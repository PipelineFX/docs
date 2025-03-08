---
sidebar_position: 28
---

# proxy_account

## Synopsis

`proxy_account` = _user_

This is only to be specified if the administrator wants all jobs to be run under the single  _user_  account. By default, all jobs are run by the local "qubeproxy" account.

:::tip[&emsp;]
If the administrator would prefer jobs to be run and therefore the files to be owned by the submitting user, see [proxy_execution_mode](./proxy_execution_mode).

The proxy_account is only valid when `proxy_execution_mode=proxy`, and is ignored when `proxy_execution_mode=user`.
:::

:::warning[Windows only]
If the proxy_account is changed, the [proxy_password](./proxy_password) must also be changed.

If the administrator chooses to use a ActiveDirectory domain account for proxy_account, it is recommended that they also set [worker_host_domain](./worker_host_domain).

The proxy_account value should only the user name, and **not** include the AD name.
:::

## Example

```
proxy_account = qubeproxy
```

## Defaults

"qubeproxy"

## See Also

* [proxy_execution_mode](./proxy_execution_mode)
* [proxy_password](./proxy_password)

