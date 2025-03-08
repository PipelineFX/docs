---
sidebar_position: 3
---

# Per-Host Global Resources

Per-host global resources are very similar to the original global resources, but differ in that they track resources that are consumed on a per-host basis, not per-instance. For example, they may be used to track application licenses where a single license can be shared by multiple instances of the application running on the same host, thereby maximizing your investment in rendering licenses.

To set up and start using the, add the global_host resource names and values to the supervisor_global_resources parameter in the qb.conf file on the supervisor.

Just like the original [global resources](./Global+Resources), to set up and start tracking per-host global resources, it must be defined on the Supervisor using the qb.conf file, using the configuration parameter supervisor_global_resources, as in:

```
supervisor_global_resources = resspec [, resspec,...]
```

The resspec in this case uses the keyword global_host:

```
global_host.name=quantity
```

where _name_ is the name of the resource, and quantity is the total number of named resources available.

## Example

Here is an example for a site that has ten licenses for Nuke:

```
supervisor_global_resources = global_host.nuke=10
```
