---
sidebar_position: 101
---

# worker_job_types

## Synopsis

`worker_job_types` = _jobtypes_

_Jobtypes_ lists the job types this Worker is allowed to execute. The
Administrator, if setting this field, must ensure that the job types in fact
exist on the server before dispatching jobs to it.

## Example

```
worker_job_types = cmdline,cmdrange
```

## Defaults

\<auto-detected\>

