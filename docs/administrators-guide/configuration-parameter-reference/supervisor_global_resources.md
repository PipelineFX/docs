---
sidebar_position: 45
---

# supervisor_global_resources

## Synopsis

`supervisor_global_resources` =  _resourcespec_ 

This string defines the global resources. It doesn't affect the total number
of already reserved resources as they are tracked even after a restart.
_Resourcespec_  is a comma-separated string of specifications of the form:

`global._resource_` = _quantity_

where _resource_ is the name of a resource, and _quantity_ is how many
resources are available to the system. Typically these resources are licenses,
but they could be something else.

## Example
```
supervisor_global_resources = "global.maya=10, global.shake=5"
```

## Defaults

(empty)

## Reference

[System-Wide Resource Tracking](/system-wide-resource-tracking)

