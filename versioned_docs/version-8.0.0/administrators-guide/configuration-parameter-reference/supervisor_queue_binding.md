---
sidebar_position: 77
---

# supervisor_queue_binding

## Synopsis

`supervisor_queue_binding` = _binding_

_Binding_ is the type binding for the Supervisor's queuing algorithm. Qube!
allows for the administrator to replace the queuing algorithm for the
Supervisor completely. The way to do so is to specify the binding first.

## Values

  * Internal - use internally compiled queuing algorithm
  * Perl - use scripted queuing algorithm

## Example

```
supervisor_queue_binding = Perl
```

## Defaults

Internal

