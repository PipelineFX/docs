---
sidebar_position: 30
---

# How to upgrade a supervisor on macOS

There is no uninstall on macOS, so you simply stop the services and then
install the newer Qube! packages.  No data is lost during the uninstall/re-
install.

## Stopping the Qube! Supervisor

You will need to stop the qube supervisor before you install over top of the
older version.  Since the supervisor is under `launchctl` control, so it can
be stopped with this command:

`sudo launchctl stop com.pipelinefx.supervisor`

## Installing the Qube! Supervisor

The only condition is that the Qube-core is installed first.  You can install
all other Qube! components in any order.

The most common order is

* install the Qube-core
* install the Qube! supervisor
* install the QubeUI

