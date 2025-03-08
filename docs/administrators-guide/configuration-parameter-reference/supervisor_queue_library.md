---
sidebar_position: 78
---

# supervisor_queue_library

## Synopsis

`supervisor_queue_library` =  _type_  |  _file_

The queue specifies the binary or script which defines the Supervisor's
queuing algorithm. _type_ specifies which queuing algorithm to use, or
_file_  points to a library file to be used as the source file for the
queuing code.

## Values

  * cluster - Qube! clustering algorithm. Jobs run based on where in a hierarchical host "cluster" they are submitted.
  * priority - Strict numeric priority. High priority jobs run before lower priority jobs.
  * queue - First come-first served. Jobs run in the order in which they are submitted.

## Examples

```
supervisor_queue_binding = Perl  
supervisor_queue_library = /usr/local/pfx/qube/qlib/stackQueue.pm
```

## Defaults

cluster

