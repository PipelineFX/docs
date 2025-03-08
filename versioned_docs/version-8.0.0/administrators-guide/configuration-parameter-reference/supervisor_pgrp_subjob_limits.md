---
sidebar_position: 70
---

# supervisor_pgrp_subjob_limits

## Synopsis

`supervisor_pgrp_subjob_limits` =  _user=limit[,user=limit]_

Sets up the pgrp subjob limit for specific users. You can also set the pgrp
subjob limit for all users - see
[supervisor_default_prgp_subjob_limit](./supervisor_default_pgrp_subjob_limit).

## Example
```
supervisor_pgrp_subjob_limits = root=-1,eric=10,jack=12,ginger=15
```

## Defaults

Unset (empty string)

## See Also

[supervisor_default_prgp_subjob_limit](./supervisor_default_pgrp_subjob_limit)  
[supervisor_default_user_subjob_limit](./supervisor_default_user_subjob_limit)

