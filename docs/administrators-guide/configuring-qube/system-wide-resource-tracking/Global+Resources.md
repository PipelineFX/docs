---
sidebar_position: 1
---

# Global Resources

Global resources are defined in the Supervisor using the qb.conf file. The configuration parameter is called [supervisor_global_resources](../../configuration-parameter-reference/supervisor_global_resources).

This subject is covered in depth in the section [System-Wide Resource Tracking](../../../system-wide-resource-tracking)

The following specifies the configuration entry:
```
supervisor_global_resources = resspec [, resspec,...]
```

where resspec is one or more comma-delimited resource specifications. In the case of a global resource, the resource specification is described as:
```
    global.name=quantity
```

where name is the name of the resource, and quantity is the total number of named resources available.

## Example
Here is an example for a site that has two licenses for Shake:
```
supervisor_global_resources = global.shake=2
```

## See also
* [System-Wide Resource Tracking](../../../system-wide-resource-tracking)
* [supervisor_global_resources](../../configuration-parameter-reference/supervisor_global_resources)

