---
sidebar_position: 1
---

# qb_approve_modify

```
qb_approve_modify($oldjob, $newjob, $user)
```

Given the two jobs, $oldjob containing the current job information, and $newjob containing the job after modifications are applied, and the $user which is the name of the user requesting the modification, the function must return 1 if the modification request is accepted or 0 if it is to be rejected.

$user can be used to allow modification of a job's priority from 3000 to 100, to certain users only.

Note that, qb_approve_modify() is NOT applied to request from admin users - they are allowed to do any modification to any user's jobs, always.

Note also that ordinary users are only ever allowed to modify their own jobs, and that this job filtering is done before qb_approve_modify() is applied. So, in other words, even if qb_approve_modify() is written so that a specific user is allowed to modify others' jobs, it won't work as expected.
