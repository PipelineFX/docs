---
sidebar_position: 31
---

# How to upgrade a supervisor on Windows

You need to uninstall the older Qube! components, and then install the newer
ones. No data is lost during the uninstall/re-install.

## Stop the supervisor and the Database server

If you want to avoid a reboot during the uninstall/reinstall cycle, you need
to stop the following Windows services, in this order:

* qubesupervisor (stop this first)
* postgresql-pfx

You can either stop these services with the Services utility, or at the
command-line if you've open a cmd prompt as "Run as Administrator"

`sc stop qubesupervisor `

`sc stop pfxmysql`

`sc stop postgresql-pfx`

## Uninstalling the Qube! Supervisor

The only condition is that the Qube-core is uninstalled last. You can
uninstall all other Qube! components in any order.

The most common order is

* uninstall the Qube! supervisor
* uninstall the QubeUI (if installed)
* uninstall the Qube-core

## Installing the Qube! Supervisor

The only condition is that the Qube-core is installed first. You can install
all other Qube! components in any order.

The most common order is

* install the Qube-core
* install the Qube! supervisor
* install the QubeUI

