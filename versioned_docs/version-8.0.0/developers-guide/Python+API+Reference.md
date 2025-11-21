---
sidebar_position: 13
---

# Python API Reference

## Classes

### qb.QBObject

| | | |
|---|---|---|
**Purpose** |  Base class for Qube Python API objects. | |
**Prototype** |  `class QBObject(object)` | |
**Parameters** |  – | Base for derived classes (`Job`, `Subjob`, `Work`, `Host`, etc.). |
**Result** |  Initialized object with automatic attribute handling. |
**Comments** |  Provides property access and automatic dictionary conversion. |

**Example**

```python
from qb import QBObject
class MyObj(QBObject): pass
o = MyObj({'field': 'value'})
print(o.field)
```

---

### qb.Subjob

| | | |
|---|---|---|
**Purpose** |  Represents an individual subjob belonging to a parent job. | |
**Prototype** |  `class Subjob(QBObject)` | |
**Parameters** |  data | Dictionary or Subjob instance for initialization. |
**Result** |  `Subjob` object. |
**Comments** |  Contains fields such as `id`, `status`, `work`, `agenda`, etc. |

**Example**

```python
sub = qb.Subjob({'id': '250.0', 'status': 'running'})
print(sub.id, sub.status)
```

---

### qb.Work

| | | |
|---|---|---|
**Purpose** |  Represents a single work item or frame. | |
**Prototype** |  `class Work(QBObject)` | |
**Parameters** |  data | Dictionary or Work instance to initialize. |
**Result** |  `Work` object. |
**Comments** |  Used to define tasks (frames) within a subjob agenda. |

**Example**

```python
work = qb.Work({'name': 'frame_1', 'status': 'pending'})
print(work.name, work.status)
```

---

### qb.Host

| | | |
|---|---|---|
**Purpose** |  Represents a single worker host. | |
**Prototype** |  `class Host(QBObject)` | |
**Parameters** |  data | Dictionary or Host instance to initialize. |
**Result** |  `Host` object. |
**Comments** |  Contains fields such as `name`, `address`, `state`, `cluster`, `groups`, and `resources`. |

**Example**

```python
h = qb.Host({'name': 'worker01', 'state': 'running'})
print(h.name, h.state)
```

---

### qb.Job

| | | |
|---|---|---|
**Purpose** |  Container class for Qube job properties. Represents jobs submitted by the user. | |
**Prototype** |  `class Job(QBObject)` | |
**Parameters** |  data | Dictionary or existing `Job` used to initialize properties. |
| | name | Optional job name. |
| | prototype | Optional job type. |
| | package | Optional package dictionary. |
**Result** |  `Job` object. |
**Comments** |  Jobs contain fields like `id`, `name`, `status`, `priority`, `package`, `requirements`, `hosts`, `subjobs`, etc. |

**Example**

```python
from qb import Job
myjob = Job(name='example', prototype='cmdline', package={'cmdline': 'echo hello'})
qb.submit(myjob)
```

## Functions

### qb.archivejob

| | | |
|---|---|---|
**Purpose** |  Saves a Job to a file in the specified format. | |
**Prototype** |  `qb.archivejob(filename, job, format=QB_API_XML)` | |
**Parameters** |  filename | Path to the output file. |
| | job | Job object or dictionary to save. |
| | format | Format type. Options: `QB_API_XML` (default) or `QB_API_BINARY`. |
**Result** |  File size in bytes (integer). |
**Comments** |  Use with `qb.recoverjob()` to reload saved jobs. |

**Example**

```python
myjob = qb.jobinfo(id=277)[0]
qb.archivejob('c:/myjob.xml', myjob)
```

---

### qb.bannedworkers

| | | |
|---|---|---|
**Purpose** |  Retrieves a list of banned worker hosts. | |
**Prototype** |  `qb.bannedworkers()` | |
**Parameters** |  – | None. |
**Result** |  List of `Host` objects with limited info (MAC, IP, hostname). |

**Example**

```python
banned = qb.bannedworkers()
for w in banned:
    print(f"name={w['name']}, mac={w['macaddress']}, ip={w['address']}")
```

---

### qb.block

| | | |
|---|---|---|
**Purpose** |  Sets job state to blocked. | |
**Prototype** |  `qb.block(jobid, *extraJobids)` | |
**Parameters** |  jobid | Primary job ID to block. Additional IDs may be specified. |
**Result** |  List of affected subjob IDs (`['jobid.subjobid']`). |
**Comments** |  See also `qb.unblock()`. |

