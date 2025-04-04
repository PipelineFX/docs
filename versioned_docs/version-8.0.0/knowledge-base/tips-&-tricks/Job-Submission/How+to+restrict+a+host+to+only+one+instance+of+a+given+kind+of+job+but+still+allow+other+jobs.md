---
sidebar_position: 2
---

# How to restrict a host to only one instance of a given kind of job, but still allow other jobs

A Qube! job has a "kind" parameter; this is a string which can be set to any
value the user desires. 

It's mostly used to say "Only run one of this **kind** of a job on a worker at
once". This tells the queuing system to filter out all hosts which have this
kind of job already running.

When you submit a job, you can do this to keep only one of your job's kind on
a host:

## QubeUI submission example:

* set the job's **kind** to `_myKind_` (or any other value you want)
* set the job's **requirements** to _`not(job.kind in host.duty)`_

## Command-line examples:

```
qbsub --kind myKind --requirements "not(job.kind in host.duty.kind)" ...
```

The cool thing is you can do it with jobtypes as well: (only run one
_myCustomJobType_ job on a worker at once)

```
qbsub --type myCustomJobType --requirements "not(host.duty.type has myCustomJobType)" ...
```

## API example:

```py
job = {
    'prototype': 'cmdline',
    'package': {'cmdline': 'sleep 30'},
    'name': 'testing the job kind',
    'kind': 'test',
    'requirements': 'not(job.kind in host.duty.kind)'
}
```

