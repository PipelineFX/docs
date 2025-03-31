---
sidebar_position: 10
---

# How to easily kill or remove an entire job process group

Qube! jobs can belong to a **process group**, which is normally how a group of
jobs define their inter-dependencies.  These process groups can be viewed as a
single set of jobs in QubeUI, or  From many users' points of view, the entire
process group is actually just one **task** , and they'd like to be able to
kill or remove the entire process group as a single unit.

This can be accomplished indirectly through the use of a
[callback](/Callbacks) attached to the first job in the process
group, the **pgrp leader**. This calback can accomplish the killing or
removal  _of all other_  jobs in the pgrp when the leader is killed or
removed.

```py title="deletionCascade.py" showLineNumbers
#!/usr/bin/env python3
import qb
 
task = []
def newJob(name, status='blocked'):
    job = {
        'prototype': 'cmdline',
        'name': 'job %s' % name,
        'label': 'job %s' % name,
        'status': status,
        'package': {
            'cmdline': 'set'
        },
        'callbacks': []
    }
    return job
jobA = newJob('A', 'pending')
 
#=======================================
# add the callback for job removal
#=======================================
cbRemoved = {
    'language': 'python',
    'triggers': 'removed-job-self',
    'code': '''
jobID = qb.jobid()
for i in [x['id'] for x in qb.jobinfo("-pgrp", jobID) if x['id'] != jobID]:
    qb.remove(i)
'''
    }
jobA['callbacks'].append(cbRemoved)
 
#=======================================
# add the callback for job kill
#=======================================
cbKilled = {
    'language': 'python',
    'triggers': 'killed-job-self',
    'code': '''
jobID = qb.jobid()
for i in [x['id'] for x in qb.jobinfo("-pgrp", jobID) if x['id'] != jobID]:
    qb.kill(i)
'''
    }
 
jobA['callbacks'].append(cbKilled)
jobA['package']['cmdline'] = 'sleep 15'
 
task.append(jobA)
 
jobB = newJob('B')
task.append(jobB)
 
jobC = newJob('C')
task.append(jobC)
 
jobD = newJob('D')
task.append(jobD)
 
jobB['dependency'] = 'link-complete-jobA'
jobC['dependency'] = 'link-complete-jobA'
jobD['dependency'] = 'link-complete-jobA'
 
for i in qb.submit(task):
    print('%(name)s: %(id)s' % i)
```
