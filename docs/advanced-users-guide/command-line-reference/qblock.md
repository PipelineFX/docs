---
sidebar_position: 14 
---

# qblock

## Description
**qblock** locks the available job slots on a Qube! Worker.

## Usage 
qblock [options] hostname...

where hostname is the name of the host to be locked. It can be followed by 0 or more hostnames.

## Options
| Option                | Description                                                                |
|-----------------------|----------------------------------------------------------------------------|
| --all                 | lock all hosts                                                             |
| --down                | lock down hosts                                                            |
| --panic               | lock panicked hosts                                                         |
| --active              | lock active hosts                                                           |
| --cluster string      | lock hosts in string cluster                                                |
| --group string        | lock hosts in string group                                                  |
| --resources string    | lock hosts based upon requirements expression string                        |
| --purge               | Immediately stop job processes running on Worker                            |
| --lock                | Lock the Worker (default: on) (deprecated and implied)                      |
| --unlock              | Unlock the Worker (deprecated: use qbunlock)                                |
| --range string        | Range string of CPU slots to lock/unlock                                    |
| --value               | Specify custom lock                                                        |
| --file string         | Use the lock in the specified string file                                   |
| --help                 | Command help                                                               |
| --version             | Command version                                                            |

## Notes
 
## Examples
Locks host render01 CPU slots 0 and 1:

% **qblock** --range 0,1 --lock render01

Locks all host render01 CPUs:

% **qblock** render01

## See also
qbunlock
