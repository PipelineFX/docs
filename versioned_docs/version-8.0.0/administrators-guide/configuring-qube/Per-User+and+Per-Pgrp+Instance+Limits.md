---
sidebar_position: 10 
---

# Per-User and Per-Pgrp Instance Limits 

Qube! has the notion of per-user and per-pgrp instance limits.  The administrator may set these limits to pose a restriction on the number of job instances that each user or pgrp may run on the farm at once.  In addition to setting up global default values for these limits, the administrator may also customize the limits for each user.

## Quick Set-up of Per-User and Per-Pgrp Instance Limits
In the qb.conf file on the supervisor:

* Set [supervisor_default_user_subjob_limit](../configuration-parameter-reference/supervisor_default_user_subjob_limit) and [supervisor_default_pgrp_subjob_limit](../configuration-parameter-reference/supervisor_default_pgrp_subjob_limit) as needed, to set up default instance limits for users and pgrps
* Set [supervisor_user_subjob_limits](../configuration-parameter-reference/supervisor_user_subjob_limits) and [supervisor_pgrp_subjob_limits](../configuration-parameter-reference/supervisor_pgrp_subjob_limits) as needed, to override default limits for specific users
* Have the supervisor re-read its configuration file with 
```
  $ qbadmin supe --reread
```
Example qb.conf contents:

```
supervisor_default_user_subjob_limit = 10
supervisor_default_pgrp_subjob_limit = 5
supervisor_user_subjob_limits = elvin=20,tony=15,max=15,root=-1
supervisor_pgrp_subjob_limits = elvin=10,tony=10,root=-1
```

## Details of Setting Instance Limits
There are four parameters that may be set up in the qb.conf file on the supervisor to control the subjobs limits.

* [supervisor_default_user_subjob_limit](../configuration-parameter-reference/supervisor_default_user_subjob_limit)
* [supervisor_default_pgrp_subjob_limit](../configuration-parameter-reference/supervisor_default_pgrp_subjob_limit)
* [supervisor_user_subjob_limits](../configuration-parameter-reference/supervisor_user_subjob_limits)
* [supervisor_pgrp_subjob_limits](../configuration-parameter-reference/supervisor_pgrp_subjob_limits)

The two parameters [supervisor_default_user_subjob_limit](../configuration-parameter-reference/supervisor_default_user_subjob_limit) and [supervisor_default_pgrp_subjob_limit](../configuration-parameter-reference/supervisor_default_pgrp_subjob_limit) are used to set up the global default instance count limit for every user and every pgrp, respectively, as in:

```
supervisor_default_user_subjob_limit = 10
supervisor_default_pgrp_subjob_limit = 5
```

By default, these are set to "-1", which means "no limit".

The administrator may also use the following two parameters, [supervisor_user_subjob_limits](../configuration-parameter-reference/supervisor_user_subjob_limits) and [supervisor_pgrp_subjob_limits](../configuration-parameter-reference/supervisor_pgrp_subjob_limits), to override the global instance limits for particular users:

```
supervisor_user_subjob_limits = elvin=20,tony=15,max=15,root=-1
supervisor_pgrp_subjob_limits = elvin=10,tony=10,root=-1
```

Again, the value "-1" means "no limit".

In the examples above, each user, by default, can run up to 10 job instances simultaneously.  Also by default, a user may only run up to 5 instances per pgrp.  However the user "elvin" is allowed to run up to 20 instances total, and up to 10 instances per pgrp. The user "root" has no limits.

The user instance limit takes precedence over the pgrp limit - that is, if user "phillyjoe"s pgrp instance limit is set to 10, but his user limit is 5, he may only run 5 instances.  

Apart from that, the user and pgrp instance limits work independently, and a site doesn't necessarily have to use them both (you may just deploy user subjob limits, but not pgrp subjob limits, or vice-versa).

Run
```
   $ qbadmin supe --reread
```
to have the supervisor load the configuration changes.

