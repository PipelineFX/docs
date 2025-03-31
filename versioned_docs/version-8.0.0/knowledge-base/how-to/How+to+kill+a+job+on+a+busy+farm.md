---
sidebar_position: 15
---

# How to kill a job on a busy farm

The time that it takes to kill jobs can largely depend on how big your job is
(how many subjobs and frames there are), and also on the particular
application.  
  
When a "qbkill" (or a "kill" from within QubeUI) is issued, a message goes to the
supervisor, which in turn finds the running subjob(s) on worker(s).  The
applicable workers are notified that they need to kill those subjobs assigned
to them.  In turn, the workers will send a signal to the running job process.
The job process is given a grace period (default 30 seconds) to clean up
after itself before it's checked up on its status, and forcefully killed if
necessary.  
(It really does a lot more than that, such as updating the local worker
database, and cleaning up temp log files, but let's keep it at this for now)  
  
When you see in the workerlog, a message like:
```
process: <JOBID.SUBID> \- <PROCESSID> remove timeout: blahblah...
``` 
that's telling us that the grace period expired and the job is being forcefully
terminated.  Unfortunately, however, we have found that some application processes,
especially on Windows, can really take their time to exit even when attempted to be
terminated forcefully.

