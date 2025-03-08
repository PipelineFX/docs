---
sidebar_position: 8
---

# Telling the Supervisor to Reread the qb.conf file

The Supervisor may be told to reread the qb.conf file, without restarting the Supervisor service/daemon, to refresh certain dynamically modifiable parameters, by using the qbadmin command as in:

```
% qbadmin supervisor --reread
```

The following qb.conf supervisor parameters are dynamically modifiable:

* qb_domain 
* supervisor_default_group_security 
* supervisor_default_hostorder
* supervisor_default_max_cpus
* supervisor_default_p_agenda_priority 
* supervisor_default_pgrp_subjob_limit 
* supervisor_default_priority 
* supervisor_default_user_subjob_limit 
* supervisor_flags 
* supervisor_global_resources 
* supervisor_highest_user_priority 
* supervisor_job_flags 
* supervisor_max_cpus_limit
* supervisor_max_metered_licenses
* supervisor_max_priority 
* supervisor_p_agenda_max 
* supervisor_pgrp_subjob_limits 
* supervisor_preempt_policy
* supervisor_smart_share_mode
* supervisor_smart_share_preempt_policy
* supervisor_user_subjob_limits 
* supervisor_verbosity 
* supervisor_worker_configfile
