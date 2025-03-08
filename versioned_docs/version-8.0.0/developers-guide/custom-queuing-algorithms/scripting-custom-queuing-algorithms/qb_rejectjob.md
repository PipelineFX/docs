---
sidebar_position: 5
---

# qb_rejectjob

```
qb_rejectjob($job, $host)
```

With every system, there are situations where a job shouldn't run on a host. While this can be controlled by the Qube! job routine features, the queuing algorithm also has the ability to reject job a job from running on a host. The $job and the $host are compared and the function returns 1 if the job should be rejected and 0 if the host is allowed to run the job. Simple uses of this function can include things such as keeping special accounts from executing jobs or reserving specific hosts for specific groups of people.
