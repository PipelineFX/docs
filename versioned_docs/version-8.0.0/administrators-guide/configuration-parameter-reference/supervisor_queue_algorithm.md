---
sidebar_position: 76
---

# supervisor_queue_algorithm

## Synopsis

`supervisor_queue_algorithm` = _"binding=library[,binding=library...] "_

Used to specify queuing algorithm(s) used by the supervisor.

_binding_ is the type (either "Perl" or "Internal") of the algorithm, and
_library_ is the actual library (path to the custom Perl algorithm file, or
"cluster", "priority", or "queue" for internal built-in algorithms. By
specifying multiple "_binding=library_ " combinations, separated by commas,
the algorithms may be "stacked"\-- algorithms to the left of the list have
higher precedence, but if a certain routine isn't specified in it, then the
system will try to find one downstream.

Note that, if this parameter is defined in the qb.conf file, the
[supervisor_queue_binding](./supervisor_queue_binding) and
[supervisor_queue_library](./supervisor_queue_library) legacy
parameters are ignored.

## Example

```
supervisor_queue_algorithm = "Perl=/path/to/my/cool_custom_algorithm.pl,Internal=cluster"
```

## Defaults

Internal=cluster

## See Also

* [Queuing Algorithms](/Documentation/custom-queuing-algorithms)  
* [Custom Queuing Algorithms](/Documentation/custom-queuing-algorithms)
* [Scripting Custom Queuing Algorithms](/Documentation/scripting-custom-queuing-algorithms)

