---
sidebar_position: 33
---

# qbupdateresource

## Description
**qbupdateresource** is used to inform the Supervisor of license usage counts from external license managers (FlexLM, RLM, MP, etc.).  When Qube! competes for licenses or other resources with an "external entity", (be that users or another queuing system), the Qube! Supervisor can reconcile its internal license or resource usage counts with the values retrieved from that license manager.

The Qube! system administrator needs to write a script that runs on a periodic basis, queries the license server for the current usage, and if the license count has changed since the last time the script was run, calls qbupdateresources to inform the Supervisor of the new counts.

For example:

- you own 100 prman licenses
- Qube! is configured to allow up to 100 prman job instances to be running at any one time by defining license.prman=100 (see System-Wide Resource Tracking and License Resources).

All well and good, until end-users also start consuming prman licenses.  Here's how this gets reconciled:

- Qube! is currently running 60 job instances that are consuming a prman license (via the job being submitted with a reservation of license.prman=1 - see Job Reservations)
- The scripts gets the count from the external licenser server, and finds that now there are actually 80 prman licenses in use according to the prman license server.  The script calls:

```
qbupdateresource --name license.prman=1 --total 100 --used 80

```
- The supervisor will then assume that there are 20 licenses in use by some external entity, will set the resource usage for license.prman to 80, and the only dispatch up to 20 additional instances that reserve this resource

## Usage

```
qbupdateresource --total [total] --used [used] --name [name]

--total Total amount of resource
--used Used amount of resource
--name Name of resource
```

## Options
-total flag behavior explained

The -total value you give it via the "qbupdateresource" command specifies the grand-total number of licenses, while the value you specify in the qb.conf file's supervisor_global_resources parameter refers to the total (maximum) number that the farm may use.

So, for instance, if you have in qb.conf:

supervisor_global_resources=license.maya=100

and you run qbupdateresource as in:

qbupdateresource -total 120 -used 80 -name license.maya

you're essentially saying that you have 120 grand-total count of licenses in your studio, while you're allowing the farm to use up to 100 of them. The remaining 20 is reserved for the use outside of the farm.

If, in the above scenario, all the 80 "used" licenses are being used on the farm, then qbadmin s -resource will display:

license.maya=80/100

:::note
The denominator is still 100, because that's the number allotted to the farm.
:::

If 70 is used on the farm, and 10 outside, then:

license.maya=70/100

If, on the other hand, say 50 is being used on the farm, and 30 outside, then "qbadmin s -resource" will display:

license.maya=60/100

That's because the "outside" count has gone over its "reserved" amount of 20, and 10 bleed into the farm allocation. 

## Notes
## Examples
## See Also
