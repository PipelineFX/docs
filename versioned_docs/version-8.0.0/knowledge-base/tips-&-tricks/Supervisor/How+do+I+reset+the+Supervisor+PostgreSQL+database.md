---
sidebar_position: 2
---

# How do I reset the Supervisor PostgreSQL database?

:::warning
Performing these operations will discard ALL DATA from the entire **PostgreSQL DB!**
:::

Basically, you will need to:

1. stop the supervisor service
2. run the init_supe_db.py script with the "reset" option. The script is found in $QBDIR/utils/pgsql/, where $QBDIR is:
    * Linux: /usr/local/pfx/qube
    * Mac: /Applications/pfx/qube
    * Windows: C:\Program Files\pfx\qube
3. start the supervisor service

Again, **this wipes all existing data** , so make sure that's what you really
want.

**Linux:**

Open a terminal window as root, then:

```bash
service supervisor stop
/usr/local/pfx/qube/utils/pgsql/init_supe_db.py --reset
service supervisor start
```

**Mac:**

Open a terminal window, then:

```bash
sudo launchctl stop com.pipelinefx.supervisor 
/Applications/pfx/qube/utils/pgsql/init_supe_db.py --reset
sudo launchctl start com.pipelinefx.supervisor
```

**Windows:**

Open a command prompt, then:

```bash
net stop qubesupervisor
"C:\Program Files\pfx\qube\utils\pgsql\init_supe_db.py" --reset
net start qubesupervisor
```

