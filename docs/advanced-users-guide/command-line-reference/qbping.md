---
sidebar_position: 19
---

# qbping

## Description
**qbping** contacts the supervisor or worker to verify its working status. If the supervisor is running correctly, qbping will return back the state of the supervisor, the version number, and the IP address of the supervisor host machine.

The options --time and --sleep are used for diagnostic purposes.  --time displays the time difference used between the localhost and the supervisor.

The option --sleep forces the qbping command to wait the specified number of seconds and will then exit.

## Usage 
qbping [options] [host|ip address]

## Options
| Option | Description |
| ---    | ---         |
| --time | display the time difference between this host and the supervisor |
| --sleep [seconds] | sleep for [seconds] seconds |
| --timeout [seconds] | timeout |
| --help | help for qbping |
| --version | version of Qube! |
| --supervisor [host] | explicitly set [host] supervisor |

## Notes

## Examples
Contact the supervisor:

% **qbping**

Contact worker1:

% **qbping** worker1

Sleep for 10 seconds:

% **qbping** --sleep 10

## See also

