---
sidebar_position: 16
---

# How to migrate a Qube! supervisor

:::warning[READ CAREFULLY]
**Only attempt to migrate the databases between supervisors of the same version.**

**This document applies to Qube! 7.0 and above only, where MySQL has been
replaced with PostgreSQL. Refer to older versions of this document for earlier
versions of the supervisor.**
:::

If you're doing this to install a new supervisor and want to run the latest
version of Qube! on the new supervisor, match versions between the supervisors
first, and then upgrade the new supervisor once the databases have been
migrated over to it.

If you're running Qube! 6.0 or later, you will need to contact Sales at
PipelineFX in order to get your Qube! licenses moved over to the new machine.
They'll need a MAC address for the new supervisor host.

To migrate a Qube! supervisor, you need to migrate both the PostgreSQL
databases and the job logs if the job logs are stored on the supervisor's
local disk. If your job logs are stored on the network you will not have to
move them, simply set the supervisor_logpath on the new supervisor to point to
the same network directory as the old supervisor.

It is recommended that you start moving the job logs before you start
migrating the PostgreSQL databases, as the job logs will take longer to move.

Don't forget to duplicate any settings you've changed in the old supervisor's
qb.conf.

## To migrate the PostgreSQL database

Stop the postgresql-pfx service on the old and new supervisors, then just copy
the data directory to the new supervisor host. **Make sure that the file
ownership and permissions are all preserved** (they should belong to the
"pfx" user).

The location of the data directory is:

* Linux: /usr/local/pfx/pgsql/data
* Mac: /Applications/pfx/pgsql/data
* Windows: C:\Program Files\pfx\pgsql\data

Once that's done, you should start the postgresql-pfx service and the
supervisor service on the new machine.

On the new supervisor, verify that the jobs are present:
    
`qbjobs -u all`

Verify that you can see the logs for a random job:

`qbout <someJobId>`

