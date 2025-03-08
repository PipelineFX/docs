---
sidebar_position: 80
---

# supervisor_smart_share_mode

:::note
This parameter is one of several that configure the
[SmartShare](../../administrators-guide/configuring-qube/SmartShare) behavior.
:::

## Synopsis

`supervisor_smart_share_mode` = _mode_

The mode in which the [SmartShare](../../administrators-guide/configuring-qube/SmartShare) feature will
operate. This can currently be "jobs" or "none".

## Values

  * jobs - automatically balance Smart-Share expanded secondary instances on a job-to-job basis (i.e., all running jobs will have an equal number of secondary instances).
  * none - disables SmartShare.

## Example

```
supervisor_smart_share_mode = none
```

## Defaults

jobs

## See Also

[SmartShare](../../administrators-guide/configuring-qube/SmartShare)

[supervisor_default_max_cpus](./supervisor_default_max_cpus)

[supervisor_max_cpus_limit](./supervisor_max_cpus_limit)

[supervisor_smart_share_preempt_policy](./supervisor_smart_share_preempt_policy)

