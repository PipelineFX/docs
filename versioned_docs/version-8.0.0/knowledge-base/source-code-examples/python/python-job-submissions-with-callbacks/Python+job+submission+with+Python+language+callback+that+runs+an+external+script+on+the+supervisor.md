---
sidebar_position: 3
---

# Python job submission with Python callback running an external script on the supervisor

:::warning
* [supervisor_language_flags](/administrators-guide/configuration-parameter-reference/supervisor_language_flags)
must contain "mail" or this callback will silently fail.
:::

Sometimes the best way to perform complex behavior in a callback is to put that behavior into an external script which can take the job ID as an argument.

The following is an example of a callback that runs for every frame when the job completes.  Admittedly, it may be more efficient to run it once and have the external script iterate over every frame, but this is for demonstration purposes.

:::warning[Use subprocess.Popen in the callback]
Please note the use of subprocess.Popen() to run the external script in the callback. This returns immediately and allows the callback to continue running, rather than blocking and waiting for the external script to complete; this ties up the supervisor process for the duration of the external script's execution.

Do **NOT** use os.system() to run the external script, as this call will block until the external script exits. When a large number of callbacks tie up supervisor processes at the same time, your supervisor performance will suffer.
:::

:::danger[Never use sys.exit() in a callback]
Never call sys.exit() at the end of the callback code, this kills the calling supervisor process.
:::

```py
#!/bin/env python3
import os
import sys

sys.path.append('%s/api/python' % os.environ['QBDIR'])
import qb
scriptPathOnSupervisor = '/Users/jburk/test/testCbScript.py'
########################################
# build the job
########################################
job = {
    'prototype': 'cmdrange',
    'name': 'supervisor-side script execution callback test',
    'package': {'cmdline': 'hostname'},
    'agenda': [],
    'callbacks': [ ]
}
########################################
# iterate over the frame range to build the job's agenda and callbacks
########################################
for i in range(5):
    # an agenda item can simply be a frame number
    work = {'name': i}
    job['agenda'].append(work)
    # build a callback for each item in the agenda (each frame)
    cb = {
        'language': 'python',
        'triggers': 'done-job-self',
        'code': '''
import os,subprocess
jobId = qb.jobid()
workName = %s
script = '%s'
if os.path.exists(script):
    pid =  subprocess.Popen(["python", script, str(jobId), str(workName)]).pid
''' % (i, scriptPathOnSupervisor)
    }
    # append the frame's callback to the job's callback list
    job['callbacks'].append(cb)
########################################
# submit the job
########################################
submitted = qb.submit(job)
for job in submitted:
    print('submitted %(id)s: %(name)s' % job)
```


:::tip[Python path]
In line 43 of the above script, using "python" assumes that python is in the supervisor user's PATH environment. If not, use the full path to python. If the python script can be invoked on its own (without calling it as an argument to the python executable itself), then you can leave out "python" all together.
:::

```py
#!/usr/bin/env python3
import os
import sys

# sys.path.append('yourPathHere')
# import myModule
jobid = sys.argv[1]
workName = sys.argv[2]
workId = '%s_%s' % (jobid, workName)
fh = open('/tmp/cb_output.%s' % workId, 'w')
fh.write('This is jobid:%s, frame number:%s\n' % (jobid, workName))
fh.close()
sys.exit()
```

:::warning[Execution]
Remember, callbacks are executed on the supervisor by the user who is running the supervisor (typically the local system account or "root"). Keep this in mind when reading from or writing to the shared file system.
:::

