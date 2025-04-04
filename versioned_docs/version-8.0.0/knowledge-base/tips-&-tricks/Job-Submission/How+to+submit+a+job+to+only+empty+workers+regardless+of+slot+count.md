---
sidebar_position: 3
---

# How to submit a job to only empty workers, regardless of slot count

It can happen that you want to send jobs to the farm and only have them run on
workers that have no other jobs running. This is especially handy if your
job will run an application that "auto-detects" the number of cores on a
machine, and will automatically run the appropriate number of threads, 1 per
core.

To accomplish this, set the job's [requirements](/advanced-users-guide/job-reference/Job+Requirements)
string to any one of these three equivalent expressions:

* `host.processors.used=0`
* `host.processors.used==0`
* `host.processors.used eq 0`

To ensure that this job reserves the entire worker, set the job's
[reservations](/advanced-users-guide/job-reference/Job+Reservations) to reserve
all slots, with:

* `host.processors=1+`

## QubeUI submission example:

* set the job's **requirements** to: `host.processors.used=0`
* set the job's **reservations** to: `host.processors=1+`

## Command-line example

```
qbsub --reservations host.processors=1+ --requirements "host.processors.used=0" ...
```

## API example:

```py
job = {
    'prototype': 'cmdline',
    'name': 'testing the job kind',
    'package': {'cmdline': 'sleep 30'},
    'reservations': 'host.processors=1+',
    'requirements': 'host.processors.used=0'
}
```

