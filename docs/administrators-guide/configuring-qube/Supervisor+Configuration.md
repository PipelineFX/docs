---
sidebar_position: 2
---

# Supervisor Configuration

The primary component in Qube! is the Supervisor. It coordinates between the Workers and the clients, queuing and dispatching jobs, and monitoring the overall health of the render farm. The majority of the Supervisor behavior can be configured, and this behavior has effects all throughout the system.

## Configuration Files
There are two required files (and a third optional file) that control the Qube! supervisor:

**qb.conf**
The installer programs place a template qb.conf file in a suitable location, depending upon the platform (see below). Notice that almost every entry is commented out with a "#" character. The commented-out settings refer to defaults that are already configured into the system. To make changes simply duplicate the line, removing the comment character, and make the changes. Commenting or deleting the line will restore the default setting.

**qb.lic**
The qb.lic file must contain a license key string issued by PipelineFX. Additional key strings can be added to the file in no particular order. Whenever adding a new key to the file, always make a backup copy first. Licenses can be added through the QubeUI - see [Installing Qube! Licenses](../../start-here/Installing+Qube).

**qbwrk.conf (optional)**
The qbwrk.conf file is an optional file on the Supervisor that centrally configures all of the Qube! Workers under the Supervisor. See Centralized Worker Configuration for more information.

## File Locations
These files are located in the following directories depending on the platform:

* Linux & macOS:  /etc
* Windows:        C:\ProgramData\pfx\qube

## The Current Configuration
You can discover the current Supervisor configuration by reading the qb.conf file directly, through QubeUI or the command line. See [Determining the Supervisor Configuration](../managing-qube/common-supervisor-actions/Determining+the+Supervisor+Configuration) for more information. 

## Modifying the Files
You can modify the qb.conf and/or qbwrk.conf files from the QubeUI in the Administration menu, or by directly modifying the files with a text editor. If you use the UI, you must run it as root or a user with Admin capabilities, and you must run it on the actual Supervisor. Making Supervisor changes from a Worker acts like it is doing something, but it actually has no effect.

Once changes have been made to the Supervisor configuration, it must be made aware of configuration changes by restarting the Supervisor service (but not all changes will require a restart - for some you can tell the Supervisor to simply reload the qb.conf file). If you are modifying through QubeUI it should automatically prompt the user to restart the Supervisor. The Administration menu in QubeUI can also be used to explicitly restart the Supervisor. You can also force the Supervisor to reload the qb.conf file with this command:


```
$ qbadmin supervisor --reread
```

For manual changes to the Workers' central qbwrk.conf file, you must run this qbadmin command:

```
$ qbadmin worker --reconfigure
```

## See Also
* Rereading the qb.conf file
* Worker Configuration
