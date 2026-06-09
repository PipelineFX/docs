---
sidebar_position: 13
---

# Python API Reference

## Classes

### qb.Callback
| | | |
|---|---|---|
**Purpose** | Container for Qube's Callback properties. Callbacks execute an action when triggered by an event. | |
**Prototype** | `Callback(data={})` | |
**Parameters** | `data` | dict or `Callback` initilization properties (optional) |
**Result** | `Callback` object. | |
**Comments** | Key properties include `id`, `pid`, `triggers`, `code`, `language`, `user`, `count`, `maximum`, `ready`. | |

**Properties**

- `id` : Callback id (int)
- `pid` : Parent job id (int)
- `triggers` : list of events that trigger the Callback. See Event Triggers below. (list)
- `code` : code called when Callback triggered. (str)
- `language` : language the code block is written in [values: perl, python, qube] (str)
- `user` : username the Callback code will execute as (str)
- `count` : Number of times the callback has been executed. (int)
- `maximum` : Maximum number of times the callback will be executed. (int) [default: unlimited]
- `ready` : (Internal data property)

---

### qb.Host
| | | |
|---|---|---|
**Purpose** | Container for Qube's Host properties. Hosts are the Workers/Subjobs that process the Work of a Job | |
**Prototype** | `Host(data={})` | |
**Parameters** | `data` | dict or `Host` initilization properties (optional) |
**Result** | `Host` object. | |
**Comments** | Key properties include `state`, `name`, `macaddress`, `cluster`, `resources`, `restrictions`, `properties`, `stats`, `groups`, `address`, `subjobs`. | |

**Properties**

- `state` : state of the host [values: active, down, panic, none] (str)
- `name` : name of machine (str)
- `macaddress` : MAC address of the machine. This is the db's primary key. (str, comma-separated)
- `cluster` : cluster the Host belongs to (str)
- `resources` : list of resources associated with host that can be reserved by job reservations (str, comma-separated)
- `restrictions` : cluster restrictions associated with host will only run jobs in specified clusters (str, comma-separated)
- `properties` : properties of the host (i.e. processor speed, OS, etc)
- `stats` : (reserved)
- `groups` : groups the host belongs to (str, comma-separated)
- `address` : IP address of host
- `subjobs` : subjobs currently running on host

---

### qb.Job
| | | |
|---|---|---|
**Purpose** | Container for Qube's job properties. Jobs are the main containers that are submitted by the user. | |
**Prototype** | `Job(data={}, name='', prototype='', package={})` | |
**Parameters** | `data` | dict or Job initializing properties (optional) |
| | `name` | str specify name of job (optional) |
| | `prototype` | str specify prototype/jobtype (optional) |
| | `package` | dict specify package dict of job (optional) |
**Result** | `Job` object. | |
**Comments** | Key properties include `account`, `agenda`, `p_agenda`, `agendastatus`, `callbacks`, `cluster`, `cpus`, `cpustally`, `data`, `dependency`, `domain`, `flags` | |

**Properties**

- `account` : Container for holding account information for Job (str)
- `agenda` : list of Work that specifies tasks/frames (list(Work))
- `p_agenda` : list of priority/poster/preview-work items (list(Work))
- `agendastatus` : Agenda state. See below for list of states. (str)
- `callbacks` : list of Callbacks to be called when job completes (list(Callback))
- `cluster` : Cluster to run the Job on (str)
- `cpus` : Number of processes/workers/subjobs to use for the Job (int)
- `cpustally` : Tally of number of subjobs per status (dict)
- `data` : Encoded string representing the package. Note: Edit the package property, not this. (str, internal) available for developers who wish to use a different encoding scheme rather than the package system.
- `dependency` : Jobid(s) to complete before running (str, comma-separated) (listing \<jobid> is shortcut for a job, full format is link-\<complete,done,failed,killed>-\<job,work,subjob>-\<jobid>)
- `domain` : Windows Domain for authentication on the Worker (str)
- `flags` : Bitfield derived from `flagsstring` field (Internal use only)
- `flagsstring` : Comma-separated list of Job flags (str)
- `globalorder` : Priority number used with 'top' and 'bottom' (Internal use only)
- `groups` : Group of machines the Job can be dispatched to (str, comma-separated)
- `hostorder` : Specified order of machines to dispatch Job to
- `hosts` : Machines the Job can be dispatched to (str, comma-separated)
- `id` : Job id (int)
- `kind` : Extra string tag (str)
- `label` : Abstract tag that can be used to reference Job in Callback triggers. Note: the combination of `pgrp` and `label` must be unique for a job.
- `lastupdate` : timestamp since last modification (int)
- `localorder` : Priority number used with 'top' and 'bottom' (Internal use only)
- `mailaddress` : Email address to use for the email callback (str)
- `name` : Name of the job (str)
- `notes` : User-specified general notes on the job (str)
- `omitgroups` : Specified groups of machines to NOT be dispatched to (str, comma-separated)
- `omithosts` : Machines the Job can be dispatched to (str, comma-separated)
- `package` : Data used when Worker runs the job. (dict(str, val))
- `path` : Reserved
- `pathmap` : Reserved
- `pgrp` : Job process group. (int) Useful for grouping jobs together logically. Note: the combination of `pgrp` and `label` must be unique for a job.
- `pid` : Job parent id (int)
- `priority` : Job priority (int) Lower number means higher priority.
- `prototype` : Job type name (str)
- `queue` : Reserved
- `reason` : Reason why a job is pending, specified by Supervisor (str)
- `requirements` : Properties required to determine host eligibility (str, comma-separated)
- `reservations` : Reserved properties used when dispatching a job (i.e. licenses, memory, etc) (str, comma separated)
- `restrictions` : Restrict jobs to specific clusters. (str, comma separated)
- `retrysubjob` : Number of time to attempt to retry a subjob on failure (int)
- `retrywork` : Number of time to attempt to retry a frame or work item on failure (int)
- `retrywork_delay` : Number of seconds to wait before automatically retrying a frame or work item on failure (int)
- `serverid` : Reserved
- `status` : Job state. See below for list of states. (str)
- `subjobs` : list of Subjobs that specifies the machines to execute the work (list(Subjob))
- `subjobstatus` : Subjob state. See below for list of states. (str)
- `timecomplete` : timestamp for when job completed (int)
- `timelimit` : maximum time in seconds the job is allowed to run before it's forcefully failed (int)
- `timeout` : maximum time in seconds the job is allowed to run before a timeout event is generated (int)
- `agenda_timelimit` : maximum time in seconds a frame is allowed to run before it's forcefully failed (int)
- `agenda_timeout` : maximum time in seconds a frame is allowed to run before a frame timeout event is generated (int)
- `timestart` : timestamp for when job started (int)
- `timesubmit` : timestamp for submission time (int)
- `todo` : Number of frames/tasks for the job (int)
- `todotally` : Tally of number of frames (work) per status (dict)
- `user` : User submitting the job. (str) Note: Submitting as different user requires "impersonate" priviledges.
- `waitfor` : Jobid(s) to complete before running (int), Generates callbacks in qb.submit() [DEPRECATED: Use 'dependency']
- `prod_show` : holds production show name (str)
- `prod_shot` : holds production shot name (str)
- `prod_seq` : holds production seq name (str)
- `prod_client` : holds production client name (str)
- `prod_dept` : holds production department name (str)
- `prod_custom1` : holds production custom data (str)
- `prod_custom2` : holds production custom data (str)
- `prod_custom3` : holds production custom data (str)
- `prod_custom4` : holds production custom data (str)
- `prod_custom5` : holds production custom data (str)
- `preflights` : comma-separated list of paths to job-level preflight programs (str)
- `postflights` : comma-separated list of paths to job-level postflight programs (str)
- `agenda_preflights` : comma-separated list of paths to agenda-level preflight programs (str)
- `agenda_postflights` : comma-separated list of paths to agenda-level postflight programs (str)