**Example**

```python
qb.block(250)
```

---

### qb.blockwork

| | | |
|---|---|---|
**Purpose** |  Sets specified pending frames or tasks to a blocked state. | |
**Prototype** |  `qb.blockwork(workid, *extraWorkids)` | |
**Parameters** |  workid | Work identifier in format `'jobid:workname'`. Additional IDs may be specified. |
**Result** |  List of affected work items (`['jobid:workname']`). |
**Comments** |  See also `qb.unblockwork()`. |

**Example**

```python
qb.blockwork('250:0', '250:1')
```

---

### qb.bottom

| | | |
|---|---|---|
**Purpose** |  Moves specified jobs to the end of the execution queue. | |
**Prototype** |  `qb.bottom(jobid, *extraJobids)` | |
**Parameters** |  jobid | Primary job ID to affect. Additional IDs may be specified. |
**Result** |  List of affected job IDs. |
**Comments** |  See also `qb.top()` and `qb.joborder()`. |

**Example**

```python
qb.bottom(250)
```
### qb.Callback

| | | |
|---|---|---|
**Purpose** |  Container for Qube Callback properties. Executes an action when triggered by an event. | |
**Prototype** |  `class Callback(QBObject)` | |
**Parameters** |  data | Dictionary or `Callback` instance with initialization properties (optional). |
**Result** |  Callback object. |
**Comments** |  Triggers execute on job or work events such as *complete*, *failed*, *killed*, *running*, *waiting*, etc. |

**Example**

```python
from qb import Callback

cb = Callback({
    "triggers": ["complete-job-self"],
    "code": "print('Job complete!')",
    "language": "python",
    "user": "admin"
})
```

---

### qb.genchunks

| | | |
|---|---|---|
**Purpose** |  Generates a work agenda divided into chunks based on a frame range. | |
**Prototype** |  `qb.genchunks(chunksize, range, *extraRanges, **kwargs)` | |
**Parameters** |  chunksize | Number of frames per chunk. |
| | range | Frame range string (e.g., `"1-100"`). |
| | binarySort | (Keyword) Perform binary sort of frames. Default: False. |
**Result** |  List of `Work` objects. |
**Comments** |  Automatically removes duplicate frames. |

**Example**

```python
import qb
frames = qb.genchunks(10, '1-100')
frames = qb.genchunks(5, '-100--10')
```

---

### qb.genframes

| | | |
|---|---|---|
**Purpose** |  Generates a work agenda of individual frames based on a range list. | |
**Prototype** |  `qb.genframes(range, *extraRanges, **kwargs)` | |
**Parameters** |  range | Frame range string (e.g., `"1-10x2"`). |
| | binarySort | (Keyword) Perform binary sort of frames. Default: False. |
| | removeDuplicates | (Keyword) Remove duplicates. Default: True. |
**Result** |  List of `Work` objects. |
**Comments** |  Equivalent to `qb.genchunks()` but without chunk grouping. |

**Example**

```python
import qb
frames = qb.genframes('1-10x2')
frames = qb.genframes('-10--1x2')
```

---

### qb.genpartitions

| | | |
|---|---|---|
**Purpose** |  Splits frame ranges into a specified number of partitions. | |
**Prototype** |  `qb.genpartitions(numPartitions, range, *extraRanges, **kwargs)` | |
**Parameters** |  numPartitions | Number of partitions to create. |
| | range | Frame range string. |
| | binarySort | (Keyword) Perform binary sort. Default: False. |
**Result** |  List of `Work` objects. |
**Comments** |  Automatically removes duplicate frames. |

**Example**

```python
qb.genpartitions(2, '1-10')
qb.genpartitions(3, '-100--1')
```

---

### qb.hist

