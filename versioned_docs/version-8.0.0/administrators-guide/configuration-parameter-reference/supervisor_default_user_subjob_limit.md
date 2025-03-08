---
sidebar_position: 43
---

# supervisor_default_user_subjob_limit

## Synopsis

`supervisor_default_user_subjob_limit` =  _limit_

_Limit_ specifies the default subjob limit, the maximum number of subjobs
that any user may run simultaneously, across all process groups (pgrp). A
value of -1 means "no limit". This may be reduced further by the pgrp subjob
limit (see
[supervisor_default_pgrp_subjob_limit](./supervisor_default_pgrp_subjob_limit)).
For example, the user limit may be 200 subjobs, while the process group limit
may be 50. So a given user could have a maximum of 200 subjobs running, and no
individual prgp could launch more than 50.

## Example
```
supervisor_default_user_subjob_limit = 5
```

## Defaults

-1

## See Also

[supervisor_default_pgrp_subjob_limit](./supervisor_default_pgrp_subjob_limit)

