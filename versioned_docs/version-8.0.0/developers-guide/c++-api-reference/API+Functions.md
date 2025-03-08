---
sidebar_position: 1
---

# API Functions

## qbbackup

|  |  |
---|---  
**Purpose**|  Backup Supervisor state database.  
**Prototype**|  QB_BOOL qbbackup()  
  
## qbblock

|  |  |
---|---  
**Purpose**|  Sets job state to blocked.  
**Prototype**|  QB_BOOL qbblock(QbCommand cmd&, QbJobIdList& jobs)  
  
## qbblockwork

|  |  |
---|---  
**Purpose**|  Blocks work agenda items.  
**Prototype**|  QB_BOOL qbblockwork(QbCommand& cmd, QbWorkIdList& list)  
  
## qbbottom

|  |  |
---|---  
**Purpose**|  Moves jobs to end of execution order queue.  
**Prototype**|  QB_BOOL qbbottom(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbcapturehosts

|  |  |
---|---
**Purpose**|  Forces Supervisor to reacquire Worker hosts.
**Prototype**|  QB_BOOL qbcapturehosts()
**Parameters**|  None
  
## qbcompletework

|  |  |
---|---  
**Purpose**|  Sets work agenda items state to complete.  
**Prototype**|  QB_BOOL qbcompletework(QbCommand& cmd, QbWorkIdList& list)  
  
## qbconfigworkers

|  |  |
---|---
**Purpose**|  Forces Supervisor to send updated configuration information to workers.
**Prototype**|  QB_BOOL qbconfigworkers()
**Parameters**|  None
  
## qbcurrentdomain

|  |  |
---|---
**Purpose**|  Returns the current domain setting.
**Prototype**|  QbString qbcurrentdomain()
**Parameters**|  None
**Result**| **Linux** : NIS domainname <br/> **Windows** : Windows domain.
  
## qbcurrenttime

|  |  |
---|---
**Purpose**|  Returns the current time according to the Supervisor.
**Prototype**|  QB_INT qbcurrenttime()
**Parameters**|  None
**Result**|  Number of seconds since the Unix Epoch (00:00:00, Jan 1, 1970)
  
## qbcurrentuser

|  |  |
---|---
**Purpose**|  Returns the current user name, regardless of platform.
**Prototype**|  QbString qbcurrentuser()
**Parameters**|  None
**Result**|  String representing user name.
  
## qbdecodepackage

|  |  |
---|---  
**Purpose**|  Decodes job package from encoded string to data structure.  
**Prototype**|  QbString qbdecodepackage(const QbString& src)  
  
## qberror

|  |  |
---|---
**Purpose**|  Creates error object.
**Prototype**|  const QbString& qberror()
**Parameters**|  None
  
## qbfilterparam

|  |   |  |
---|---|---
**Purpose**|  Creates a parameter filter object.
**Prototype**|  QbFilter\* qbfilterparam(const QbString& name, const QbString& value)
**Parameters**|   name  | String containing the name of the filter
|              |   value | String containing the filter's value
**Result**|  Filter object.
  
## qbgetpass

|  |   |  |
---|---|---
**Purpose**|  Reads command line password entry
**Prototype**|  char* qbgetpass(char* str)
**Parameters**|  str | Command line prompt string
**Result**|  Input string, stripped of terminating newline or carriage return
**Comments**|  **Windows** only
  
## qbgrouppermissions

|  |  |
---|---  
**Purpose**|  Assigns permissions to user groups.  
**Prototype**|  QB_BOOL qbgrouppermissions(const QbString& method, QB_INT perm, const QbString& group, QbStringList& users)  
**Comments**|  User must have Qube administrator privileges.  
  
## qbhist

|  |   |  |
---|---|---
**Purpose**|  Returns a list of history objects corresponding to the job query.
**Prototype**|  QB_BOOL qbhist(QbCommand& cmd, QbHistoryList& histlist)
**Parameters**|   cmd | Pointer to a QbCommand object containing job IDs  
|              |   histlist | Pointer to a list of QbHistory objects  
**Result**|  QB_TRUE if the command executed correctly,<br/> QB_FALSE otherwise
  
## qbhostinfo

|  |  |
---|---  
**Purpose**|  Returns information from list of hosts.  
**Prototype**|  QB_BOOL qbhostinfo(QbQuery& query, QbHostList& hosts)  
  
## qbhostping

|  |  |
---|---  
**Purpose**|  Attempt to contact arbitrary host.  
**Prototype**|  QB_BOOL qbhostping(const QbString& host, QB_INT port, QbString& stats)  
  
## qbinterrupt

|  |  |
---|---  
**Purpose**|  Forces running jobs back to pending state immediately.  
**Prototype**|  QB_BOOL qbinterrupt(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbjobid

|  |  |
---|---
**Purpose**|  Creates new job ID.
**Prototype**|  QB_INT qbjobid()
**Parameters**|  None
  
## qbjobinfo

|  |   |  |
---|---|---
**Purpose**|  Generates a list of job objects matching query filter.
**Prototype**|  QB_BOOL qbjobinfo(QbQuery& query, QbJobList& jobs)
**Parameters**|   query | Pointer to a query object containing a list of queries
|              |   jobs | List of job objects matching the query
**Result**|  QB_TRUE if the query returned successfully,<br/> QB_FALSE otherwise
  
  
## qbjobobj

|  |  |
---|---
**Purpose**|  Creates or retrieves a job description object.
**Prototype**|  QbJob\* qbjobobj()
**Parameters**|  None
  
## qbjoborder

|  |  |
---|---  
**Purpose**|  Returns a list of jobs eligible to run on specified hosts.  
**Prototype**|  QB_BOOL qbjoborder(QbQuery& query, QbJobList& jobs)  
  
## qbkill

|  |  |
---|---  
**Purpose**|  Kills jobs.  
**Prototype**|  QB_BOOL qbkill(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbkillwork

|  |  |
---|---  
**Purpose**|  Kills work agenda items.  
**Prototype**|  QB_BOOL qbkillwork(QbCommand& cmd, QbWorkIdList& list)  
  
## qbmigrate

|  |  |
---|---  
**Purpose**|  Interrupt a running job and force to run on a different host.  
**Prototype**|  QB_BOOL qbmigrate(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbmodify

|  |  |
---|---  
**Purpose**|  Modifies various job parameters.  
**Prototype**|  QB_BOOL qbmodify(QbModifyCommand& cmd, QbJobIdList& jobs)  
  
## qbping

|  |  |
---|---  
**Purpose**|  Attempt to contact Supervisor  
**Prototype**|  QB_BOOL qbping(QbString& stats)  
  
## qbpreempt

|  |  |
---|---  
**Purpose**|  Forces running jobs back to pending state after agenda item is completed.  
**Prototype**|  QB_BOOL qbpreempt(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbqueuesummary

|  |  |
---|---  
**Purpose**|  Generates a summary of overall job activity.  
**Prototype**|  QB_BOOL qbqueuesummary(QbStringList& types, QbDataTableList& datatablelist);  
  
## qbremove

|  |  |
---|---  
**Purpose**|  Removes jobs from the Supervisor database cache.  
**Prototype**|  QB_BOOL qbremove(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbremovehost

|  |  |
---|---  
**Purpose**|  Forces Supervisor to remove host from internal tables.  
**Prototype**|  QB_BOOL qbremovehost(QbStringList& acc)  
  
## qbreportjob

|  |  |
---|---  
**Purpose**|  Returns updated job status to Supervisor.  
**Prototype**|  QB_BOOL qbreportjob(const QbStatus& st);  
  
## qbreportwork

|  |  |
---|---  
**Purpose**|  Returns updated work agenda item to Supervisor.  
**Prototype**|  QB_BOOL qbreportwork(QbWork& wrk)  
  
## qbrequestwork

|  |  |
---|---  
**Purpose**|  Asks Supervisor for a work agenda item.  
**Prototype**|  QB_BOOL qbrequestwork(QbWork& wrk)  
  
## qbrequeue

|  |  |
---|---  
**Purpose**|  Resets a failed, complete or killed job back to a initial blocked state.  
**Prototype**|  QB_BOOL qbrequeue(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbrequeuework

|  |  |
---|---  
**Purpose**|  Reset work agenda items to blocked state.  
**Prototype**|  QB_BOOL qbrequeuework(QbCommand& cmd, QbWorkIdList& list)  
  
## qbreset

|  |  |
---|---  
**Purpose**|  Send signal to Supervisor requesting it to reconnect with its database server.  
**Prototype**|  QB_BOOL qbreset()  
  
## qbresource

|  |  |
---|---  
**Purpose**|  Query Supervisor for list of resources.  
**Prototype**|  QB_BOOL qbresource(QbResourceList& resources)  
  
## qbresume

|  |  |
---|---  
**Purpose**|  Sends resume signal to suspended jobs.  
**Prototype**|  QB_BOOL qbresume(QbCommand& cmd, QbJobIdList& jobs)  
**Comments**|  Unix only  
  
## qbresync

|  |  |
---|---  
**Purpose**|  Sends signal to Supervisor requesting a resync with slave Supervisor.  
**Prototype**|  QB_BOOL qbresync()  
  
## qbretry

|  |  |
---|---  
**Purpose**|  Resets failed, complete, or killed jobs back to the pending state.  
**Prototype**|  QB_BOOL qbretry(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbretrywork

|  |  |
---|---  
**Purpose**|  Reset work agenda items to pending state.  
**Prototype**|  QB_BOOL qbretrywork(QbCommand& cmd, QbWorkIdList& list)  
  
## qbshove

|  |  |
---|---  
**Purpose**|  Forces Supervisor to reevaluate jobs' position in execution order.  
**Prototype**|  QB_BOOL qbshove(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbsleep

|  |   |  |
---|---|---
**Purpose**|  Suspends process for specified length of time.
**Prototype**|  QB_VOID qbsleep(QB_INT sec)
**Parameters**| sec | seconds
|              | sec | **Windows** : milliseconds
**Result**|  None
  
## qbstats

|  |  |
---|---  
**Purpose**|  Reports job statistics  
**Prototype**|  QB_BOOL qbstats(QbCommand& cmd, QbLogList& loglist)  
  
## qbstderr

|  |  |
---|---  
**Purpose**|  Retrieves job STDERR log file output.  
**Prototype**|  QB_BOOL qbstderr(QbCommand& cmd, QbLogList& loglist)  
  
## qbstderrstream

|  |  |
---|---  
**Purpose**|  Generates a continuous output stream of subjob STDERR  
**Prototype**|  QB_INT qbstderrstream(QB_INT jobid, QB_INT subid, QB_INT pos, QbString& data)  
  
## qbstdout

|  |   |  |
---|---|---
**Purpose**|  Retrieves job STDOUT log file output.
**Prototype**|  QB_BOOL qbstdout(QbCommand& cmd, QbLogList& loglist)
**Parameters**|  cmd | Pointer to a QbCommand object containing job IDs
|             |  loglist | Pointer to a list of QbLog objects corresponding to the job IDs in QbComand
**Result**|  QB_TRUE if the command executed correctly,<br/> QB_FALSE otherwise   
  
## qbstdoutstream

|  |  |
---|---  
**Purpose**|  Generate a continuous output stream of subjob STDOUT  
**Prototype**|  QB_INT qbstdoutstream(QB_INT jobid, QB_INT subid, QB_INT pos, QbString& data)  
  
## qbsubid

|  |  |
---|---
**Purpose**|  Creates new subjob ID.
**Prototype**|  QB_INT qbsubid()
**Parameters**|  None
  
## qbsubmit

|  |   |  |
---|---|---
**Purpose**|  Submits a list of jobs to be dispatched by the Supervisor.
**Prototype**|  QB_BOOL qbsubmit(QbJobList& submit, QbJobList& result, QB_BOOL deferTableCreation = QB_FALSE)
**Parameters**| submit | Pointer to a list of job objects to be submitted
|              | result | Pointer to an updated list of job objects submitted to the Supervisor
|              | deferTableCreation | Whether the supervisor should defer DB table creation or not (default FALSE)
**Result**|  QB_TRUE if the job list was submitted successfully,<br/> QB_FALSE otherwise
  
## qbsubmitcallback

|  |   |  |
---|---|---
**Purpose**|  Submit a list of callbacks associated with certain events.
**Prototype**|  QB_BOOL qbsubmitcallback(QbCallbackList& sub, QbCallbackList& cbs)
**Parameters**| sub | Pointer to a list of callback objects to be submitted
|              | cbs | Pointer to the updated list of callback objects registered with the Supervisor
**Result**|  QB_TRUE if the callbacks were submitted successfully,<br/> QB_FALSE otherwise
  
## qbsubmitpost

|  |  |
---|---  
**Purpose**|  Submit a list of post callbacks associated with certain events.
**Prototype**|  QB_BOOL qbsubmitpost(QbPostList& posts)  
  
## qbsupervisorconfig

|  |  |
---|---  
**Purpose**|  Query Supervisor for configuration information.  
**Prototype**|  QB_BOOL qbsupervisorconfig(QbConfig& config)  
  
## qbsupervisorsetmode

|  |  |
---|---  
**Purpose**|  Sets Supervisor operating modes.  
**Prototype**|  QB_BOOL qbsupervisorsetmode(const QbString& val)  
  
## qbsupervisorunsetmode

|  |  |
---|---  
**Purpose**|  Unsets Supervisor operating modes.  
**Prototype**|  QB_BOOL qbsupervisorunsetmode(const QbString& val)  
  
## qbsuspend

|  |  |
---|---  
**Purpose**|  Sends the SUSPEND signal to running jobs  
**Prototype**|  QB_BOOL qbsuspend(QbCommand& cmd, QbJobIdList& jobs)  
**Comments**|  Unix only  
  
## qbsystem

|  |  |
---|---  
**Purpose**|  Executes an arbitrary command process.  
**Prototype**|  QB_INT qbsystem(QbString cmd)  
  
## qbthishostname

|  |  |
---|---
**Purpose**|  Returns the name of the host, regardless of platform.
**Prototype**|  QbString qbthishostname()
**Parameters**|  None
**Result**|  Host name if it can be determined, "127.0.0.1" (the loopback host address) otherwise.
  
## qbtop

|  |  |
---|---  
**Purpose**|  Moves jobs to the head of execution order queue.  
**Prototype**|  QB_BOOL qbtop(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbtrigger

|  |  |
---|---  
**Purpose**|  Signal Supervisor with event trigger.  
**Prototype**|  QB_BOOL qbtrigger(const QbString& trigger)  
  
## qbunblock

|  |  |
---|---  
**Purpose**|  Unblocks jobs so they can begin executing when hosts become available.  
**Prototype**|  QB_BOOL qbunblock(QbCommand& cmd, QbJobIdList& jobs)  
  
## qbunblockwork

|  |  |
---|---  
**Purpose**|  Unblocks work agenda items.  
**Prototype**|  QB_BOOL qbunblockwork(QbCommand& cmd, QbWorkIdList& list)  
  
## qbupdatepassword

|  |  |
---|---  
**Purpose**|  Update Supervisor with new password information.  
**Prototype**|  QB_BOOL qbupdatepassword(const QbString& user, const QbString& domain, const QbString& passwd);  
**Comments**|  **Windows** only.  
  
## qbupdateresource

|  |  |
---|---  
**Purpose**|  Update Supervisor resource.  
**Prototype**|  QB_BOOL qbupdateresource(QbResourceList& acc)  
  
## qbuserpermissions

|  |  |
---|---  
**Purpose**|  Assigns access permissions to users.  
**Prototype**|  QB_BOOL qbuserpermissions(const QbString& method, QB_INT perm, QbStringList& users)  
**Comments**|  User must have Qube administrator privileges.  
  
## qbusers

|  |  |
---|---  
**Purpose**|  Returns current users list.  
**Prototype**|  QB_BOOL qbusers(QbAccessList& acc)  
  
## qbversion

|  |  |
---|---
**Purpose**|  Returns Qube version number.
**Prototype**|  QbString qbversion()
**Parameters**|  None
**Result**|  QB_VERSION_NUMBER
  
## qbwaitfor

|  |  |
---|---  
**Purpose**|  Sets the job that must reach the done state before starting.  
**Prototype**|  QB_BOOL qbwaitfor(QbString& trigger, QB_INT timeout)  
  
## qbworkerassign

|  |  |
---|---  
**Purpose**|  Sets Worker assignment list.  
**Prototype**|  QB_BOOL qbworkerassign(const QbString& host, QbAssignmentList& info)  
  
## qbworkerconfig

|  |  |
---|---  
**Purpose**|  Query Worker for configuration information.  
**Prototype**|  QB_BOOL qbworkerconfig(const QbString& name, QbConfig& config)  
  
## qbworkerinfo

|  |  |
---|---  
**Purpose**|  Gathers information from Worker.  
**Prototype**|  QB_BOOL qbworkerinfo(const QbString& host, QbHost& info)  
  
## qbworkerlock

|  |  |
---|---  
**Purpose**|  Registers locks with hosts.  
**Prototype**|  QB_BOOL qbworkerlock(QbString& locks, const QbString& host);  
  
## qbworkerping

|  |  |
---|---  
**Purpose**|  Attempt to contact specified Worker  
**Prototype**|  QB_BOOL qbworkerping(const QbString& host, QbString& stats)  
  
## qbworkerupdatevars

|  |  |
---|---  
**Purpose**|  Force Worker to update variable list.  
**Prototype**|  QB_BOOL qbworkerupdatevars(QbStringHash& vars, const QbString& host)  
  
