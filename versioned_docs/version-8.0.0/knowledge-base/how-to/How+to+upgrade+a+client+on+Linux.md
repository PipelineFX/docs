---
sidebar_position: 26
---

# How to upgrade a client on Linux

You need to uninstall the older Qube! components, and then install the newer
ones. No data is lost during the uninstall/re-install.

## Uninstalling the Qube! Client and UI

The only condition is that the Qube-core is uninstalled last. You can
uninstall all other Qube! components in any order.

The most common order is

* uninstall the QubeUI (if installed)
* uninstall the Qube-core

## Uninstalling with a single command-line:

The Qube! rpm's have the dependencies between the supervisor, core, qubeui,
etc. already defined, so all components can be uninstalled with a single
`rpm` command line:

```
rpm -ev `rpm -qa|grep qube
```

## Installing the Qube! Client and UI

The only condition is that the Qube-core is installed first. You can install
all other Qube! components in any order.

The most common order is:

* install the Qube-core
* install the QubeUI

## Installing with the rpm utility:

The Qube! rpm's have the dependencies between the supervisor, core, qubeui,
etc. already defined, so all components can be installed either individually,
or with a single `rpm` command line:

`rpm -ivh qube-core-<qube_version>-<linux_version>.rpm `

`rpm -ivh QubeUI-<qube_version>-<linux_version>.rpm`

or

`rpm -ivh qube-core-<qube_version>-<linux_version>.rpm QubeUI-<qube_version>-<linux_version>.rpm`

