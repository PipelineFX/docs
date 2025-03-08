---
sidebar_position: 4
---

# SmartShare Studio Defaults
SmartShare is a feature where the system automatically expands job instances to
fill up idle, or "surplus", worker job slots. The expansion is automatically 
balanced among jobs, so that each job gets an equal number of surplus job slots.

Jobs have a 'max_cpus' value which puts an upper limit on how wide a single job
can expand.  This value can be supplied via a site-wide default, as described here.

## Configuring SmartShare

:::tip

SmartShare is automatically disabled for new installs and upgrades.

To opt in, the site administrator can set the supervisor_smart_share_mode to
"jobs" in qb.conf on the Supervisor machine:

```supervisor_smart_share_mode = jobs```

:::

* supervisor_smart_share_mode
	* Can be either "jobs" or "none".  
	* default: "jobs"
	* Setting it to "jobs" will make the system try to balance the number of the automatically-expanded "secondary" instances on a job-to-job basis
	* Setting it to "none" disables SmartShare. 
* supervisor_smart_share_preempt_policy
	* method of preemption for secondary instances 
	* aggressive, passive, disabled
	* default: aggressive
* supervisor_default_max_cpus
	* used to set the site-wide default value of "max_cpus" if not given at submission
	* default: -1
	* Note: "*" can be used in the qb.conf file too, instead of -1
* supervisor_max_cpus_limit
	* largest value of "max_cpus" that can be used on any job
	* default 100
	* Note: if any job specifies a value greater than this, the system will silently cap it to this value

