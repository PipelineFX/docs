---
sidebar_position: 38
---

# supervisor_default_hostorder

## Synopsis

`supervisor_default_hostorder` = \<_host ordering specification_ \>

## Host Order Specification

By default Qube! chooses any host (Worker) in the list of hosts which qualify.
If given a choice, a job is allowed to prefer a particular host based upon its
attributes. This is established using the Qube! resources and priorities
defined earlier in the [Requirements](../../advanced-users-guide/job-reference/Job+Requirements) section
of this document.

Any worker resource or property can be specified, but the most commonly used
are:

* host.processors
* host.memory
* host.processor_speed

### Syntax

[+|-]host._property_  
[+|-]host._resource_.[total|used|avail]

The **+** or **-**  in the expression is used to determine if the job would
prefer the largest or smallest value possible.  If neither is used, **+** is
assumed.

### Examples

Command| Meaning  
---|---  
`% qbsub --hostorder "host.processor_speed" Render myscene.ma`| Choose the fastest host  
`% qbsub --hostorder "-host.processors.used" Render myscene.ma`| Choose the host with the least number of worker slots in use  
`% qbsub --hostorder "host.processor_speed,host.processors.avail" Render myscene.ma`| Choose the fastest host with the most available worker_slots  
  
##### Notes

The system will use the hostorder specification only when initially choosing
the most preferable Worker for the job itself. Once it has chosen a host, it
will try to fill it up with instances from the job until the host is full. In
other words, the system will _not_ attempt to apply the hostorder to select a
host for each individual instance.

## Defaults

None

