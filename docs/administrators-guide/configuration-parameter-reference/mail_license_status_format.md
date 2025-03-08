---
sidebar_position: 22
---

# mail_license_status_format

## Synopsis

`mail_license_status_format` = _file_

 _File_ defines the format to use when sending warning mail about expiring licenses.

## Example

```
mail_license_status_format = /etc/license.mail
```

## Defaults

| OS             | Path                                       |
|----------------|--------------------------------------------|
| Linux & macOS: | /usr/local/pfx/qube/etc/license.mail       |
| Windows:       | C:\Program Files\pfx\qube\etc\license.mail |

## See Also

[Variables available for expansion in supervisor's mailed reports](../../developers-guide/Variables+available+for+expansion+in+supervisors+mailed+reports)

