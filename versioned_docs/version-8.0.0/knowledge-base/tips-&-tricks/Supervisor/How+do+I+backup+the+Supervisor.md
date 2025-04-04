---
sidebar_position: 1
---

# How do I backup the Supervisor?

You can use standard backup tools. Here is a list of files that are critical:

* supervisor_logfile: /var/spool/supelog
* supervisor_logpath: /var/spool/qube
* qb_directory: /usr/local/pfx/qube
* /etc/qb.conf
* /etc/qbwrk.conf
* /etc/init.d/supervisor
* PostgreSQL data directory:
  * /usr/local/pfx/pgsql/data (Linux)
  * /Applications/pfx/pgsql/data (Mac)
  * C:\Program Files\pfx\pgsql\data (Windows)

To back up the PostgreSQL database, you can make a copy of the data directory
as listed above, or use PostgreSQL's pg_dump and/or pg_dumpall tool.

The pg_dump tool can be found in the locations below:

OS |PATH
---|---
Linux|/usr/local/pfx/pgsql/bin
macOS|/Applications/pfx/pgsql/bin
Windows|C:\Program Files\pfx\pgsql\bin

Following are examples for Linux:

**Backup**:

```sql
pg_dumpall -p 50055 -U pfx > /some/path/to/backup.dump
```

**Restore**:

```bash
/usr/local/pfx/qube/utils/pgsql/init_supe_db.py --erase
/usr/local/pfx/pgsql/bin/psql -p 50055 -U postgres -d pfx -f /some/path/to/backup.dump
```

For more details, consult:
https://www.postgresql.org/docs/9.6/static/backup-dump.html

