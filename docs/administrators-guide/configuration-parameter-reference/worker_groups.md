---
sidebar_position: 97
---

# worker_groups

## Synopsis

`worker_groups` =  _groups_

_Groups_ is a comma-separated list of which host groups this Worker belongs
to. Groups allow the administrator to place machines into logical groupings
for easier reference than specifying long lists of machines. These groups have
no relationship to Linux groups.

## Example

```
worker_groups = "bfw,boa,ssl"
```

## Defaults

(empty)

