---
sidebar_position: 25
---

# mail_subjob_status_format

## Synopsis

`mail_subjob_status_format` = _file_

_File_ is a file containing the format to use when sending subjob status to a user via email.

## Example

```
mail_subjob_status_format = /etc/subjob.mail
```

## Defaults

| OS             | Path                                      |
|----------------|-------------------------------------------|
| Linux & macOS: | /usr/local/pfx/qube/etc/subjob.mail       |
| Windows:       | C:\Program Files\pfx\qube\etc\subjob.mail |

## See Also

[Variables available for expansion in supervisor's mailed reports](../../developers-guide/Variables+available+for+expansion+in+supervisors+mailed+reports)

