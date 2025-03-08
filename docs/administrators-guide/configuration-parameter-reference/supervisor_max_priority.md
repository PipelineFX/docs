---
sidebar_position: 63
---

# supervisor_max_priority

## Synopsis

`supervisor_max_priority` =  _priority_

_Priority_ is the maximum numeric priority (therefore the lowest dispatch
priority) the Supervisor will allow users to specify. Jobs which are set above
this number are automatically set to _priority_.

## Example
```
supervisor_max_priority = 100
```

## Defaults

9999