---

### qb.JobTallyValidator
| | | |
|---|---|---|
**Purpose** | A class to validate a qb.Job's todotally and cpustally | |
**Prototype** | `validate(tally_dict)` | |
**Parameters** | `tally_dict` | tally_dict |
**Result** | `JobTallyValidator` object. | |

**Example**

```python
qb.JobTallyValidator.validate(job['cpustally'])
```

---

### qb.JobValidator
| | | |
|---|---|---|
**Purpose** | A class to ensure that a qb.Job instance is not malformed | |
**Prototype** | `class JobValidator` | |
**Parameters** | None. |
**Result** | `JobValidator` object. | |

**Example**

```python
qb.JobValidator.validate({'id': 123, 'cluster': '/',...})
qb.JobValidator.validate({'id': 123, 'cluster': '/',...}, verbose=True)
qb.JobValidator.validate({'id': 123, 'cluster': '/',...}, agenda=True, subjobs=True, verbose=True)
```

---

### qb.QBObject
| | | |
|---|---|---|
**Purpose** | Baseclass for Qube python objects. | |
**Prototype** | `class QBObject` | |
**Parameters** | None. |
**Result** | `QBObject` object. | |

---

### qb.Subjob
| | | |
|---|---|---|
**Purpose** | Container for Qube's subjob properties. Subjobs control the processes that perform the Work. | |
**Prototype** | `Subjob(data={})` | |
**Parameters** | `data` | dict or Subjob initilization properties (optional) |
**Result** | `Subjob` object. | |
**Comments** | Key properties include `id`, `pid`, `host`, `count`, `retry`, `status`, `lastupdate`, `timesubmit`, `timestart`, `timecomplete`. | |

**Properties**

- `id` : Subjob id (int)
- `pid` : Parent job id (int)
- `host` : machine the subjob is running on (str)
- `count` : number of attempts to process the Subjob
- `retry` : retry limit
- `status` : Subjob state. See below for list of states. (str)
- `lastupdate` : timestamp since last modification (int)
- `timesubmit` : timestamp for submission time (int)
- `timestart` : timestamp for when job started (int)
- `timecomplete` : timestamp for when job completed (int)

---

### qb.Work
| | | |
|---|---|---|
**Purpose** | Container for Qube's Work properties. Work is what is to be processed (i.e. frame or task) by a Subjob. | |
**Prototype** | `Work(data={})` | |
**Parameters** | `data` | dict or Work initilization properties (optional) |
**Result** | `Work` object. | |
**Comments** | Key properties include `pid`, `subid`, `host`, `name`, `status`, `address`, `data`, `package`, `result`, `count`, `retry`, `retrydelay` | |

**Properties**

- `pid` : Parent job id (int)
- `subid` : Subjob id that received the Work (int)
- `host` : machine the Work is processing on (str)
- `name` : name of the Work. Usually a frame number or range. Can be a label. (str)
- `status` : Work state. See below for list of states. (str)
- `address` : IP Address of the machine that received the Work (str)
- `data` : Encoded string representing the Work package. Note: edit the package, not this. (str, internal)
- `package` : Dict passed to Worker when processing the Work. Optional structure for custom jobtypes. Not currently used by cmdline or cmdrange. (dict(str, val))
- `result` : Result package to be passed back to the supervisor. (dict(str,val))
- `count` : Number of attempts used to process the Work, read-only (int)
- `retry` : automatic retry limit (int)
- `retrydelay` : delay before automatic retries (int)
- `resultpackage` : Dict retrieved from Worker after processing Work. Useful for frame filenames, etc. (dict(str, val))
- `lastupdate` : timestamp since last modification (int)
- `timesubmit` : timestamp for submission time (int)
- `timestart` : timestamp for when job started (int)
- `timecomplete` : timestamp for when job completed (int)

---

## Functions

### qb.CONST
| | | |
|---|---|---|
**Purpose** | return the integer value of the Qube command or admincommand constant with name | :Since: Qube 6.9 |
**Prototype** | `qb.CONST(name)` | |
**Parameters** | `name` | str Name of the constant |
**Result** | True when authdata is successfully sent, False otherwise. | |

---

### qb.admincommand
| | | |
|---|---|---|
**Purpose** | Execute admincommand | |
**Prototype** | `qb.admincommand(cmd, *result)` | |
**Parameters** | `cmd` | str the admincommand to execute |
**Result** | result | |

---

### qb.archivejob
| | | |
|---|---|---|
**Purpose** | Save `Job` to file. | :See: `recoverjob` |
**Prototype** | `qb.archivejob(filename, job, format=2)` | |
**Parameters** | `filename` | str file path to where to save Job. |
| | `job` | `Job` or dict Job to save |
| | `format` | int format to use for saving. (default: QB_API_XML) - *Options*: QB_API_XML, QB_API_BINARY |
**Result** | filesize in bytes (int) | |

**Example**

```python
myjob = qb.jobinfo(id=277)[0]
loadedJob = qb.archivejob('c:/myjob.xml', myjob)
```

---

### qb.bannedworkers
| | | |
|---|---|---|
**Purpose** | Retrieve a list of banned worker hosts. | |
**Prototype** | `qb.bannedworkers()` | |
**Parameters** | None | |
**Result** | [`Host`] | |

**Example**

```python
banned = qb.bannedworkers()
[print("name=%s, mac=%s, ip=%s" % (w['name'], w['macaddress'], w['address'])) for w in qb.bannedworkers()]
```

---

### qb.binarySort
| | | |
|---|---|---|
**Purpose** | Return a new list reordered with first, last, and then the recursed median values for the remaining items. | :Since: Qube 5.3. |
**Prototype** | `qb.binarySort(origList)` | |
**Parameters** | `origList` | list original list to be sorted |
**Result** | new sorted list | |

**Example**

```python
qb.binarySort([1,2,3,4,5,6,7,8,9,10])
```

---

