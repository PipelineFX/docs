---
sidebar_position: 27
---

# mail_work_status_format

## Synopsis

`mail_work_status_format` = _file_

_File_ is a file containing the format to use when sending work status to a user via email.

## Example

```
mail_work_status_format = /etc/work.mail
```

## Defaults

| OS             |                                         |
|----------------|-----------------------------------------|
| Linux & macOS: | /usr/local/pfx/qube/etc/work.mail       |
| Windows:       | C:\Program Files\pfx\qube\etc\work.mail |

## See Also

[Variables available for expansion in supervisor's mailed reports](../../developers-guide/Variables+available+for+expansion+in+supervisors+mailed+reports)

