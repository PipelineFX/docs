---
sidebar_position: 32
---

# proxy_password

## Synopsis

Proxy_password must be set when using a [`proxy_account`](./proxy_account) other than the default, local "qubeproxy" account.

The proxy_password value must be set to the encrypted string returned by the [qbhash](../../advanced-users-guide/command-line-reference/qbhash) tool. Cut and paste the value returned by qbhash into the proxy_password field.

## Example

```
proxy_password = 06dee4e09a917474ea788e4f5c105bc505cf8a5629be461d3415fe60cbbbba6a
```

## Defaults

## See Also

[proxy_account](./proxy_account)

[proxy_execution_mode](./proxy_execution_mode)

