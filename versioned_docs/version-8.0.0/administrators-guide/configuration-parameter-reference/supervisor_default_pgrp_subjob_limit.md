---
sidebar_position: 40
---

# supervisor_default_pgrp_subjob_limit

## Synopsis

`supervisor_default_prgp_subjob_limit` =  _limit_

 _Limit_  specifies the default pgrp limit, the maximum number of subjobs a
pgrp may run simultaneously. Value of -1 means "no limit". This limit may be
further reduced by the _user_ subjob limit (see
[supervisor_default_user_subjob_limit](./supervisor_default_user_subjob_limit)
). This limit applies to a single process group, and users can have many
process groups running. The use case for this parameter is typically for a
Renderman-type workflow, where a single shot is comprised of many distinct
jobs in the same pgrp, but the user has multiple shots in queue and doesn't
want one shot to consume their entire "subjob budget".

## Example
```
supervisor_default_pgrp_subjob_limit = 5
```

## Defaults

-1

## See Also

[supervisor_default_user_subjob_limit](./supervisor_default_user_subjob_limit)

