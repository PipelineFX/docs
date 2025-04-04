---
sidebar_position: 1
---

# How to Install Qube! from the command line

## macOS

mount, install, unmount it:

```
hdiutil attach _dmgfile_
installer -pkg /Volumes/_volume_ /_package_.pkg -target /
hdiutil detach /Volumes/_volume_
```

## Linux
 
```
rpm -ivh _rpmfile_
```

## Windows

The msiexec.exe command will perform an MSI installation via the command line.
 
```
msiexec -i _msifile_
```

The various flags supported by the installer are:

* INSTALL_WORKER_SERVICE
* INSTALL_WATCHDOG_SERVICE
* INSTALL_USER_PATH
* INSTALL_ADMIN_PATH
* INSTALL_MAYA_JOB_TYPE
* INSTALL_MAYA_API

Setting them to 1 will have the same effect as clicking the checkbox in the
interactive installer.

## MSI installation with logging

Sometime you need to see what's going wrong with the MSI installer. You can
use the command line msiexec to install with logging output to a file:
 
```
msiexec /i _mymsifile.msi_ /Lime logfile.txt
```

or more verbose
 
```
msiexec /i _mymsifile.msi_ /L*vime logfile.txt
```

where _mymsifile.msi_ is the path to the MSI file.

## Batch Script for Large Installations

Below is a batch script that can be modified to suite your environment.

:::tip
This script should be run as user Administrator
:::

```bash title="Qubeinstall.bat"
msiexec.exe /passive /i qube-core-$version$-WIN32-6.3-x64.msi
msiexec.exe /passive /i qube-worker-$version$-WIN32-6.3-x64.msi
msiexec.exe /passive /i QubeUI-$version$-WIN32-6.3-x64.msi
```

To uninstall before upgrades.

```bash title="Qubeuninstall.bat"
msiexec.exe /passive /x qube-core-$version$-WIN32-6.3-x64.msi
msiexec.exe /passive /x qube-worker-$version$-WIN32-6.3-x64.msi
msiexec.exe /passive /x QubeUI-$version$-WIN32-6.3-x64.msi
```

:::info
Replace $version$ with relevant details
:::

See also [Using the kickstart file](/administrators-guide/additional-install-information/Using+the+Kickstart+File)

