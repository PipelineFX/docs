---
sidebar_position: 2
---

# How do I set the Qube! database user's password?

The supervisor installer installs its own copy of PostgreSQL, running on a
non-standard port 50055, and creates and uses the user "qube" to access the
database named "pfx". The "qube" user is the owner of the "pfx" database.

(An OS user "pfx" is also created by the installer, who owns the data files
and runs the server processes.)

The password to the "qube" user is left blank by default, but you can set it
if you desire. Refer to the PostgreSQL reference on pg_hba.conf file and ALTER
ROLE:

https://www.postgresql.org/docs/9.6/static/auth-pg-hba-conf.html

https://www.postgresql.org/docs/9.6/static/sql-alterrole.html

Once PostgreSQL is configured to use password authentication, you need to
configure the Supervisor by editing its qb.conf to set the password, with the
following parameter:

* [database_password](/administrators-guide/configuration-parameter-reference/database_password)

