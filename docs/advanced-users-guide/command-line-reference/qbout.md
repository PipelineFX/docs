---
sidebar_position: 18
---

# qbout

## Description
**qbout** retrieves and prints the standard out log for a single job instance. 

## Usage 
qbout [options] jobID[.subjobID]...

where subjobID represents the subjob ID of jobID. If the subjob ID is omitted, a subjob ID of 0 is assumed.

## Options
| Option | Description |
| ---    | ---         |
| --pos int | Starting file position at int bytes |
| --sleep int | Refresh every int seconds (default: 60) |
| --follow | Similar to "tail -f" |
| --help | Command help |
| --version | Command version |

## Notes

## Examples
% qbout 12354.0

## See also
[qberr](qberr)
