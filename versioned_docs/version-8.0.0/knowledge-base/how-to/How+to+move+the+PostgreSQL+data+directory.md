---
sidebar_position: 17
---

# How to move the PostgreSQL data directory

It can be advantageous to move the directory on the supervisor which contains
the SQL database files from the root volume or C: drive to a filesystem on a
dedicated disk. This should be a separate physical disk, not just another
partition on the same disk as other partitions, otherwise you'll get almost no
benefit.

## Linux

  1. Be logged into the Supervisor as the root user
  2. Stop the Supervisor service:   
`service supervisor stop`

  3. Stop the postgresql server:   
`service postgresql-pfx stop`

  4. Copy the current datadir over to the new location **ensuring that you preserve ownership and permissions** :   
`cp -rP /usr/local/pfx/pgsql/data /newpath/pgsql/data`

  5. Rename the current datadir so that it won't be found by mistake, but leave it in place so you have a fallback plan:   
`mv /usr/local/pfx/pgsql/data /usr/local/pfx/pgsql/data.MOVED`

  6. Make a backup copy of the startup script, /usr/local/pfx/qube/utils/pgsql/startdb.sh , then edit it by changing the PGSQL_DATA_DIR to point to the new data directory.  
Optionally, you may also want to change the PGSQL_LOG to point to a new log
location.

  7. Make a backup copy of the stop script, /usr/local/pfx/qube/utils/pgsql/stop.sh , then edit it by changing the PGSQL_DATA_DIR to point to the new data directory.
  8. Start the postgresql server:   
`service postgresql-pfx start`

  9. Check that the new datadir is the one being used:  
`/usr/local/pfx/pgsql/bin/psql -p 50055 -U pfx -d pfx -c "SHOW
data_directory"`

  10. If it looks good, start the Supervisor service:

`service supervisor start`

## Mac

  1. Run the following commands in a terminal.
  2. Stop the Supervisor service:   
sudo launchctl stop com.pipelinefx.supervisor

  3. Stop the postgresql server:   
`sudo launchctl stop com.pipelinefx.postgresql`

  4. Copy the current datadir over to the new location **ensuring that you preserve ownership and permissions** :   
`sudo cp -rP /Applications/pfx/pgsql/data /newpath/pgsql/data`

  5. Rename the current datadir so that it won't be found by mistake, but leave it in place so you have a fallback plan:   
`sudo mv /Applications/pfx/pgsql/data /Applications/pfx/pgsql/data.MOVED`

  6. Make a backup copy of the launchd plist file, `/Library/LaunchDaemons/com.pipelinefx.postgresql.plist` , then edit it by changing `/Applications/pfx/pgsql/data` to the new data directory.  
Optionally, you may also want to change `/Applications/pfx/pgsql/pgsql.log`
to new log location.

  7. Start the postgresql server:   
sudo launchctl start com.pipelinefx.postgresql

  8. Check that the new datadir is the one being used:  
`/Applications/pfx/pgsql/bin/psql -p 50055 -U pfx -d pfx -c "SHOW
data_directory"`

  9. If it looks good, start the Supervisor service:

sudo launchctl start com.pipelinefx.supervisor

## Windows

  1. stop the **qubesupervisor** service
  2. stop the **postgresql-pfx**  service
  3. move the **C:\Program Files\pfx\pgsql\data** directory to the new directory, e.g., **D:\qube\data**
  4. run the following command on a command prompt to first unregister the postgresql-pfx service:  
`"C:\Program Files\pfx\pgsql\bin\pg_ctl" unregsiter -N postgresql-pfx`

  5. run the following command (substitute the data directory, "D:\qube\data") to register the postgresql-pfx service with the new directory:  
`"C:\Program Files\pfx\pgsql\bin\pg_ctl" regsiter -N postgresql-pfx -S auto -U
pfx -P Qub3!R0x! -D D:\qube\data  
`("Qub3!R0x!" is the default password for the pfx user-- substitute
appropriately, if you've changed it)

  6. start the **postgresql-pfx** service
  7. test that the PostgreSQL server sees the database in its new location by running:   
`"C:\Program Files\pfx\psql" -p 50055 -U pfx -d pfx -c "SHOW data_directory".`

  8. start the **qubesupervisor** service

