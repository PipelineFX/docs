---
sidebar_position: 6
---

# How to troubleshoot problems with drive mapping on Windows

Verify the job has drive maps (this will be visible under the job internals
tab of WranglerView. Look for "drivemap" under the "Job Details" section).

Verify the Worker has auto_mount turned on - "auto_mount" is a worker_flag
that will be set either in the local qb.conf or in the supervisor's central
configuration.

If your worker is running as a service (the default), be sure that the proxy
user is not mapping the drive as part of their profile. Go to "Start Menu->My
Computer" on the machine in question. If there are any mapped network
drives, unmap them. Be sure they are not set to remap that drive when they log
back in.

One can also submit a "test" job to check on the drive maps used on the Worker:

1. Launch the QubeUI
2. Select the menu item Submit->Commandline Job...
3. Set the "Command" to "net use" (without the " " quotes)
4. Select the host in question.
    * If you choose multiple hosts, also set the "host_list" flag in the Flags section.
5. Submit the job
6. Refresh the UI and check the "Stdout" Panel for the results of the mapped drives.
    * If you see a drive map with a status of "unavailable", there is a problem.
    * If you see inconsistencies between computers, there is a problem.
    * If you see no drive mappings, that is not necessarily a problem, unless, of course, there are other machines in your farm that do show drive maps when running this job.

