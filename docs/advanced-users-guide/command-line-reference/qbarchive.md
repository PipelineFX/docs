---
sidebar_position: 2
---

# qbarchive

## Description

qbarchive can be used to save a job to disk instead of submitting it to the supervisor.  There are two formats, binary (.qja), and XML (.xja).

Usage 
qbarchive [options] archivefile...

where archivefile is a Qube archive file, followed by 0 or more other archive files. Qube archive file typically end with the suffix "arc" or "qja."

## Options
| Option | Description |
| ---    | ---         |
| --long | Display archive with additional detail |
| --delimit char | Format output with char delimiter |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |

## Examples

## Notes
qbarchive is commonly used by a developer during development of a custom Qube! jobtype to save jobs to disk instead of submitting them to the supervisor.

## See Also
Developing custom Qube! jobtypes
