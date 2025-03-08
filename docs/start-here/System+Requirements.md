---
title: System Requirements 
sidebar_position: 7
---

# System Requirements 

## Qube! Requirements Checklist

If you are having installation or usage problems, make sure these items are present:

-	All computers with OS installed, licensed, and networked.
-	Hostname resolution (DNS) working properly on all computers.
-	Authentication infrastructure installed and working:
	-	NIS / YP / LDAP for Linux
	-	OpenDirectory for OS X
	-	ActiveDirectory for Windows
-	Network filesystem reachable by Client and Worker machines. Alternatively if no authentication infrastructure is in place please ensure open read and write privileges are set.
-	All applications (Maya, AfterEffects, etc) already installed on the clients and workers and licensed.
-	Python and Perl are installed if using separate jobtypes. You can obtain installers for those languages here: http://www.python.org and http://www.perl.org See this page for details.
-	All necessary Qube! installers already downloaded and on a filesystem accessible by all machines.
-	If a network account is to be used for the proxy user account, this account should already have been created and granted permission to the shared file system.
-	Current Qube! Supervisor license issued for the correct MAC address.

## Supervisor Specifications

Below is a recommendation of minimum specifications for optimal operation of Qube! Supervisor.

| 1 - 25 workers | 26 - 75 workers | 75 - 150 workers | 150 - 300 workers |
| ---            | ---             | ---              | ---               |
| <ul><li>4-core</li><li>4 GB of ram</li></ul> | <ul><li>8-core</li><li>8 GB of ram</li></ul> | <ul><li>12-core</li><li>8 GB of ram<br />12 GB recommended</li></ul> | <ul><li>16-core</li><li>12 GB of ram<br />16+ GB recommended</li></ul> |

:::note

Please note that beyond 30 render nodes you will need to alter qb.conf to optimize performance.

:::

<details>

<summary>

1-25 workers

</summary>

```
#================================================================================
#  Example qb.conf settings for a supervisor managing between 1-25 workers
#================================================================================
# This is not meant as a complete qb.conf, these are only the settings which
# should ~differ~ from the defaults.
#================================================================================

# the upper bound on the number of supervisor processes
supervisor_max_threads = 100    

# the lower bound on the number of supervisor processes
supervisor_idle_threads = 10    

# the number of transactions a single supervisor process will handle before it retires
supervisor_max_clients = 256    

# global supervisor configuration parameters
#
# "host_recontact" (enable supervisor to recontact host marked DOWN)
# "heartbeat_monitor" (enable supervisor to track hosts using worker heartbeat packets)
# "remove_logs" (enable log removal after job removed)
# "running_monitor" (enable the Supervisor to track running jobs more actively)
#
supervisor_flags = host_recontact,heartbeat_monitor,running_monitor,remove_logs
```

</details>

<details>

<summary>

26-75 workers

</summary>

```
#================================================================================
#  Example qb.conf settings for a supervisor managing between 26-75 workers
#================================================================================
# This is not meant as a complete qb.conf, these are only the settings which
# should ~differ~ from the defaults.
#================================================================================

# the upper bound on the number of supervisor processes
supervisor_max_threads = 100    

# the lower bound on the number of supervisor processes
supervisor_idle_threads = 25    

# the number of transactions a single supervisor process will handle before it retires
supervisor_max_clients = 256    

# global supervisor configuration parameters
#
# "host_recontact" (enable supervisor to recontact host marked DOWN)
# "heartbeat_monitor" (enable supervisor to track hosts using worker heartbeat packets)
# "remove_logs" (enable log removal after job removed)
# "running_monitor" (enable the Supervisor to track running jobs more actively)
#
supervisor_flags = host_recontact,heartbeat_monitor,running_monitor
```

</details>

<details>

<summary>

76-150 workers

</summary>

```
#================================================================================
#  Example qb.conf settings for a supervisor managing between 76-150 workers
#================================================================================
# This is not meant as a complete qb.conf, these are only the settings which
# should ~differ~ from the defaults.
#
# As well, please contact PipelineFX technical support if you need help tuning
# your MySQL server to support a farm of this size. 
#================================================================================

# the upper bound on the number of supervisor processes
supervisor_max_threads = 200

# the lower bound on the number of supervisor processes
supervisor_idle_threads = 30

# the number of transactions a single supervisor process will handle before it retires
supervisor_max_clients = 256    

# global supervisor configuration parameters
#
# "host_recontact" (enable supervisor to recontact host marked DOWN)
# "heartbeat_monitor" (enable supervisor to track hosts using worker heartbeat packets)
# "remove_logs" (enable log removal after job removed)
# "running_monitor" (enable the Supervisor to track running jobs more actively)
#
supervisor_flags = host_recontact,heartbeat_monitor,running_monitor
```

</details>

<details>

<summary>

151-300 workers

</summary>

```
#================================================================================
#  Example qb.conf settings for a supervisor managing between 151-300 workers
#================================================================================
# This is not meant as a complete qb.conf, these are only the settings which
# should ~differ~ from the defaults.
#
# As well, please contact PipelineFX technical support if you need help tuning
# your MySQL server to support a farm of this size. 
#================================================================================

# the upper bound on the number of supervisor processes
supervisor_max_threads = 250

# the lower bound on the number of supervisor processes
supervisor_idle_threads = 50

# the number of transactions a single supervisor process will handle before it retires
supervisor_max_clients = 256    

# global supervisor configuration parameters
#
# "host_recontact" (enable supervisor to recontact host marked DOWN)
# "heartbeat_monitor" (enable supervisor to track hosts using worker heartbeat packets)
# "remove_logs" (enable log removal after job removed)
# "running_monitor" (enable the Supervisor to track running jobs more actively)
#
supervisor_flags = host_recontact,heartbeat_monitor,running_monitor
```

</details>
