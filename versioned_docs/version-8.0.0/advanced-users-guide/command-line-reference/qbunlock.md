---
sidebar_position: 32
---

# qbunlock

## Description
Unlocks the available job slots on a Worker.

## Usage 
qbunlock [options] hostname...

where hostname is the name of the host to be unlocked. It can be followed by 0 or more hostnames.

## Options
| Option | Description |
| ---    | ---         |
| --all | Unlock all hosts |
| --down | Unlock down hosts |
| --panic | Unlock panicked hosts |
| --active | Unlock active hosts |
| --cluster string | Unlock hosts in string cluster |
| --group string | Unlock hosts in string group |
| --resources string | Unlock hosts based upon requirements expression string |
| --purge | Immediately stop job processes running on Worker |
| --lock | Lock the Worker (deprecated: use qblock) |
| --unlock | Unlock the Worker (deprecated and implied) |
| --range string | Range string of CPU slots to lock/unlock. (<span style={{color: 'red'}}>deprecated: use qblock</span>) |
| --value | Specify custom lock |
| --file string | Use the lock in the specified string file |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
Unlocks all slots on host render01 

% **qbunlock** --lock render01

## See also
[qblock](qblock)
