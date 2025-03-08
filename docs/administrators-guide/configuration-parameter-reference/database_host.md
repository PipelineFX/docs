---
sidebar_position: 11
---

# database_host

## Synopsis

`database_host` = _host_

 _Host_ is the host running the database server. On Linux and Mac, setting this to the empty string (which is the default) will make the supervisor connect to the DB server running on the same host using a Unix socket.

## Example
```
database_host = mydb
```

## Defaults

Linux/macOS: \"\" (empty)

Windows: _localhost_

