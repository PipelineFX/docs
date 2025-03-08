---
sidebar_position: 4
---

# Per-Host License Resources

Per-host license resources are similar to the original license resources in that they act exactly like global resources with the added benefit of being dynamically updated in the Supervisor by an external application. Per-host license resources differ from the original license resources in that the resources are consumed on a per-host basis, just like the per-host global resources.

Per-host license resources are also defined on the Supervisor using the qb.conf file, using the configuration parameter supervisor_global_resources, as in:
```
supervisor_global_resources = resspec [, resspec,...]
```

The resspec in this case uses the keyword license_host:
```
     license_host.name=quantity
```

where _name_ is the name of the resource, and quantity is the total number of named resources available.

As with the original license resources, per-host license resources require the use of an external application to monitor the state of the license server, to update the Supervisor on a regular basis to ensure the Supervisor is fully aware of the actual number of licenses available.

## Example
Here is an example for a site that has twenty licenses for Nuke:
```
supervisor_global_resources = license_host.nuke=20
```

and an example call to qbupdateresource that a total 20 licenses are installed, and 12 are currently in use:
```
% qbupdateresource -name license_host.nuke -total 20 -used 12
```
