---
sidebar_position: 15 
---

# qblogin

## Description
**qblogin** provides the ability for Windows users to inform Qube of their passwords, so that Qube workers running in "user" mode may authenticate as them to run their jobs.

:::warning
Users should note that this is only necessary when running jobs on Windows Worker hosts running in "user" mode, which is quite an uncommon configuration.
:::

Refer to Authentication Modes - User and Proxy for more details. 99% of the time, the use of `qblogin` is unnecessary, as the Workers will be running in "proxy" mode.

Passwords are stored in a salted hash on the Qube supervisor, and are passed in encrypted form over the network. At no point is your password sent as cleartext.

**qblogin** can also be used to display the hash for any provided password (deprecated, see `qbhash`); this is used to generate the encryption string for storing passwords in the various configuration files for 2 scenarios:
- For defining `proxy_password`, used by the worker to authenticate as a proxy user. Refer to Service Mode vs. Desktop User Mode for more details on this subject.
- For defining `database_password`, used to store the password for the Supervisor to access the DB server instance hosting the Qube database.

## Usage
qblogin [options]

## Options
| Option          | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| --user string | Enter password for string user instead (must be admin)                        |
| --domain string | Allows user to specify which domain to set password for (must be admin)      |
| --password string | Allows specifying password in an option, instead of from stdin             |
| --check       | Checks the currently recorded password.                                       |
| --display     | Display the encrypted password and exit (see also the `qbhash` command)       |
| --help         | Command help |
| --version     | Show command version.                                                       |

## Notes
This is only required for users who will run jobs on Microsoft Windows workers running in "user" mode, which is quite an uncommon configuration. Refer to Authentication Modes - User and Proxy for more details.

## Examples

## See also
qbhash