| | | |
|---|---|---|
**Purpose** |  Retrieves job or subjob history. | |
**Prototype** |  `qb.hist(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or `'jobid.subjobid'` format. |
**Result** |  List of history dictionaries with fields: `comment`, `stamp`, `jobid`, `subid`, `workid`. |
**Comments** |  Works for both jobs and subjobs. |

**Example**

```python
qb.hist(250)      # all history for job 250
qb.hist('250.0')  # history for subjob 0 of job 250
```

---

### qb.hostinfo

| | | |
|---|---|---|
**Purpose** |  Retrieves information from specified hosts. | |
**Prototype** |  `qb.hostinfo(fields=[], filters={}, name=None, state=None, subjobs=False)` | |
**Parameters** |  fields | List of additional info to retrieve. |
| | filters | Dictionary of host filters. |
| | name | Host name or list of names. |
| | state | Host state or list of states. |
| | subjobs | Whether to include subjob info. |
**Result** |  List of `Host` objects. |
**Comments** |  Host info won’t include subjobs unless requested. |

**Example**

```python
hosts = qb.hostinfo()
hosts = qb.hostinfo(name='myhost')
hosts = qb.hostinfo(state='down')
hosts = qb.hostinfo(subjobs=True)
```

---

### qb.hostorder

| | | |
|---|---|---|
**Purpose** |  Lists hosts in the order likely to run a given job. | |
**Prototype** |  `qb.hostorder(id=None)` | |
**Parameters** |  id | Job ID of interest. |
**Result** |  List of `Host` objects in dispatch order. |

**Example**

```python
hosts = qb.hostorder(id=1234)
```

---

### qb.JobTallyValidator

| | | |
|---|---|---|
**Purpose** |  Validates a job’s `todotally` and `cpustally` dictionaries. | |
**Prototype** |  `class JobTallyValidator(dict)` | |
**Parameters** |  tally_dict | Dictionary to validate. |
**Result** |  Boolean. |
**Comments** |  Ensures all tally counts are non-negative integers. |

**Example**

```python
valid = qb.JobTallyValidator.validate(job['cpustally'])
```

---

### qb.JobValidator

| | | |
|---|---|---|
**Purpose** |  Ensures a `qb.Job` instance is well-formed. | |
**Prototype** |  `class JobValidator(object)` | |
**Parameters** |  job | Dictionary representing a job. |
| | agenda | If True, validate agenda items. |
| | subjobs | If True, validate subjobs. |
| | verbose | Print names of invalid fields if True. |
**Result** |  Boolean. |
**Comments** |  Stops at the first invalid field. Provides per-type validation (int, str, dict, list). |

**Example**

```python
qb.JobValidator.validate(job, agenda=True, verbose=True)
```

---

### qb.kill

| | | |
|---|---|---|
**Purpose** |  Kills specified jobs or subjobs. | |
**Prototype** |  `qb.kill(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or `jobid.subjobid` string. |
**Result** |  List of affected subjobs. |
**Comments** |  Use to terminate jobs immediately. |

**Example**

```python
qb.kill(250)
qb.kill('250.0')
```

---

### qb.killwork

| | | |
|---|---|---|
**Purpose** |  Kills specific frames or tasks. | |
**Prototype** |  `qb.killwork(workid, *extraWorkids)` | |
**Parameters** |  workid | Work specifier like `'250:0'`. |
**Result** |  List of affected tasks/work items. |
**Comments** |  Similar to `qb.kill()`, but operates on frames. |

**Example**

```python
qb.killwork('250:0')
qb.killwork('250:0', '250:1')
```

---

### qb.migrate

| | | |
|---|---|---|
**Purpose** |  Interrupts running jobs and forces them to run on a different host. | |
**Prototype** |  `qb.migrate(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or `'jobid.subjobid'`. |
**Result** |  List of affected subjobs. |

**Example**

```python
qb.migrate(250)
qb.migrate('250.1')
```

---

### qb.modify

| | | |
|---|---|---|
**Purpose** |  Modifies parameters of active jobs. | |
**Prototype** |  `qb.modify(modifyParamDict, jobid, *extraJobids)` | |
**Parameters** |  modifyParamDict | Dictionary of parameters to change. |
| | jobid | Job ID(s) to modify. |
**Result** |  List of affected job IDs. |
**Comments** |  Only incomplete/active jobs can be modified. |

**Example**

```python
qb.modify({'priority': 123}, 250)
```

---

### qb.preempt

| | | |
|---|---|---|
**Purpose** |  Forces running jobs back to pending state after completing their current agenda item. | |
**Prototype** |  `qb.preempt(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or subjob ID(s) to preempt. |
**Result** |  List of affected subjob IDs. |
**Comments** |  Releases hosts gracefully if the job type supports an agenda. |

**Example**

```python
qb.preempt(250)
```

---

### qb.rangechunk

| | | |
|---|---|---|
**Purpose** |  Splits frame ranges into chunks of a specified length. | |
**Prototype** |  `qb.rangechunk(chunksize, range, *extraRanges, **kwargs)` | |
**Parameters** |  chunksize | Number of frames per chunk. |
| | range | Frame range string (e.g., `"1-100"`). |
| | binarySort | (Keyword) Perform binary sort. Default: False. |
**Result** |  List of range strings. |

**Example**

```python
qb.rangechunk(5, '1-20')
qb.rangechunk(5, '-100--1', binarySort=True)
```

---

### qb.rangejoin

| | | |
|---|---|---|
**Purpose** |  Converts a list of frame numbers into a range format string. | |
**Prototype** |  `qb.rangejoin(frames)` | |
**Parameters** |  frames | List of integers. |
**Result** |  Range string (e.g., `"1-10x2"`). |

**Example**

```python
qb.rangejoin([1, 2, 3, 4, 5])
# Returns "1-5"
qb.rangejoin([1, 3, 5, 7, 9, 11, 13])
# Returns "1-13x2"
```

---

### qb.rangeorder

| | | |
|---|---|---|
**Purpose** |  Converts frame ranges into a list of frame numbers ordered by a mode. | |
**Prototype** |  `qb.rangeorder(mode, range)` | |
**Parameters** |  mode | Sort order mode: *binary, reverse, rawbinary, ascend, descend*. |
| | range | Frame range string. |
**Result** |  List of frame numbers. |

**Example**

```python
qb.rangeorder('ascend', '1-10')
qb.rangeorder('binary', '1-10x2')
```

---

### qb.rangesplit

| | | |
|---|---|---|
**Purpose** |  Expands frame ranges into a list of individual frame numbers. | |
**Prototype** |  `qb.rangesplit(range, *extraRanges, **kwargs)` | |
**Parameters** |  range | Frame range string. |
| | binarySort | (Keyword) Perform binary sort. Default: False. |
| | removeDuplicates | (Keyword) Remove duplicates. Default: True. |
**Result** |  List of frame numbers. |

**Example**

```python
qb.rangesplit("1-10x2")
qb.rangesplit("1-5x2,10-12")
```

---

### qb.remove

| | | |
|---|---|---|
**Purpose** |  Removes specified jobs from the Supervisor database cache. | |
**Prototype** |  `qb.remove(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or IDs to remove. |
**Result** |  List of affected job IDs. |

**Example**

```python
qb.remove(250)
```

---

### qb.requeue

| | | |
|---|---|---|
**Purpose** |  Resets failed, complete, or killed jobs to an initial blocked state. | |
**Prototype** |  `qb.requeue(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID(s) to requeue. |
**Result** |  List of affected subjob IDs. |
**Comments** |  Similar to `qb.retry()`, but requeues to a *blocked* state instead of *pending*. |

**Example**

```python
qb.requeue(250)
```

---

### qb.requeuework

| | | |
|---|---|---|
**Purpose** |  Resets terminal frames or tasks (failed, killed, etc.) to a blocked state. | |
**Prototype** |  `qb.requeuework(workid, *extraWorkids)` | |
**Parameters** |  workid | Work specifier like `'250:0'`. |
**Result** |  List of affected work items. |

**Example**

```python
qb.requeuework('250:0')
qb.requeuework('250:25-29')
```

---

### qb.resource

| | | |
|---|---|---|
**Purpose** |  Queries the Supervisor for resource states. | |
**Prototype** |  `qb.resource(resources)` | |
**Parameters** |  resources | Dictionary describing resource keys and values. |
**Result** |  Dictionary of resource state information. |

**Example**

```python
resources = qb.resource({'memory': '>=16GB', 'cpus': '>=4'})
```

---

### qb.resume

| | | |
|---|---|---|
**Purpose** |  Resumes suspended jobs. | |
**Prototype** |  `qb.resume(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID(s) to resume. |
**Result** |  List of affected subjob IDs. |

**Example**

```python
qb.resume(250)
```

---

### qb.retry

| | | |
|---|---|---|
**Purpose** |  Resets terminal jobs (failed, killed, etc.) to a pending state. | |
**Prototype** |  `qb.retry(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID(s) to retry. |
**Result** |  List of affected subjob IDs. |
**Comments** |  Similar to `qb.requeue()`, but moves jobs to *pending* instead of *blocked*. |

**Example**

```python
qb.retry(250)
```

---

### qb.retrywork

| | | |
|---|---|---|
**Purpose** |  Resets terminal frames or tasks to a pending state. | |
**Prototype** |  `qb.retrywork(workid, *extraWorkids)` | |
**Parameters** |  workid | Work specifier like `'250:0'`. |
**Result** |  List of affected work items. |

**Example**

```python
qb.retrywork('250:0')
qb.retrywork('250:0', '250:1')
```

---

### qb.stderr

| | | |
|---|---|---|
**Purpose** |  Retrieves job STDERR log output. | |
**Prototype** |  `qb.stderr(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or subjob ID(s). |
**Result** |  List of dictionaries with keys: `data`, `jobid`, `subid`. |
**Comments** |  Each dictionary contains the stderr log text for the specified subjob(s). |

**Example**

```python
logs = qb.stderr(250)
for entry in logs:
    print(entry['data'])
```

---

### qb.stdout

| | | |
|---|---|---|
**Purpose** |  Retrieves job STDOUT log output. | |
**Prototype** |  `qb.stdout(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or subjob ID(s). |
**Result** |  List of dictionaries with keys: `data`, `jobid`, `subid`. |
**Comments** |  Similar to `qb.stderr()` but returns standard output logs. |

**Example**

```python
logs = qb.stdout(250)
for entry in logs:
    print(entry['data'])
```

---

### qb.submit

| | | |
|---|---|---|
**Purpose** |  Submits a new job to the Supervisor. | |
**Prototype** |  `qb.submit(job)` | |
**Parameters** |  job | `Job` object or dictionary containing job parameters. Must include `"prototype"`. |
**Result** |  Job dictionary with ID assigned. |
**Comments** |  Returns a reference to the submitted job with an assigned ID. |

**Example**

```python
job = {
    "name": "myjob",
    "priority": 12433,
    "cluster": "/project/rnd",
    "requirements": "host.name == qb003 and host.os eq Linux",
    "prototype": "cmdline",
    "package": {"cmdline": "sleep 100"}
}
qb.submit(job)
```

---

### qb.submitcallback

| | | |
|---|---|---|
**Purpose** |  Submits a job callback to execute when a specific event occurs. | |
**Prototype** |  `qb.submitcallback(callback)` | |
**Parameters** |  callback | Dictionary or `Callback` object with callback data. |
**Result** |  List of callback IDs. |
**Comments** |  Use to register event-driven actions such as email alerts or post-job scripts. |

**Example**

```python
cb = {
    "triggers": ["complete-job-self"],
    "code": "print('Job completed!')",
    "language": "python",
    "user": "admin"
}
qb.submitcallback(cb)
```

---

### qb.suspend

| | | |
|---|---|---|
**Purpose** |  Sends the suspend signal to running jobs. | |
**Prototype** |  `qb.suspend(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID(s) to suspend. |
**Result** |  List of affected subjob IDs. |

**Example**

```python
qb.suspend(250)
```

---

### qb.top

| | | |
|---|---|---|
**Purpose** |  Moves jobs to the top of the execution queue. | |
**Prototype** |  `qb.top(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID(s) to move. |
**Result** |  List of affected job IDs. |

**Example**

```python
qb.top(250)
```

---

### qb.unblock

| | | |
|---|---|---|
**Purpose** |  Unblocks jobs so they can

---

### qb.ping

| | | |
|---|---|---|
**Purpose** |  Tests connectivity to the Qube Supervisor and optionally returns host details. | |
**Prototype** |  `qb.ping(host=None, port=None, timeout=10)` | |
**Parameters** |  host | Hostname or IP address of the Supervisor. Defaults to value from environment (`QB_SUPERVISOR`). |
| | port | TCP port number (optional). Defaults to Supervisor’s configured port. |
| | timeout | Timeout in seconds (default: 10). |
**Result** |  Boolean `True` if Supervisor responds; `False` otherwise. |
**Comments** |  Use this to verify Supervisor status before submitting or querying jobs. |

**Example**

```python
# Check connectivity using default Supervisor
if qb.ping():
    print("Supervisor is alive")

# Ping a specific host and port
if qb.ping(host='qubesup.local', port=5001):
    print("Supervisor responded on port 5001")
```

---

### qb.info

| | | |
|---|---|---|
**Purpose** |  Returns detailed information about the Qube Supervisor. | |
**Prototype** |  `qb.info()` | |
**Parameters** |  – | None. |
**Result** |  Dictionary containing Supervisor information such as version, platform, license status, database connection, and configuration paths. |
**Comments** |  Useful for diagnostics or environment verification. |

**Example**

```python
info = qb.info()
print(f"Supervisor: {info['supervisor']}, Version: {info['version']}")
```

---

### qb.jobinfo

| | | |
|---|---|---|
**Purpose** |  Retrieves job information from the Supervisor. | |
**Prototype** |  `qb.jobinfo(fields=[], filters={}, id=None, status=None, agenda=False, subjobs=False, callbacks=False, updatedAfter=None, updatedBefore=None, submittedAfter=None, submittedBefore=None, minid=None, maxid=None, limit=None, orderby=None)` | |
**Parameters** |  fields | Additional fields to include (agenda, subjobs, callbacks). |
| | filters | Dictionary of job filters (id, name, user, status, priority, cluster, prototype, etc.). |
| | id | Filter shortcut for job ID(s). |
| | status | Filter shortcut for job status (complete, failed, running, etc.). |
| | agenda, subjobs, callbacks | Boolean flags to include detailed info. |
| | updatedAfter / updatedBefore | Filter by last update time (epoch). |
| | submittedAfter / submittedBefore | Filter by submission time (epoch). |
| | limit | Maximum number of results. |
| | orderby | Sort order string (e.g., `"id DESC"`). |
**Result** |  List of Job dictionaries. |
**Comments** |  Equivalent to `qb.jobinfo()` in Perl. Returns all jobs if no filters are specified. |

**Example**

```python
jobs = qb.jobinfo(status='running')
for j in jobs:
    print(j['id'], j['name'])
```

---

### qb.joborder

| | | |
|---|---|---|
**Purpose** |  Returns a list of jobs eligible to run on a specified host. | |
**Prototype** |  `qb.joborder(host)` | |
**Parameters** |  host | Host name. |
**Result** |  List of Job dictionaries sorted by dispatch order. |
**Comments** |  Use to test which jobs would run on a given worker. |

**Example**

```python
eligible = qb.joborder('worker01')
for j in eligible:
    print(j['id'], j['priority'])
```

---

### qb.log

| | | |
|---|---|---|
**Purpose** |  Retrieves combined job log output (stdout and stderr). | |
**Prototype** |  `qb.log(jobid, *extraJobids)` | |
**Parameters** |  jobid | Job ID or list of job IDs. |
**Result** |  List of dictionaries with keys: `data`, `jobid`, `subid`. |
**Comments** |  Combines both STDOUT and STDERR for convenience. |

**Example**

```python
logs = qb.log(250)
for l in logs:
    print(l['data'])
```

---

### qb.ping

| | | |
|---|---|---|
**Purpose** |  Tests connectivity to the Qube Supervisor and optionally returns host details. | |
**Prototype** |  `qb.ping(host=None, port=None, timeout=10)` | |
**Parameters** |  host | Hostname or IP of Supervisor (defaults to `QB_SUPERVISOR`). |
| | port | TCP port number. Defaults to configured port. |
| | timeout | Timeout in seconds (default: 10). |
**Result** |  Boolean `True` if Supervisor responds, `False` otherwise. |
**Comments** |  Use to check Supervisor availability before making API calls. |

**Example**

```python
if qb.ping():
    print("Supervisor is alive")
```

---

### qb.version

| | | |
|---|---|---|
**Purpose** |  Returns the version of the Qube Supervisor and API. | |
**Prototype** |  `qb.version()` | |
**Parameters** |  – | None. |
**Result** |  Dictionary with version strings for API, Supervisor, and database schema. |

**Example**

```python
v = qb.version()
print(f"API: {v['api']}, Supervisor: {v['supervisor']}")
```

---

### qb.workerinfo

| | | |
|---|---|---|
**Purpose** |  Retrieves information about worker hosts registered with the Supervisor. | |
**Prototype** |  `qb.workerinfo(fields=[], filters={}, name=None, state=None)` | |
**Parameters** |  fields | Additional data fields to include. |
| | filters | Dictionary of filters. |
| | name | Filter by host name(s). |
| | state | Filter by host state(s). |
**Result** |  List of `Host` dictionaries. |

**Example**

```python
workers = qb.workerinfo(state='running')
for w in workers:
    print(w['name'], w['state'])
```

---

### qb.workorder

| | | |
|---|---|---|
**Purpose** |  Returns the works scheduled to run on a specific host. | |
**Prototype** |  `qb.workorder(host)` | |
**Parameters** |  host | Host name. |
**Result** |  List of work dictionaries. |
**Comments** |  Use to view queued or pending tasks for a worker. |

**Example**

```python
work = qb.workorder('worker01')
for w in work:
    print(w['jobid'], w['agenda'])
```

---

