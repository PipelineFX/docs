---
sidebar_position: 7
---

# Externally Updatable Worker Resources and Properties

Externally Updatable Worker Resources and Properties are site-defined worker resources and properties that may be periodically updated externally by programs using API calls. Jobs, on submission, may "reserve" these resources or "request" properties on the workers.

Worker resources and properties are updated by the API routines updateworkerresources() and updateworkerproperties(), respectively. You need to specify the worker name as the first argument, and the resources/properties in a string as the second. For example, in python:

```
qb.updateworkerresources("shinyambp.local", "host.extres=4/20,host.extres2=10/100")
qb.updateworkerproperties('shinyambpl.local', 'host.extprop=myprop', host.extprop2=4.2')
```

If the resource or property doesn't exist when the qbupdate\* routines are called, they are automatically created, so it's not necessary to define them in qb.conf or qbwrk.conf. However, if you must, you may do so as in:

```
worker_resources = host.extres=20,host.extres2=100
worker_properties = host.extprop="myprop",host.extprop2=3.14159
```

Worker resources and properties may be deleted by calling the deleteworkerresources() and deleteworkerproperties() routines, respectively. Give it the worker name, and a list of resource/property names to be deleted:

```
qb.deleteworkerresources("shinyambp.local", ["host.extres"])
qb.deleteworkerproperties("shinyambp.local", ["host.extprop", "host.extprop2"])
```

Note that these routines require a list for the 2nd argument (like ["host.extres"]) .

## See Also
* [worker_properties](../../configuration-parameter-reference/worker_properties)
* [worker_resources](../../configuration-parameter-reference/worker_resources)

