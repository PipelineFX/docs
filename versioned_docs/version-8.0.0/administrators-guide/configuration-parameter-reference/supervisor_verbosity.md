---
sidebar_position: 85
---

# supervisor_verbosity

## Synopsis

`supervisor_verbosity` = _flags_

_Flags_ is a list of options that determines what information to write into
the supervisor log.

## Values

  * admin
  * auth
  * callback
  * command
  * debug
  * error
  * file
  * host
  * info
  * job
  * license
  * log
  * memory
  * preempt
  * query
  * queue
  * security
  * startupwork
  * subjob
  * sync
  * warning
  * web

## Example

```
supervisor_verbosity = startup,work,subjob
```

## Defaults

admin,auth,callback,command,error,file,host,info,job,license,log,memory,preempt,query,queue,security,startup,subjob,sync,warning,web,work

