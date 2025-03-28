---
sidebar_position: 2
---

# Python job submission with Python language callback

Here, we demonstrate how to submit a job through the Qube! Python API that runs a python script as a callback.
This example shows a very simple callback that writes the job id and python information to a file.

```py
job = {
    'prototype': 'cmdline',
    'name': 'python callback test',
    'package': {
    'cmdline': 'hostname',
    },
    'callbacks': [
        {
            'language': 'python',
            'triggers': 'done-job-self',
            'code': '''
try:
    import sys
     
    fh = open('c:/temp/err.txt', 'w')
    fh.close()
     
    fh = open('c:/temp/foo.txt', 'w')
    fh.write('Hello from job id %s\\n' % qb.jobid())
    fh.write('sys.version : %s\\n' % sys.version)
    fh.write('sys.version info : %s\\n' % '.'.join([str(x) for x in sys.version_info]))
    fh.write('sys.executable : %s\\n' % sys.executable)
    fh.close()
except Exception, e:
    fh = open('c:/temp/err.txt', 'w')
    fh.write('Error from job id %s\\n' % qb.jobid())
    fh.write('%s\\n' % e)
    fh.close()
'''
            }
        ]
    }
print('%(id)s: %(name)s' % qb.submit(job)[0])
```

:::warning
* [supervisor_language_flags](/administrators-guide/configuration-parameter-reference/supervisor_language_flags)
must contain "mail" or this callback will silently fail.
* The qb module available inside the callback is a stripped down version of what a typical python script will consume.
If you need the full python module, spawn a second script from the callback with subprocess.Popen or the like.
:::

:::tip
* All callbacks are executed by the supervisor and only by the supervisor. If your callback needs to access the
job's output directory, be sure the supervisor can see the output dir as it is stored in the job.
* Any print statements will go to the .cb file in the job log. If you would like to see debug output, you'll need to write to a file.
:::

