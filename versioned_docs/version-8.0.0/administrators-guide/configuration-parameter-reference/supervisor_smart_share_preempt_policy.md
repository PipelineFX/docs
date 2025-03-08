---
sidebar_position: 81
---

# supervisor_smart_share_preempt_policy

:::note
This parameter is one of several that configure the
[SmartShare](../../administrators-guide/configuring-qube/SmartShare) behavior.
:::

## Synopsis

`supervisor_smart_share_preempt_policy` = _method_

The pre-emption method the Supervisor will use to pre-empt secondary instances
(instances that were automatically expanded by the
[SmartShare](../../administrators-guide/configuring-qube/SmartShare) feature). _Method_ can be either
disabled, passive, or aggressive.

## Values

* passive : shutdown instances when convenient, instances are allowed to finish the agenda-item they're currently processing before terminating
* aggressive : instances are terminated immediately
* disabled : disable pre-emption

## Example

```
supervisor_smart_share_preempt_policy = passive
```

## Defaults

aggressive

## See Also

[SmartShare](../../administrators-guide/configuring-qube/SmartShare)

[supervisor_default_max_cpus](./supervisor_default_max_cpus)

[supervisor_max_cpus_limit](./supervisor_max_cpus_limit)

[supervisor_smart_share_mode](./supervisor_smart_share_mode)

