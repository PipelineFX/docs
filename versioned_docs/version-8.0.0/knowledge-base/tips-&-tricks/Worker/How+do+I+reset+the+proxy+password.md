---
sidebar_position: 4
---

# How do I reset the proxy password?

Get the encrypted password string by using qblogin:

```
qblogin --display --user <proxyuser>
```

where _proxyuser_ is the username for the proxy user. After successfully
entering the password, an encrypted version of the password will be output.

Paste the proxy_password entry in the qb.conf:

```
proxy_password = <password>
```

where _password_ is the encrypted string.

