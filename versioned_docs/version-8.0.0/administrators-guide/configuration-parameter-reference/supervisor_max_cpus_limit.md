---
sidebar_position: 60
---

# supervisor_max_cpus_limit

:::note
This parameter is one of several that configure the
[SmartShare](../../administrators-guide/configuring-qube/SmartShare) behavior.
:::

## Synopsis

`supervisor_max_cpus_limit` =  _integer_

The largest value of "max_cpus" parameter that can be used on any job, for
[SmartShare](../../administrators-guide/configuring-qube/SmartShare). If any job specifies a value greater
than this, the system will silently cap it to this value.

## Example
```
supervisor_max_cpus_limit = 20
```

## Defaults

100

## See Also

[SmartShare](../../administrators-guide/configuring-qube/SmartShare)

[supervisor_default_max_cpus](./supervisor_default_max_cpus)

[supervisor_smart_share_mode](./supervisor_smart_share_mode)

[supervisor_smart_share_preempt_policy](./supervisor_smart_share_preempt_policy)

