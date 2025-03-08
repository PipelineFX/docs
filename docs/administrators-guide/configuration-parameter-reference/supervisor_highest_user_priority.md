---
sidebar_position: 48
---

# supervisor_highest_user_priority

## Synopsis

`Supervisor_highest_user_priority =`  _priority_

_Priority_ is an integer specifying the highest numerical priority value
(smallest number) that an ordinary (i.e. non-admin) user may use to submit or
modify a job. Admins may not want to allow users to assign themselves the
highest possible priority, reserving that privilege for render wranglers or
other special users.

## Example
```
supervisor_highest_user_priority = 10
```

## Defaults

1

