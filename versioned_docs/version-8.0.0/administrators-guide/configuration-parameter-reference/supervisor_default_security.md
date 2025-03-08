---
sidebar_position: 42
---

# supervisor_default_security

## Synopsis

`supervisor_default_security` =  _comma-separated list of permission names or an integer mask_

This parameter specifies the security settings for a user who has not been
explicitly granted a permission set.

If you wish to use the integer value instead of the comma-separated list, add
up the base-10 integer values to determine a composite permission setting, or
perform a logical OR operation on the hexadecimal values (bet no one's ever
done that...) and then convert them to decimal. In the case of high security
systems, you will probably not want to allow any permissions to general users
unless specified.

## Values

### Submission Permissions

name| integer value (base 10)| hex (base16)| description  
---|---|---|---  
submit_job| 1| 0x1| submit new jobs  
submit_callback| 2| 0x2| submit jobs with callbacks  
submit_global_callback| 4| 0x4| submit jobs with global callbacks  
  
### General Permissions

:::warning[&emsp;]
The general permissions only apply to a user's own jobs unless they have been
granted the "admin" privilege.
:::

name| integer value| hex (base16)| description  
---|---|---|---  
bump| 8| 0x8| modify job priority without reordering the queue  
kill| 16| 0x10| kill jobs  
remove| 32| 0x20| remove jobs from the Supervisor database  
modify| 64| 0x40| modify job properties after submission  
preempt| 128| 0x80| preempt jobs  
block| 256| 0x100| block jobs and take them out of the active queue  
interrupt| 512| 0x200| interrupt jobs  
complete| 1024| 0x400| set an active job's status to "complete"  
unblock| 2048| 0x800| unblock jobs and put them back into the queue  
suspend| 4096| 0x1000| suspend jobs  
resume| 8192| 0x2000| resume suspended jobs  
retry| 16384| 0x4000| retry jobs  
requeue| 32768| 0x8000| requeue jobs  
migrate| 65536| 0x10000| migrate job processes to different Workers  
shove| 131072| 0x20000| shove jobs  
fail| 262144| 0x40000| set an active job's status to "fail"  
retire| 524288| 0x80000| retire jobs  
reset| 1048576| 0x100000| reset capabilities  
  
### Administrative Permissions

name| integer value (base 10)| hex (base16)| description  
---|---|---|---  
lock_host| 134217728| 0x8000000| lock/unlock a Worker machine  
sudo_admin| 268435456| 0x10000000| set user as Sudo Administrator  
impersonate| 536870912| 0x20000000| allows users to submit jobs as other users  
admin| 1073741824| 0x40000000| allow user to manage others jobs  
  
## Example
```
supervisor_default_security = 1048564  
supervisor_default_security = kill,bump
```

## Defaults

```
supervisor_default_security =
submit_job,submit_callback,kill,remove,modify,preempt,block,unblock,interrupt,  
                            
complete,suspend,resume,retry,requeue,migrate,shove,fail,retire,reset,lock_host  
supervisor_default_security = 136314867
```

## Notes

The default value (136314867) is a combination of all non-admin permissions
except "bump", plus the lock_host privilege.

