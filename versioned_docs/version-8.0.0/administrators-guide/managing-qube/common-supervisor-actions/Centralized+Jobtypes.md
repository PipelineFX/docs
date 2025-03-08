---
sidebar_position: 7
---

# Centralized Jobtypes

Though it is the easiest for small farms, you do not have to always install jobtypes locally on the Workers. They can be centrally located on a network file system.

Set the worker_template_path to point to the location of the jobtypes (delimited by colons on OS X / Linux and semi-colons on Windows), but ensure you also include the default worker_template_path, as this contains the compiled 'cmdline' and 'cmdrange' jobtypes that are installed with the worker.

:::danger[Important]
Several important things to take note of are:

- On Windows, you must use UNC and the path separator is a forward slash "/".
- This worker_template_path should always contain the location of the local jobtypes (the default worker_template_path value).
- Compiled jobtypes such as the cmdline and cmdrange are installed locally by the Worker and should not be centrally located, which necessitates the default template path being included in the new value. This ensures that any updates in future releases of the worker are present in the worker's available jobtypes.
:::

## Examples
**Windows**
```
worker_template_path="C:/Program Files/pfx/qube/types;C:/Program Files/pfx/jobtypes;C:/Program Files (x86)/pfx/jobtypes;//server/share/qube/ourJobTypes"
```

**macOS**
```
worker_template_path='/Applications/pfx/qube/types:/Applications/pfx/jobtypes:/mnt/nfsPath/jobtypes'
```

**Linux**
```
worker_template_path='/usr/local/pfx/qube/types:/usr/local/pfx/jobtypes:/mnt/nfsPath/jobtypes'
```
