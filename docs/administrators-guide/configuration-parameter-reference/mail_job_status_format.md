---
sidebar_position: 21
---

# mail_job_status_format

## Synopsis

`mail_job_status_format` = _file_

 _File_ contains the format to use when sending job status to a user via email.

## Example

```
mail_job_status_format = /etc/job.mail
```

## Defaults

| OS             | Path                                   |
|----------------|----------------------------------------|
| Linux & macOS: | /usr/local/pfx/qube/etc/job.mail       |
| Windows:       | C:\Program Files\pfx\qube\etc\job.mail |

## See Also

[Variables available for expansion in supervisor's mailed reports](../../developers-guide/Variables+available+for+expansion+in+supervisors+mailed+reports)

