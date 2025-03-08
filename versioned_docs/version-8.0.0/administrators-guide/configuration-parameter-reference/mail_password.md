---
sidebar_position: 23
---

# mail_password

## Synopsis

`mail_password` = _password_

_password_ is the password of the SMTP user account, [mail_user](./mail_user), on the SMTP server, pointed to by [mail_host](./mail_host), used by the supervisor to send various email messages, such as system critical events, license notifications, etc..

## Example

```
mail_password = mysecretpasswd
```

## Defaults

\<undefined\>

