---
sidebar_position: 8
---

# qbhist

## Description
**qbhist** obtains the history of a job as recorded by the Supervisor..

## Usage 
qbhist [options] jobID... | 0

where JobID is one or more job IDs, and 0 is a wild card token representing all the user's jobs.

## Options
| Option | Description |
| ---    | ---         |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Notes
 

## Examples
List history for only subjob 12354.0:

% **qbhist** 12354.0

List history for all of 12354:

% **qbhist** 12354

## See also
