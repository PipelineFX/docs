---
sidebar_position: 1
---

# qbadmin

## Description

qbadmin provides command-line administration of various aspects Qube!

## Usage 
qbadmin *mode* [*options*]

where mode is either **supervisor**, **worker** or **local**.

mode may be shortened to **s**, **w**, or **l**

## Options
| Option | Description |
| ---    | ---         |
| **mode: supervisor** | |
| --list | List all Supervisor hosts. | |
| --backup | Backups all of the supervisor's data. |
| --find | Auto-detects all available supervisors. |
| --configuration | Display the configuration for the Supervisor. |
| --reread	Reread the qb.conf configuration file to update dynamically-modifiable parameters |
| --set reject_submit-set stop_activity | Set Supervisor mode |
| --unset reject_submit-unset stop_activity | Unsets Supervisor mode |
| --resource | Display the current state of all global resources. |
| --globalcallback language triggers code | Submit a globalcallback language is: "perl", "python", or "qube" triggers are callback trigger events code is source code for callback |
| --emailtest | Send a test email via SMTP using qb.conf settings. |
| **mode: worker** | |
| --remove string | Remove and ban Worker list string |
| --unremove macaddr [macaddr] | Clear ban on worker  [macaddress]. |
| --reboot string | Reboot Worker list string |
| --shutdown string | Shutdown Worker list string |
| --refresh | Force the Supervisor to re-detect all of its workers. |
| --clearbanned | Clear all workers from the "banned" list. |
| --reconfigure | Push out new configuration to the workers. |
| --configuration string | Display the configuration for the Worker string |
| --assignments string | Query the Worker string directly for jobs it is currently working on. |
| --help | Command help |
| --version | Command version |

## Notes

The user must have Qube! admin privileges to use this command. Refer to User Permissions or qbusers for more detail on the Qube! permission scheme

**Examples**\
Tell the Supervisor to re-read the qbwrk.conf and signal the workers to request a new remote configuration from the Supervisor:

% qbadmin worker --reconfigure

Tell the Supervisor to stop tracking host machine01:

% qbadmin w --remove machine01

Test the supervisor's mail configuration:

% qbadmin supervisor --emailtest

Display the supervisor's running configuration:

% qbadmin s --config

## See Also
