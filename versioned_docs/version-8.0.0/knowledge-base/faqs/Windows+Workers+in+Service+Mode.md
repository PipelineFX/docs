---
sidebar_position: 6
---

# Windows Workers in Service Mode

If your workers are:

* **Windows** -based
* configured to be in **service mode** (either "proxy" or "user" mode, and _NOT_ "Desktop User mode")
* use Active Directory's GPO (Group Policy Objects)

You may see one or more of the following symptoms:

* You cannot kill, block, or otherwise manipulate a running job instance
* You cannot lock a worker and purge jobs that are currently running on it
* Aggressive preemption not working as expected

If you so see any of these symptoms, check your workerlog to see if you can
find an ERROR message similar to:
```
ERROR: QbWorker::killJob(), PostThreadMessage() Invalid thread identifier.
```
Carrying out the following steps as the Administrator on your Windows workers
could solve your issue.

1. Change Registry Key Here: 
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows  
DWORK = NoInteractiveServices  
Value data: 0
```
2. Set the following service to Automatic: Interactive Services Detection

