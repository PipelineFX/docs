---
sidebar_position: 84
---

# supervisor_user_subjob_limits

## Synopsis

`supervisor_user_subjob_limits` =  _user=limit[,user=limit]_

Sets up the user subjob limit for specific users. You can set the limit for
all users with
[supervisor_default_user_subjob_limit](./supervisor_default_user_subjob_limit).

## Example

```
supervisor_user_subjob_limits = root=-1,jimi=20,noel=20,mitch=30
```

## Defaults

Unset (empty string)

## See Also

[supervisor_default_user_subjob_limit](./supervisor_default_user_subjob_limit)  
[supervisor_default_prgp_subjob_limit](./supervisor_default_pgrp_subjob_limit)

