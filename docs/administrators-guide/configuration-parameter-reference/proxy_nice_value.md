---
sidebar_position: 31
---

# proxy_nice_value

## Synopsis

`proxy_nice_value` =  _nice_

Run jobs with  _nice_  settingsthat is, modify the execution priority of the job to either allow higher or lower priority. For example, this might be set to a high number for user workstations that is used as a part-time worker.

On Posix systems, this value can be adjusted over the range of -20 (the highest) to 20 (the lowest). See your system's manpage for "nice(1)" for details.

On Windows systems, this value can also be adjusted over a range of -20 to 20, but each subrange will translate to the following Windows prioirty classes:

* -13 and below: REALTIME_PRIORITY_CLASS
* -12 to -7: HIGH_PRIORITY_CLASS
* -6 to -1: ABOVE_NORMAL_PRIORITY_CLASS
* 0: NORMAL_PRIORITY_CLASS
* 1 to 10: BELOW_NORMAL_PRIORITY_CLASS
* 11 and above: IDLE_PRIORITY_CLASS

## Example

```
proxy_nice_value = 10
```

## Defaults

0

