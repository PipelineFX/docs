---
sidebar_position: 6
---

# qberr

## Description
**qberr** retrieves and prints the standard error log for a single job instance. 

## Usage 
qberr [options] jobID[.subjobID]...

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

## See also
[qbout](qbout)
