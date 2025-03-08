---
sidebar_position: 39
---

# supervisor_default_max_cpus

:::note[&emsp;]
This parameter is one of several that configure the
[SmartShare](../../administrators-guide/configuring-qube/SmartShare) behavior.
:::

## Synopsis

`supervisor_default_max_cpus` = integer OR  _*_

If a job doesn't specify the SmartShare parameter "max_cpus" explicitly on
submission, then automatically assign this value.

A negative value or "\*" (asterisk) means "no limit".

## Example
```
supervisor_default_max_cpus = 20
```

## Defaults

-1

## See Also

[SmartShare](../../administrators-guide/configuring-qube/SmartShare)

[supervisor_max_cpus_limit](./supervisor_max_cpus_limit)

[supervisor_smart_share_mode](./supervisor_smart_share_mode)

[supervisor_smart_share_preempt_policy](./supervisor_smart_share_preempt_policy)

