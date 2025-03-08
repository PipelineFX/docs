---
sidebar_position: 114
---

# worker_properties

## Synopsis

`worker_properties` = _propertylist_

This allows the administrator to specify/override the properties of a Worker.
Worker properties can be used as a dispatch tool, i.e. "only send jobs to
workers that have a host property of 'host.maya > 0'" by setting "host.maya>0"
in the job's requirements.

## Example

```
worker_properties = "host.home_dir=/home,host.owner=dude,host.maya=1,host.nuke=1"
```

## Defaults

Internally, the following properties are stored:

*  host.architecture
*  host.cpus
*  host.kernel_version
*  host.os
*  host.processor_speed
*  host.proxy_mode
*  host.qube_build
*  host.qube_class 
*  host.qube_version
*  host.worker_mode

By default, there are no additional properties stored.

