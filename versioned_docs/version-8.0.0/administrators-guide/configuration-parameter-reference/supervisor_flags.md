---
sidebar_position: 44
---

# supervisor_flags

## Synopsis

`supervisor_flags` = _integer mask_ or _comma-separated list_

_Mask_ sets some global Supervisor configuration parameters. Sum the
settings to determine a composite value enabling each setting or list them in
text form delimited by commas.

## Values

Flag| Meaning  
---|---  
disable_submit_check| Disable submit-time sanity checks (for valid "hosts", "groups", "cluster", "requirements", "reservations", etc.)  
enforce_password | Forces Windows users to set a password using qblogin.  
host_recontact | Enable the Supervisor to attempt to recontact a host marked DOWN.  
heartbeat_monitor | Enable the heartbeat Worker host monitoring system.  
running_monitor | Enable the Supervisor to track running jobs more aggressively.  
stub_optimize | Enable stub optimization, the Supervisor will group similar jobs in its queuing decisions. While this is a lot faster, it also removes the supervisor's ability to keep a FIFO order of jobs, and auto-expand jobs may only expand at the initial job evaluation at submission time.  
remove_logs | Enable log removal upon job removal. This value is intended for smaller installations where log space isn't managed by an administrator.  
retry_busy |  Allow the supervisor to re-attempt dispatch to a worker that has responded that it's busy starting another job instance.  
  
## Example
```
supervisor_flags = enforce_password,host_recontact,retry_busy
```

## Defaults
```
host_recontact,heartbeat_monitor,running_monitor,retry_busy
```

