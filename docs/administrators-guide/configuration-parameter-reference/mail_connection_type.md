---
sidebar_position: 17
---

# mail_connection_type

## Synopsis

`mail_connection_type` = _connType_

_connType_ is one of DEFAULT, SSL, or TLS, which describes the connection type to the SMTP email server pointed to by [mail_host](./mail_host). Setting this to DEFAULT tells the system that it should use the SMTP default port 25 (overridable by [mail_port](./mail_port)), which is conventionally unencrypted and thus insecure.

## Example

```
mail_connection_type = TLS
```

## Defaults

DEFAULT

