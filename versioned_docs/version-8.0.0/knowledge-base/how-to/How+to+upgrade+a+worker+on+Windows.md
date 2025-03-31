---
sidebar_position: 34
---

# How to upgrade a worker on Windows

You need to uninstall the older Qube! components, and then install the newer
ones. No data is lost during the uninstall/re-install.

## Stop the worker service

If you want to avoid a reboot during the uninstall/reinstall cycle, you need
to stop the Windows Qube! Worker service. You can either stop this service
with the Services utility, or at the command-line if you've open a cmd prompt
as "Run as Administrator"

`sc stop qubeworker`

and then in the Task Manager-\>Processes, kill the process named "watchdog".

## Uninstalling the Qube! Worker

The only condition is that the Qube-core is uninstalled last. You can
uninstall all other Qube! components in any order.

The most common order is:

* uninstall the Qube! worker
* uninstalll all Qube! jobtypes (maya, 3ds Max, etc)
* uninstall the QubeUI (if installed)
* uninstall the Qube-core

## Installing the Qube! Worker

The only condition is that the Qube-core is installed first. You can install
all other Qube! components in any order.

The most common order is

* install the Qube-core
* install the Qube! worker
* install the QubeUI

