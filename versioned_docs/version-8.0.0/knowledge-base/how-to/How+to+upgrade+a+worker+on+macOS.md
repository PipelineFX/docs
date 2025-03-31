---
sidebar_position: 33
---

# How to upgrade a worker on macOS

There is no uninstall on macOS, so you simply stop the services and then
install the newer Qube! packages. No data is lost during the uninstall/re-
install.

## Stopping the Qube! Worker

You will need to stop the Qube! supervisor before you install over top of the
older version. Since the supervisor is under `launchctl` control, so it can
be stopped with this command:

`sudo launchctl stop com.pipelinefx.worker`

## Installing the Qube! Worker

The only condition is that the Qube-core is installed first. You can install
all other Qube! components in any order.

The most common order is

* install the Qube-core
* install the Qube! worker
* install the QubeUI

