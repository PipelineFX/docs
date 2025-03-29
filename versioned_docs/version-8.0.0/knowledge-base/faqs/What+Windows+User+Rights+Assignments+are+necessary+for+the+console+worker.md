---
sidebar_position: 3
---

# What Windows User Rights Assignments are necessary for the console worker

The worker executable has a **`--console`** argument which will allow a worker
started from the command line to perform authentication to another user
account, much like it does when running as a service.

On Windows, the default "Local Security Policy" usually prevents this, and in
order for a user to run a "console worker", the following User Rights
Assignments must be granted:

* Replace a process-level token
* Adjust memory quotas for a process
* Act as part of the operating system
* Impersonate a client after authentication

Once these URA's have been assigned to the user, that user must log out and
back in again if they are currently logged in so that the new URA's may take
effect.


## See Also

* [Service Mode vs. Desktop User Mode](/administrators-guide/configuring-qube/worker-configuration/Service+Mode+vs+Desktop+User+Mode)
* [Service Mode Authentication: User vs Proxy](/administrators-guide/configuring-qube/worker-configuration/Service+Mode+Authentication+User+vs+Proxy)
