---
sidebar_position: 10 
---

# Starting and Stopping the PostgreSQL Database Server

Here's how to stop or start the PostgreSQL server on the supervisor machine on a command prompt.

## Linux:
As the "root" user:

```
systemctl stop postgresql-pfx
systemctl start postgresql-pfx
```

or

```
service postgresql-pfx stop
service postgresql-pfx start
```

## Mac:

```
sudo launchctl stop com.pipelinefx.postgresql
sudo launchctl start com.pipelinefx.postgresql
 
```

## Windows:

```
net stop postgresql-pfx
net start postgresql-pfx
```

or

```
"C:\Program Files\pfx\qube\utils\service_supervisor" --postgresqlstop
"C:\Program Files\pfx\qube\utils\service_supervisor" --postgresqlstart
```
