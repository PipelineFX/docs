---
sidebar_position: 24
---

# mail_port

## Synopsis

`mail_port` = _port_

_Port_ is the port number to use to contact the SMTP server.

Setting this to 0 (default) tells the system to use sensible default ports depending on the mail_connection_type-- 25 (DEFAULT), 465 (SSL), or 587 (TLS)

## Example

```
mail_port = 1025
```

## Defaults

0

