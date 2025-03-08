---
sidebar_position: 117
---

# worker_template_path

## Synopsis

`worker_template_path` =  _path_

The template _path_ is used to specify where the Worker should look to find
the libraries/files associated with the jobs it will run. Multiple paths are
delimited by colons on OS X / Linux and semi-colons on Windows.

:::danger[Several important things to take note of are:]

* On Windows, you **must use UNC**  and the path **separator is a forward slash "/".**
* This worker_template_path **should always contain the location of the local jobtypes** (the default worker_template_path value).
* Compiled jobtypes such as the cmdline and cmdrange are installed locally by the Worker and should not be centrally located, which necessitates the default template path being included in the new value. This ensures that any updates in future releases of the Worker are present in the Worker's available jobtypes.  

:::

## Examples

### Windows

```
worker_template_path="C:/Program Files/pfx/qube//types;C:/Program Files/pfx/jobtypes;C:/Program Files (x86)/pfx/jobtypes;//server/share/qube/ourJobTypes"
```

### Mac OS

```
worker_template_path='/Applications/pfx/qube/[types:/Applications/pfx/jobtypes:/mnt/nfsPath/jobtypes](http://types/Applications/pfx/jobtypes:/mnt/nfsPath/jobtypes)'
```

### Linux

```
worker_template_path='/usr/local/pfx/qube/[types:/usr/local/pfx/jobtypes:/mnt/nfsPath/jobtypes](http://types/usr/local/pfx/jobtypes:/mnt/nfsPath/jobtypes)'
```

## Defaults

OS | Path
---|---
Linux & macOS: | $QBDIR/types
Windows: | %QBDIR%\types

## See Also

[Centralized Jobtypes](/administrators-guide/configuring-qube/worker-configuration/Centralized+Jobtypes)

