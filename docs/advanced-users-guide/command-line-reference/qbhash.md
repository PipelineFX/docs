---
sidebar_position: 7
---

# qbhash

## Description
**qbhash** takes a clear-text password as input, and displays the hashed (encrypted) string for it.

**qbhash** is used to display the hash for any provided password; this is used to generate the encryption string for storing passwords in the various configuration files for 2 scenarios:
1. for defining proxy_password, used by the worker to authenticate as a proxy user.  Refer to Service Mode vs. Desktop User Mode for more details on this subject.
2. for defining database_password, used to store the password for the Supervisor to access the database server instance hosting the qube database.  

## Usage 
qbhash [options]

## Options
| Option | Description |
| ---    | ---         |
| --password string | Allows specifying password in an option, instead of from stdin |
| --help | Command help |
| --version | Command version |

## Notes

## Examples

## See also
qblogin
