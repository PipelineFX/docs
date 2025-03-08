---
sidebar_position: 5
---

# qb_sudo_admin

```
qb_sudo_admin($user, $job)
```

If a user is privileged as a "sudo" admin (see "qbusers"), they are given
permission to jobs based on the return value of this function. This allows a
very flexible security policy since it allows for control over who gets jobs
based upon any property of the job. Such as the job's priority or cluster values.

## See Also

[User Permissions](/administrators-guide/configuring-qube/Permissions)