### qb.block
| | | |
|---|---|---|
**Purpose** | Set job state to blocked. | :See: `unblock` |
**Prototype** | `qb.block(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.blockwork
| | | |
|---|---|---|
**Purpose** | Sets specified pending frames/tasks to blocked state. | :See: `unblockwork`. |
**Prototype** | `qb.blockwork(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.blockwork('250:0')
qb.blockwork('250:0', '250:1')
```

---

### qb.bottom
| | | |
|---|---|---|
**Purpose** | Move specified jobs to the end of the execution order queue, within the same priority. | :See: `joborder`, `top`. |
**Prototype** | `qb.bottom(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | affected jobids ([int]) | |

**Example**

```python
qb.bottom(250)
```

---

### qb.checkpassword
| | | |
|---|---|---|
**Purpose** | Check for valid password of current user. [Windows only] | |
**Prototype** | `qb.checkpassword()` | |
**Parameters** | None. |
**Result** | success of valid password (bool) | |

---

### qb.complete
| | | |
|---|---|---|
**Purpose** | Alias for 'retire' function | |
**Prototype** | `qb.complete(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.completework
| | | |
|---|---|---|
**Purpose** | Alias for 'retirework' function | |
**Prototype** | `qb.completework(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.convertpath
| | | |
|---|---|---|
**Purpose** | convert the given path to be suitable for the current worker, using the worker's pathmap | :See: Developer docs for information on usage. |
**Prototype** | `qb.convertpath(*args)` | |
**Parameters** | `*args` | \*args |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.currenttime
| | | |
|---|---|---|
**Purpose** | get the current timestamp from the supervisor. This is useful for determining time offset from local clock and supervisor clock. | |
**Prototype** | `qb.currenttime()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.deletepreference
| | | |
|---|---|---|
**Purpose** | delete a single preference | :Since: Qube 6.8 |
**Prototype** | `qb.deletepreference(preference_type, entity_path, tier, preset, user)` | |
**Parameters** | `preference_type` | str type of the preference ("submission", etc) |
| | `entity_path` | str path to the preferences |
**Result** | True when preference data is successfully deleted, False otherwise. | |

---

### qb.deleteworkerproperties
| | | |
|---|---|---|
**Purpose** | Delete (undefine) named properties from the specified worker | :Since: Qube 6.3 |
**Prototype** | `qb.deleteworkerproperties(worker, props)` | |
**Parameters** | `worker` | str worker name |
| | `props` | list list of property strings |
**Result** | True/False based on success | |

---

### qb.deleteworkerresources
| | | |
|---|---|---|
**Purpose** | Delete (undefine) named resources from the specified worker | :Since: Qube 6.3 |
**Prototype** | `qb.deleteworkerresources(worker, resources)` | |
**Parameters** | `worker` | str worker name |
| | `resources` | list list of resource strings |
**Result** | True/False based on success | |

**Example**

```python
qb.deleteworkerresources("host1", ["host.diskusage", "host.diskfree"])
```

---

### qb.encryptpassword
| | | |
|---|---|---|
**Purpose** | Encrypts a password string | :Since: Qube 5.5 |
**Prototype** | `qb.encryptpassword(password)` | |
**Parameters** | `password` | str password to encrypt |
**Result** | encryped string (str) | |

---

### qb.error
| | | |
|---|---|---|
**Purpose** | Return the error reason. | :Since: Qube 5.3. |
**Prototype** | `qb.error()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.genchunks
| | | |
|---|---|---|
**Purpose** | Generate a work agenda (individual Work items) in frame chunks based upon range list. Automatically removes duplicate items in the list.| :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.genchunks(chunksize, range, *extraRanges, **kwargs)` | |
**Parameters** | `chunksize` | int number of frames per chunk |
| | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order (default=False) |
**Result** | list of Work instances. ([`Work`]) | |

**Example**

```python
qb.genchunks(10, '1-100')
qb.genchunks(10, '-100--10')
```

---

### qb.genframes
| | | |
|---|---|---|
**Purpose** | Generate a work agenda (individual Work items) based upon range list. Automatically removes duplicate items in the list by default. | :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.genframes(range, *extraRanges, **kwargs)` | |
**Parameters** | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order [default = False] |
| | `removeDuplicates` | bool remove duplicates in the returned list [default = True] |
**Result** | list of `Work` instances. ([`Work`]) | |

**Example**

```python
qb.genframes('1-10x2')
qb.genframes('-10--1x2')
qb.genframes('ls,set,echo HI')
```

---

### qb.genpartitions
| | | |
|---|---|---|
**Purpose** | Generate a work agenda (individual Work items) based upon range list splitting frame range into \<n> partitions. Automatically removes duplicate items in the list. | :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.genpartitions(numPartitions, range, *extraRanges, **kwargs)` | |
**Parameters** | `numPartitions` | int number of partitions to split the range into |
| | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order (default=False) |
**Result** | list of Work instances. ([`Work`]) | |

**Example**

```python
qb.genpartitions(2, '1-10')
qb.genpartitions(2, '-10--1')
```

---

### qb.getlogpath
| | | |
|---|---|---|
**Purpose** | Returns the client logpath (used to access the job logs directly). If the logpath override is '', then return the logpath specified in the config file. If the logpath override is 'USE_SUPERVISOR', then force the queries to ignore local access and retrieve data directly from the Supervisor. | :Since: Qube 5.5. |
**Prototype** | `qb.getlogpath()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.getpreferences
| | | |
|---|---|---|
**Purpose** | get preferences specified by the entity_path | :Since: Qube 6.8 |
**Prototype** | `qb.getpreferences(preference_type, entity_path)` | |
**Parameters** | `preference_type` | str type of the preference ("submission", etc) |
| | `entity_path` | str path to the preferences |
**Result** | list of dicts, each dict representing a DB row | |

---

### qb.getresources
| | | |
|---|---|---|
**Purpose** | Get dict of global and license resources with an associated used/total count | :Since: Qube 5.5 |
**Prototype** | `qb.getresources()` | |
**Parameters** | None. |
**Result** | True/False based on success | |

**Example**

```python
qb.getresources()
```

---

### qb.getsupervisor
| | | |
|---|---|---|
**Purpose** | Returns the hostname or IP address of the current supervisor ('' means use default supervisor specified in qb.conf). | |
**Prototype** | `qb.getsupervisor()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.gettimeout
| | | |
|---|---|---|
**Purpose** | Returns the current client timeout setting in milliseconds | :Since: Qube 5.3. |
**Prototype** | `qb.gettimeout()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.getusers
| | | |
|---|---|---|
**Purpose** | Get the user and user group permissions from the Supervisor. | :Since: Qube 5.5 |
**Prototype** | `qb.getusers(convert=True)` | |
**Parameters** | `convert` | bool convert numeric permission to human readable string list 'all' used to denote "all non-admin permissions" |
**Result** | list of users and permissions \{'\<username>':\{\<group>:\<permission>,},} | |

---

### qb.hist
| | | |
|---|---|---|
**Purpose** | Retrieve history list of specified jobid/jobid.subjob. | |
**Prototype** | `qb.hist(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int or str jobid or 'jobid.subjobid' to retrieve history for (additional jobids can be specified) |
**Result** | history ([dict]) - *Note*: either subid or workid is specified, but not both. (value -1 used if not specified.)<br/> - jobid -- Job id<br/> - subid -- subjob id (int)<br/> - workid -- task/frame id (int)<br/> - comment -- String history event description<br/> - stamp -- String date<br/> - timestamp -- Int event time in seconds since the epoch | |

**Example**

```python
loadedJob = qb.hist(250)      # retrieve all history for job 250
loadedJob = qb.hist('250.0')  # retrieve history for job 250, subjob 0 only
```

---

### qb.hostinfo
| | | |
|---|---|---|
**Purpose** | Retrieve information from specified hosts. | |
**Prototype** | `qb.hostinfo(fields=[], filters={}, name=None, state=None, subjobs=False)` | |
**Parameters** | `fields` | list additional info to retrieve. See below. (default=[]) - *Options*: subjobs |
| | `filters` | dict host properties to filter hosts acted upon. See `Host` class properties for a full list of filters. (default={}) |
| | `name` | str or [str] filter shortcut. name=val -> filters=\{'name': val } (default=None) |
| | `state` | str or [str] filter shortcut. state=val -> filters=\{'state': val } (default=None) |
| | `subjobs` | bool field shortcut. subjobs=True -> fields=['subjobs'] (default=False) |
**Result** | [`Host`] | |

**Example**

```python
hosts = qb.hostinfo()               # all hosts
hosts = qb.hostinfo(name='myhost')  # only host named myhost
hosts = qb.hostinfo(state='down')  # only host that are active
hosts = qb.hostinfo(subjobs=True)   # all hosts, include subjob info
```

---

### qb.hostorder
| | | |
|---|---|---|
**Purpose** | Get list of hosts in the order that the system will likely assign the given job. | |
**Prototype** | `qb.hostorder(id=None)` | |
**Parameters** | `id` | int The jobID of the job we're interested in. |
**Result** | [`Host`] | |

**Example**

```python
hosts = qb.hostorder(id=1234)
```

---

### qb.interrupt
| | | |
|---|---|---|
**Purpose** | Forces running jobs back to pending state without waiting for agenda items to finish. | :See: `preempt`, `migrate` |
**Prototype** | `qb.interrupt(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.isadmin
| | | |
|---|---|---|
**Purpose** | Query the supervisor to find out if the given user is a qube admin. Return TRUE if the user is a qube administrator, FALSE otherwise. In case of errors, FALSE is returned also. | :Since: Qube 6.5 |
**Prototype** | `qb.isadmin(user)` | |
**Parameters** | `user` | str name of the user to be checked |
**Result** | True if user is a Qube admin, False otherwise | |

---

### qb.jobconfig
| | | |
|---|---|---|
**Purpose** | Return specified paramaeter value from job.conf. | |
**Prototype** | `qb.jobconfig(jobtype, parameter)` | |
**Parameters** | `jobtype` | str jobtype for the parameter |
 | `parameter` | str name of parameter to retrieve :Return: parameter value |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.jobid
| | | |
|---|---|---|
**Purpose** | Get the job's id for the job process (jobtype backend) | :Since: Qube 5.3.<br/> :See: Developer docs for information on usage. |
**Prototype** | `qb.jobid()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.jobinfo
| | | |
|---|---|---|
**Purpose** | Gather job information from a list of jobs. | |
**Prototype** | `qb.jobinfo(fields=[], filters={}, id=None, status=None, agenda=False, subjobs=False, callbacks=False, updatedAfter=None, updatedBefore=None, submittedAfter=None, submittedBefore=None, minid=None, maxid=None, limit=None, orderby=None)` | |
**Parameters** | `fields` | list additional info to retrieve. See below. (default=[]) *Options*: agenda, subjobs, callbacks |
| | `filters` | dict properties to filter retrived items. See below. (default={}) *Options*: id, name, user, status, priority, pgrp, pid, todo, cluster, prototype, groups, cpus |
| | `id` | int or [int] filter shortcut. id=val -> filters=\{'id': val } (default=None) |
| | `status` | str filter shortcut. status=val -> filters=\{'status': val } (default=None)<br/> *Options*: complete, failed, killed, blocked, waiting, suspended, pending, running, unknown, badlogin, registering, dying |
| | `agenda` | bool field shortcut. agenda=True -> fields=['agenda'] (default=False) |
| | `subjobs` | bool field shortcut. subjobs=True -> fields=['subjobs'] (default=False) |
| | `callbacks` | bool field shortcut. callbacks=True -> fields=['callbacks'] (default=False) |
| | `updatedAfter` | int or datetime.datetime or datetime.date filter for jobs updated after a specific point in time |
| | `updatedBefore` | int or datetime.datetime or datetime.date filter for jobs updated before a specific point in time |
| | `submittedAfter` | int or datetime.datetime or datetime.date filter for jobs submitted after a specific point in time |
| | `submittedBefore` | int or datetime.datetime or datetime.date filter for jobs submitted before a specific point in time |
| | `minid` | int set the job ID lower bound for the query (only query for jobs >= id) |
| | `maxid` | int set the job ID upper bound for the query (only query for jobs \<= id) |
| | `limit` | int limit the number of returned jobs for the query |
| | `orderby` | str specify sorting field; i.e. this forms the ORDERBY clause used for the job query (like 'id' or 'id DESC') |
**Result** | [`Job`] | |

**Example**

```python
jobs = qb.jobinfo(fields=['agenda', 'subjobs'], filters={'id':2024} )
jobs = qb.jobinfo(id=2024, agenda=True, subjobs=True)
jobs = qb.jobinfo(id=2024, agenda=True, subjobs=True)
jobs = qb.jobinfo(id=[2024,2025])
```

---

### qb.jobobj
| | | |
|---|---|---|
**Purpose** | Get a dict for the job to process (jobtype backend) | :See: Developer docs for information on usage. |
**Prototype** | `qb.jobobj()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.joborder
| | | |
|---|---|---|
**Purpose** | Get jobs running or scheduled to run on the host. | |
**Prototype** | `qb.joborder(filters={}, name=None)` | |
**Parameters** | `filters` | dict host properties to filter hosts acted upon. See `Host` class properties for a full list of filters. (default={}) |
| | `name` | str or [str] filter shortcut. name=val -> filters=\{'name': val } (default=None) |
**Result** | [`Job`] | |

**Example**

```python
jobs = qb.joborder(name='myhost')
```

---

### qb.jobtagvalues
| | | |
|---|---|---|
**Purpose** | Retrieve a list of currently used values for tag, "tagname". | |
**Prototype** | `qb.jobtagvalues(tagname)` | |
**Parameters** | `tagname` | str name of tag (prod_show, prod_seq, prod_shot, prod_client, prod_dept, prod_custom1, ..., prod_custom5) for which to query |
**Result** | [`Host`] | |

**Example**

```python
tagvalues = qb.jobtagvalues("prod_custom1")
```

---

### qb.jobtypeavailable
| | | |
|---|---|---|
**Purpose** | Return the list of available jobtypes on current host system. | |
**Prototype** | `qb.jobtypeavailable(jobtypepath)` | |
**Parameters** | `jobtypepath` | str path to the jobtypes :Return: list of available jobtypes on current host system ([str]) |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.kill
| | | |
|---|---|---|
**Purpose** | Kills jobs or subjobs. | |
**Prototype** | `qb.kill(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobid to kill (additional jobids can be specified) |
**Result** | killed subjobs (['jobid.subjobid']) | |

**Example**

```python
qb.kill(250)        # kill all subjobs under job 250
qb.kill('250.0')    # kill only subjob 250.0
```

---

### qb.killwork
| | | |
|---|---|---|
**Purpose** | Kills specified frames/tasks. | :See: `kill`. |
**Prototype** | `qb.killwork(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.killwork('250:0')
qb.killwork('250:0', '250:1')
```

---

### qb.localconfig
| | | |
|---|---|---|
**Purpose** | Query the configuration of the local machine. | :Since: Qube 5.5<br/> :See: `updatelocalconfig` |
**Prototype** | `qb.localconfig()` | |
**Parameters** | None. |
**Result** | dict of parameters | |

---

### qb.migrate
| | | |
|---|---|---|
**Purpose** | Interrupt a running job/subjob and force it to run on a different host. | |
**Prototype** | `qb.migrate(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int or str jobid or 'jobid.subjobid' to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

**Example**

```python
qb.migrate(250)    # migrate all subjobs for job 250
qb.migrate('250.1')  # migrate subjob 250.1 to a different host
```

---

### qb.mktime
| | | |
|---|---|---|
**Purpose** | mktime(tuple) -> floating point number Convert a time tuple in local time to seconds since the Epoch. Note that mktime(gmtime(0)) will not generally return zero for most time zones; instead the returned value will either be equal to that of the timezone or altzone attributes on the time module. | |
**Prototype** | `qb.mktime(...)` | |
**Parameters** | `...` | ... |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.modify
| | | |
|---|---|---|
**Purpose** | Requests the supervisor to modify a list of jobs. | |
**Prototype** | `qb.modify(modifyParamDict, jobid, *extrajobids)` | |
**Parameters** | `modifyParamDict` | dict items to modify (ie. \{'priority':123})<br/> Modifiable Parameters:<br/> - priority<br/> - timeout<br/> - name<br/> - account<br/> - notes<br/> - cluster<br/> - restrictions<br/> - requirements<br/> - reservations<br/> - groups<br/> - hosts<br/> - omithosts<br/> - omitgroups<br/> - hostorder<br/> - pgrp<br/> - data<br/> - cpus<br/> - max_cpus<br/> - env<br/> - prod_show<br/> - prod_shot<br/> - prod_seq<br/> - prod_client<br/> - prod_dept<br/> - prod_custom1<br/> - prod_custom2<br/> - prod_custom3<br/> - prod_custom4<br/> - prod_custom5<br/> - preflights<br/> - postflights<br/> - agenda_preflights<br/> - agenda_postflights |
| | `jobid` | int jobid to affect (additional jobids can be specified) |
**Result** | affected jobids ([int]) | |

**Example**

```python
qb.modify({'priority':123}, 250)    # modify priority of job 250
```

---

### qb.ping
| | | |
|---|---|---|
**Purpose** | Ping the current or specified Supervisor to confirm it is present and available. | |
**Prototype** | `qb.ping(supervisor=None, asDict=False)` | |
**Parameters** | `supervisor` | str or None Specify the explicit Supervisor to ping. If None value specified, then use the current default supervisor for the given machine |
| | `asDict` | bool return a dict containing details on the supervisor ping |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.preempt
| | | |
|---|---|---|
**Purpose** | Forces running jobs back to pending state after agenda item is completed. | :See: `interrupt` and `migrate` |
**Prototype** | `qb.preempt(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.qbadmin_reconfigureworkers
| | | |
|---|---|---|
**Purpose** | Performs call same as "qbadmin worker --reconfigure" to push out new qbwrk.conf to all workers :Note: This command requires qube 'admin' permissions to work. | |
**Prototype** | `qb.qbadmin_reconfigureworkers()` | |
**Parameters** | None. |
**Result** | success (bool) | |

---

### qb.rangechunk
| | | |
|---|---|---|
**Purpose** | Splits frame range chunks each with \<n> frames. Automatically removes duplicate items in the list. | :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.rangechunk(chunksize, range, *extraRanges, **kwargs)` | |
**Parameters** | `chunksize` | int number of frames per chunk |
| | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order (default=False) |
**Result** | List of range strings ([str]) | |

**Example**

```python
qb.rangechunk(5, '1-10')
qb.rangechunk(5, '-100--1')
qb.rangechunk(5, '1-20', binarySort=True)
```

---

### qb.rangepartition
| | | |
|---|---|---|
**Purpose** | Split frame range into \<n> partitions. Automatically removes duplicate items in the list. | :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.rangepartition(numPartitions, range, *extraRanges, **kwargs)` | |
**Parameters** | `numPartitions` | int number of partitions to split the range into |
| | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order (default=False) |
**Result** | List of range strings ([str]) | |

**Example**

```python
qb.rangepartition(2, '1-10')
qb.rangepartition(2, '-100--1')
```

---

### qb.rangesplit
| | | |
|---|---|---|
**Purpose** | Convert a frame range into a list of frames. Automatically removes duplicate items in the list by default. | :See: `rangesplit`, `rangechunk`, `rangepartition`<br/> :See: `genframes`, `genchunks`, `genpartitions` |
**Prototype** | `qb.rangesplit(range, *extraRanges, **kwargs)` | |
**Parameters** | `range` | str Frame range string (additional ranges can be specified)<br/> - n1 (ie. 1)<br/> - n1,n2,... -- comma separated list (i.e. 1,2,3,5,10)<br/> - n1-n2 -- n1 through n2 (i.e. 1-10)<br/> - n1-n2xStep -- n1 through n2, step Step (i.e. 1-10x2) |
| | `binarySort` | bool perform a binary sort (first, last, middle) on the resulting order [default = False] |
| | `removeDuplicates` | bool remove duplicates in the returned list [default = True] |
**Result** | List of range strings ([str]) | |

---

### qb.recoverjob
| | | |
|---|---|---|
**Purpose** | Load `Job` from file. | :See: `archivejob` |
**Prototype** | `qb.recoverjob(filename)` | |
**Parameters** | `filename` | str path to file containing saved Job |
**Result** | `Job` on success, None on failure | |

**Example**

```python
loadedJob = qb.recoverjob('c:/myjob.xml')
```

---

### qb.remove
| | | |
|---|---|---|
**Purpose** | Remove specified jobids from database. | |
**Prototype** | `qb.remove(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | affected jobids ([int]) | |

---

### qb.reportjob
| | | |
|---|---|---|
**Purpose** | Return updated job status to supervisor (jobtype backend) | :See: Developer docs for information on usage. |
**Prototype** | `qb.reportjob(*args)` | |
**Parameters** | `*args` | \*args |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.reportwork
| | | |
|---|---|---|
**Purpose** | Returns updated work agenda items to the supervisor (jobtype backend)<br/> :See: Developer docs for information on usage. |
**Prototype** | `qb.reportwork(*args)` | |
**Parameters** | `*args` | \*args |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.requestwork
| | | |
|---|---|---|
**Purpose** | Ask supervisor for work agenda items (jobtype backend) | :See: Developer docs for information on usage. |
**Prototype** | `qb.requestwork()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.requeue
| | | |
|---|---|---|
**Purpose** | Resets jobs in a terminal state (killed, failed, etc) back to a blocked state. Note that this command is very similar to the `retry` command, with a subtle yet significant difference-- `retry` puts the job in a "pending" state, while `requeue` puts it in a "blocked" state. | :See: `retry`, which does a similar thing, but puts the job in a "pending" state. | |
**Prototype** | `qb.requeue(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.requeuework
| | | |
|---|---|---|
**Purpose** | Resets specified terminal frames/tasks (failed, killed, etc) to blocked state. | :See: `retrywork`. |
**Prototype** | `qb.requeuework(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.requeuework('250:0')
qb.retrywork('250:25-29')
qb.requeuework('250:0', '250:1')
```

---

### qb.resume
| | | |
|---|---|---|
**Purpose** | Return suspended (unix) jobs to specified running jobs. (Linux Workers only) | :See: `suspend`. |
**Prototype** | `qb.resume(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.retire
| | | |
|---|---|---|
**Purpose** | Force specified jobs to exit and set status to "complete" after each subjob completes its current Work items. :Note: Works on jobs that are not complete, killed, or failed. | |
**Prototype** | `qb.retire(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobid to retire (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

**Example**

```python
qb.retire(250)
```

---

### qb.retirework
| | | |
|---|---|---|
**Purpose** | Retire specified frames/tasks and set their status to "complete". | :Since: Qube 5.3.<br/> :Note: Works on frames/tasks that are not complete, killed, or failed.<br/> :See: `retire`. |
**Prototype** | `qb.retirework(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.retirework('250:0')
qb.retirework('250:0', '250:1')
```

---

### qb.retry
| | | |
|---|---|---|
**Purpose** | Resets jobs in a terminal state (killed, failed, etc) back to a pending state. Note that this command is very similar to the `requeue` command, with a subtle yet significant difference-- `requeue` puts the job in a "blocked" state, while `retry` puts it in a "blocked" state. | :See: `requeue`, which does a similar thing, but puts the job in a "blocked" state. |
**Prototype** | `qb.retry(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.retrywork
| | | |
|---|---|---|
**Purpose** | Resets specified terminal frames/tasks (failed, killed, etc) to pending state. Return affected tasks/work items. | :See: `requeuework` |
**Prototype** | `qb.retrywork(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.retrywork('250:0')
qb.retrywork('250:25-29')
qb.retrywork('250:0', '250:1')
```

---

### qb.send_ML_authdata
| | | |
|---|---|---|
**Purpose** | *Deprecated* send Metered Licensing authorization data to the supervisor | :Since: Qube 6.9 |
**Prototype** | `qb.send_ML_authdata(authdata)` | |
**Parameters** | `authorization` | str properly formatted and keyed authorization data |
**Result** | True when authdata is successfully sent, False otherwise. | |

---

### qb.setlogpath
| | | |
|---|---|---|
**Purpose** | Set the client logpath to access the job logs directly. Set to '' to use the default logpath specified in the config file. Set to 'USE_SUPERVISOR' to force the queries to ignore local access and retrieve data directly from the Supervisor. | :Since: Qube 5.5. |
**Prototype** | `qb.setlogpath(logpath)` | |
**Parameters** | `logpath` | str directory path to the qube log |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.setpreference
| | | |
|---|---|---|
**Purpose** | set a single preference | :Since: Qube 6.8 |
**Prototype** | `qb.setpreference(preference_type, entity_path, entity_value, tier, preset, user, mandate)` | |
**Parameters** | `preference_type` | str type of the preference ("submission", etc) |
| | `entity_path` | str path to the preferences |
| | `entity_value` | str value of the preferences |
| | `tier` | str "common" or "specific" |
| | `preset` | str preset |
| | `user` | str user name |
| | `mandate` | bool if the preference is mandate or not |
**Result** | True when preference data is successfully set, False otherwise. | |

---

### qb.setsupervisor
| | | |
|---|---|---|
**Purpose** | Set the supervisor to use. | |
**Prototype** | `qb.setsupervisor(supervisor)` | |
**Parameters** | `supervisor` | str hostname or IP address of supervisor. '' means use default supervisor specified in qb.conf. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.settimeout
| | | |
|---|---|---|
**Purpose** | Set the client timeout (in milliseconds). | :Since: Qube 5.3. |
**Prototype** | `qb.settimeout(timeout)` | |
**Parameters** | `timeout` | int length of timeout in milliseconds |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.setusers
| | | |
|---|---|---|
**Purpose** | Set the permissions for users and user groups. Requires administrator access. | :Since: Qube 5.5 |
**Prototype** | `qb.setusers(action, user, permissions=[], group='')` | |
**Parameters** | `action` | bool what action is to be performed on the specified users accepted values: add, delete, set, drop ('remove' also works for 'delete') |
| | `user` | string username to set permissions for |
| | `group` | string group under username to set permissions for |
| | `permissions` | int or [string] user and admin permissions to set for the user or a group for that user both int or a string list is accepted<br/><br/> Basic Permissions: ("all" is a shortcut for all of these)<br/> - submit_job<br/> - submit_callback<br/> - submit_global_callback<br/> - bump<br/> - kill<br/> - remove<br/> - modify<br/> - preempt<br/> - block<br/> - interrupt<br/> - complete<br/> - unblock<br/> - suspend<br/> - resume<br/> - retry<br/> - requeue<br/> - migrate<br/> - shove<br/> - fail<br/> - retire<br/> - reset<br/><br/> Admin permissions:<br/> - lock_host<br/> - sudo_admin<br/> - impersonate<br/> - admin |
**Result** | True/False based on success | |

**Example**

```python
qb.setusers('add'   , 'myuser', permissions=['all', 'admin'])
qb.setusers('add'   , 'myuser', group='mygroup', permissions=['all', 'admin'])
qb.setusers('set'   , 'myuser', permissions=['all', 'admin'])
qb.setusers('remove', 'myuser', permissions=['preempt'])
```

---

### qb.shove
| | | |
|---|---|---|
**Purpose** | Force the re-evaluation of a pending job for running on Workers | :Since: Qube 5.5 |
**Prototype** | `qb.shove(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected jobids (['jobid']) | |

**Example**

```python
qb.shove(250)
```

---

### qb.stats
| | | |
|---|---|---|
**Purpose** | Retrieve stats list for specified jobid.subjobid. | |
**Prototype** | `qb.stats(subjobid, *extraSubjobids)` | |
**Parameters** | `subjobid` | str jobid or 'jobid.subjobid' to retrieve info for (additional subjobids can be specified) |
**Result** | Stats ([dict])<br/> - jobid -- Job id (int)<br/> - subid -- subjob id (int)<br/> - logtype -- (undefined)<br/> - host -- (undefined)<br/> - data -- stat info<br/> - id -- (undefined)<br/> - cls -- (undefined) | |

**Example**

```python
qb.stats('250.0')  # retrieve stats for job 250, subjob 0 only
```

---

### qb.stderr
| | | |
|---|---|---|
**Purpose** | Retrieve the list of stderr output of the specified range, for the specified subjob. | |
**Prototype** | `qb.stderr(*subjobids, **kwargs)` | |
**Parameters** | `subjobids` | list of str a list of 'jobid.subjobid' for which to retrieve info |
| | `pos` | int position, in bytes, to start reading |
| | `len` | int length, in bytes, to read |
**Result** | output logs (dict)<br/> - jobid -- Job id (int)<br/> - subid -- subjob id (int)<br/> - data -- log info (str)<br/> - fullsize -- full size of the log file, in bytes (int) | |

---

### qb.stdout
| | | |
|---|---|---|
**Purpose** | Retrieve the list of stdout output of the specified range, for the specified subjob. | |
**Prototype** | `qb.stdout(*subjobids, **kwargs)` | |
**Parameters** | `subjobids` | list of str a list of 'jobid.subjobid' to retrieve info for |
| | `pos` | position, in bytes, to start reading |
| | `len` | length, in bytes, to read |
**Result** | output logs (dict)<br/> - jobid -- Job id (int)<br/> - subid -- subjob id (int)<br/> - data -- log info (str)<br/> - fullsize -- full size of the log file, in bytes (int) | |

---

### qb.subid
| | | |
|---|---|---|
**Purpose** | Get the job's subjob id for the job process (jobtype backend) | :Since: Qube 5.3.<br/> :See: Developer docs for information on usage. |
**Prototype** | `qb.subid()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.submit
| | | |
|---|---|---|
**Purpose** | Submit a job or list of jobs to the Supervisor. | |
**Prototype** | `qb.submit(*jobs, **kwargs)` | |
**Parameters** | `jobs` | `Job` or dict job properties to submit (additional Jobs or lists of Jobs can be specified) |
| | `deferTableCreation` | bool whether the supervisor should defer the creation of DB tables [default = True] |
**Result** | list of submitted jobs ([Job]) | |

**Example**

```python
# Simple submission to run "set" command
myjob = qb.Job()
myjob['name'] = 'test submit'
myjob['prototype'] = 'cmdline'
myjob['package'] = {'cmdline' : 'set' }
qb.submit(myjob)# returns a [Job()]
```

```python
#Simple multi-frame submission to echo the frame number
myjob = qb.Job()
myjob['name'] = 'test cmdrange submit'
myjob['prototype'] = 'cmdrange'
myjob['package'] = {'cmdline' : 'echo "Frame QB_FRAME_NUMBER"',
                    'padding' : 0,
                    'range' : '1-10', # QubeUI uses this if present
                   }
myjob['agenda'] = qb.genframes(myjob['package']['range'])
qb.submit(myjob) # returns a [Job()]
```

```python
#Simple per-job multiple dependency example
myjob = qb.Job(name='dependency test', prototype='cmdline', package={'cmdline' : 'set' })
job1 = qb.submit(myjob)[0]
job2 = qb.submit(myjob)[0]
myjob3 = qb.Job(name='dependency test (waitfor)', prototype='cmdline', package={'cmdline' : 'set' })
myjob3['dependency'] = "%i,%i" % (job1.id(), job2.id())
job3 = qb.submit(myjob3)[0]  # returns a Job() that will run after job1 and job2 complete
```

---

### qb.supervisorconfig
| | | |
|---|---|---|
**Purpose** | Query the configuration of the current Supervisor|  :Since: Qube 5.5 |
**Prototype** | `qb.supervisorconfig()` | |
**Parameters** | None. |
**Result** | dict of parameters | |

---

### qb.suspend
| | | |
|---|---|---|
**Purpose** | Sends SUSPEND signal (unix suspend) to specified running jobs. (Linux Workers only) | :See: `resume` |
**Prototype** | `qb.suspend(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.top
| | | |
|---|---|---|
**Purpose** | Move specified jobs to the beginning of the execution order queue, within the same priority. | :See: `joborder`, `bottom` |
**Prototype** | `qb.top(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | affected jobids ([int]) | |

**Example**

```python
qb.top(260)
```

---

### qb.unblock
| | | |
|---|---|---|
**Purpose** | Set job state to pending. | :See: `block` |
**Prototype** | `qb.unblock(jobid, *extraJobids)` | |
**Parameters** | `jobid` | int jobids to affect (additional jobids can be specified) |
**Result** | list of affected subjobids (['jobid.subjobid']) | |

---

### qb.unblockwork
| | | |
|---|---|---|
**Purpose** | Sets specified blocked frames/tasks to pending state. | :See: `unblockwork` |
**Prototype** | `qb.unblockwork(workid, *extraWorkids)` | |
**Parameters** | `workid` | str task/frame specifier 'jobid:workname' (additional workids can be specified) |
**Result** | affected tasks/work items (['jobid:workname']) | |

**Example**

```python
qb.unblockwork('250:0')
qb.unblockwork('250:0', '250:1')
```

---

### qb.updatelocalconfig
| | | |
|---|---|---|
**Purpose** | Saves the specified config parameters to local qb.conf file. Automatically prompt for authentication as needed on OSX. | :Since: Qube 5.5<br/> :See: `localconfig` |
**Prototype** | `qb.updatelocalconfig(configDict, auth=True)` | |
**Parameters** | `configDict` | dict dict of configuration string parameters |
| | `auth` | bool allow authentication dialog to prompt for Administrator password as needed (OSX only) |
**Result** | success (bool) | |

---

### qb.updatepassword
| | | |
|---|---|---|
**Purpose** | Update supervisor with new Windows password information for a Windows user. | |
**Prototype** | `qb.updatepassword(user=None, password=None, domain=None)` | |
**Parameters** | `user` | str username |
| | `password` | str new password |
| | `domain` | str Windows domain |
**Result** | (bool) True on success, False on failure | |

---

### qb.updateresources
| | | |
|---|---|---|
**Purpose** | Update used/total counts for a dynamic global license resource | :Since: Qube 5.5 |
**Prototype** | `qb.updateresources(resourceDict)` | |
**Parameters** | `resourceDict` | dict \{name:(used, total)} - name : of the resource to update - used : number of resources currently in use - total : total number of resources that can be used. |
**Result** | True/False based on success | |

**Example**

```python
qb.updateresource({'license.maya': (0, 100)})
```

---

### qb.updateworkerconfig
| | | |
|---|---|---|
**Purpose** | Saves the specified config parameters to local qbwrk.conf file. This should be run on the Supervisor machine only. Automatically prompt for authentication as needed on OSX. One should call `qbadmin_reconfigureworkers` after this file has been updated to push out the configuration. | :Since: Qube 5.5 :Note: Must be run from Supervisor machine.<br/> :See: qbadmin_reconfigureworkers |
**Prototype** | `qb.updateworkerconfig(configDict, hostnames, auth=True)` | |
**Parameters** | `configDict` | dict dict of configuration string parameters |
| | `hostnames` | list list of Worker hostnames to update with these values |
| | `auth` | bool allow authentication dialog to prompt for Administrator password as needed (OSX only) |
**Result** | success (bool) | |

---

### qb.updateworkerproperties
| | | |
|---|---|---|
**Purpose** | Update value of worker properties | :Since: Qube 6.3 |
**Prototype** | `qb.updateworkerproperties(worker, properties)` | |
**Parameters** | `worker` | str worker name |
| | `properties` | str property string |
**Result** | True/False based on success | |

**Example**

```python
qb.updateworkerproperties("host1", "host.diskfree=4.5")
```

---

### qb.updateworkerresources
| | | |
|---|---|---|
**Purpose** | Update used/total counts for worker resources | :Since: Qube 6.3 |
**Prototype** | `qb.updateworkerresources(worker, resources)` | |
**Parameters** | `worker` | str worker name |
| | `resources` | str resource string |
**Result** | True/False based on success | |

**Example**

```python
qb.updateworkerresources("host1", "host.diskusage=13210/80000")
```

---

### qb.validatejob
| | | |
|---|---|---|
**Purpose** | Test that a qb.Job object does not have invalid or malformed values **New in Qube 6.9-1** | |
**Prototype** | `qb.validatejob(jobid, agenda=False, subjobs=False, verbose=False)` | |
**Parameters** | `jobid` | Job id - ``int`` |
| | `agenda` | if True, check each agenda item - ``Boolean`` |
| | `subjobs` | if True, check each job instance - ``Boolean`` |
| | `verbose` | if True, print the name of the malformed job field - ``Boolean`` |
**Result** | ``Boolean`` | |

**Example**

```python
qb.validatejob(123)
qb.validatejob(345, verbose=True)
qb.validatejob(345, agenda=True, subjobs=True, verbose=True)
```

---

### qb.version
| | | |
|---|---|---|
**Purpose** | Returns version number for qube. | |
**Prototype** | `qb.version()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.waitfor
| | | |
|---|---|---|
**Purpose** | Wait for a specific event. This is useful for waiting for a specific event, to allow external scripts to wait for jobs before progressing. | :Since: Qube 5.3. |
**Prototype** | `qb.waitfor(post, timeout)` | |
**Parameters** | `post` | post |
| | `timeout` | timeout |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workblock
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'blockwork' | |
**Prototype** | `qb.workblock(*args, **kwargs)` | |
**Parameters** | `*args` | *args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workcomplete
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'retirework' | |
**Prototype** | `qb.workcomplete(*args, **kwargs)` | |
**Parameters** | `*args` | *args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workerconfig
| | | |
|---|---|---|
**Purpose** | Query the configuration of the specified Worker | :Since: Qube 5.5 |
**Prototype** | `qb.workerconfig(name)` | |
**Parameters** | `name` | name |
**Result** | dict of parameters | |

---


### qb.workerlock
| | | |
|---|---|---|
**Purpose** | Sets the locking string for machines used as Workers. | |
**Prototype** | `qb.workerlock(filters=\{}, lockingString='', name=None, lock=None, purge=False)` | |
**Parameters** | `filters` | dict properties to filter the workers to lock/unlock. Valid keys=['name'] (default=\{}) |
| | `lockingString` | str comma-separated string used to control lock behavior of host. (default='')<br/><br/> - *Options*:<br/> - host.processor_all=\<val> -- specify action for all the processors<br/> - host.processor_\<#>=\<val> -- specify action for processor n<br/> - host.lock_mode=aggressive -- immediately purge running jobs off of processors locked<br/> - *Locking values \<val>*:<br/> - For Off/On use: 0=Off, 1=On<br/> - For Watchdog (Windows only): (delay is minutes before idle):: watchdog \<delay><br/> - For Scheduling, use the week calendar to specify timeslots per hour (starts with Sunday)::<br/> weekcalendar \{ 0 '0' '0' '0' '0' '0' '0' '0'<br/> 1 '0' '0' '0' '0' '0' '0' '0'<br/> 2 '0' '0' '0' '0' '0' '0' '0'<br/> 3 '0' '0' '0' '0' '0' '0' '0'<br/> 4 '0' '0' '0' '0' '0' '0' '0'<br/> 5 '0' '0' '0' '0' '0' '0' '0'<br/> 6 '0' '0' '0' '0' '0' '0' '0'<br/> 7 '1' '1' '1' '1' '1' '1' '0'<br/> 8 '1' '1' '1' '1' '1' '1' '0'<br/> 9 '1' '1' '1' '1' '1' '1' '0'<br/> 10 '1' '1' '1' '1' '1' '1' '0'<br/> 11 '1' '1' '1' '1' '1' '1' '0'<br/> 12 '1' '1' '1' '1' '1' '1' '0'<br/> 13 '1' '1' '1' '1' '1' '1' '0'<br/> 14 '1' '1' '1' '1' '1' '1' '0'<br/> 15 '0' '0' '0' '0' '0' '0' '0'<br/> 16 '0' '0' '0' '0' '0' '0' '0'<br/> 17 '0' '0' '0' '0' '0' '0' '0'<br/> 18 '0' '0' '0' '0' '0' '0' '0'<br/> 19 '0' '0' '0' '0' '0' '0' '0'<br/> 20 '0' '0' '0' '0' '0' '0' '0'<br/> 21 '0' '0' '0' '0' '0' '0' '0'<br/> 22 '0' '0' '0' '0' '0' '0' '0'<br/> 23 '0' '0' '0' '0' '0' '0' '0' } |
| | `name` | str filter shortcut. name='myhost' -> filters=\{'name':'myhost'} |
| | `lock` | bool lockingString shortcut. lock=False/True -> lockingString='host.processor_all=0/1' |
| | `purge` | bool lockingString shortcut. purge=True -> lockingString += ',host.lock_mode=aggressive' :Return: hostnames of affected machines ([str]) |
**Result** | See function documentation / return value from Qube API. | |

**Example**

```python
qb.workerlock(name='myhost', lock=True)  # locks 'myhost'
qb.workerlock(name='myhost', lock=True, purge=True) # locks 'myhost' and purges running jobs from host
qb.workerlock(name='myhost', lock=False) # unlock 'myhost'
qb.workerlock(lockingString='host.processor_0=1,host.processor_1=1', name='myhost')
```

---

### qb.workerpathmap
| | | |
|---|---|---|
**Purpose** | Return the current worker's worker pathmap (jobtype backend) | :See: Developer docs for information on usage. |
**Prototype** | `qb.workerpathmap()` | |
**Parameters** | None. |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workerping
| | | |
|---|---|---|
**Purpose** | Ping the specified Worker to confirm it is present and available. | :Since: Qube 5.5 |
**Prototype** | `qb.workerping(worker, asDict=False)` | |
**Parameters** | `worker` | str Specify the explicit IP address or hostname of the Worker to ping. |
| | `asDict` | bool return a dict containing details on the ping |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workkill
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'killwork' | |
**Prototype** | `qb.workkill(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workrequeue
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'requeuework' | |
**Prototype** | `qb.workrequeue(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workretry
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'retrywork' | |
**Prototype** | `qb.workretry(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

### qb.workunblock
| | | |
|---|---|---|
**Purpose** | :Deprecated: Use 'unblockwork' | |
**Prototype** | `qb.workunblock(*args, **kwargs)` | |
**Parameters** | `*args` | \*args |
| | `**kwargs` | **kwargs |
**Result** | See function documentation / return value from Qube API. | |

---

## Data / Constants

- `QB_API_BINARY = 1`
- `QB_API_XML = 2`
- `QB_CLIENT_DEFAULT_CONF = '/etc/qb.conf'`
- `QB_SUPERVISOR_CONFIG_DEFAULT_LICENSE_FILE = '/etc/qb.lic'`
- `QB_SUPERVISOR_CONFIG_DEFAULT_LOGFILE = '/var/log/supelog'`
- `QB_SUPERVISOR_CONFIG_DEFAULT_LOGPATH = '/var/spool/qube'`
- `QB_SUPERVISOR_CONFIG_DEFAULT_WORKER_CONFIGFILE = '/etc/qbwrk.conf'`
- `QB_TIME_EPOCH_OFFSET = 946702800`
- `QB_WORKER_CONFIG_DEFAULT_LOGFILE = '/var/log/workerlog'`
- `__docformat__ = 'restructuredtext en'`
- `qbPythonVer = '_qb<version>'`
