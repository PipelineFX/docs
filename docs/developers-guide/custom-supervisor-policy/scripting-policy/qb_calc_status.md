---
sidebar_position: 3
---

# qb_calc_status

```
qb_calc_status($subjob, $agenda)
```

Although the default policy calculation for the job overall status is already defined, for some facilities, this behavior may need to be overridden. By taking the $subjob and $agenda status information (these are strings like "complete", "killed", and "failed"), the function is allowed to calculate what the job's overall status value will be.
