---
sidebar_position: 95
---

# worker_flags

## Synopsis

`worker_flags` = _flag[,flag...]_

Set global Worker configuration flags.

## Values

Name| Description  
---|---  
dedicated| Denotes if the host is a dedicated Qube Worker. (This flag is obsolete and no longer carries any meaning)  
dynamic| Notify the Supervisor that it should identify the Worker by its hostname rather than its ip address. This allows the Supervisor to migrate host information rather than create a new host with the same name.  
auto_mount| Enables the Windows Auto-Mounting system. The Worker will automatically mount drives which were detected in the user's environment any time the `auto_mount` job flag is set. (Windows only)  
remove_logs| The Worker will automatically remove any logs which it used as temporary storage while running a job. Should only be disabled for debugging purposes.  
load_profile| The Worker will use the Windows profile when running the job.  (Windows only)  
auto_remove| Automatically remove the worker from the supervisor's list of hosts when the worker service is stopped.  
  
## Example

```
worker_flags = "auto_mount,load_profile,auto_remove"
```

## Defaults

OS | Flag
---|---
Linux & macOS: | "remove_logs"
Windows: | "remove_logs,load_profile,auto_mount"

