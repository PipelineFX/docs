---
sidebar_position: 7
---

# Where is PostgreSQL software installed, and where are its data directory, configuration file, and log file?

The PostgreSQL install location is OS-specific:

## Linux:

`/usr/local/pfx/pgsql`

## Mac:

`/Applications/pfx/pgsql`

## Windows (all versions):

`C:\Program Files\pfx\pgsql`


The data directory, configuration file, and log file are all located relative
to the PostgreSQL install folder, \<PGSQL_DIR>:

data: `<PGSQL_DIR>/data`

conf: `< PGSQL_DIR>/data/postgresql.conf`

log: `< PGSQL_DIR>/pgsql.log`

