---
sidebar_position: 7
---

# Job Preemption 

Preemption is the mechanism by which the system tries to reach an equilibrium state where all jobs are running in the correct priority order. This equilibrium can be disturbed any time a high priority job is submitted to the queue. The Supervisor has the option to allow all the currently running jobs to finish before dispatching the new jobs, or kill the lower priority jobs until all the high priority jobs are running.

Since work at any priority is expensive, it would be better to at least let the subjobs finish what they are doing before killing them, especially if their work agenda items are small like a frame. That is the nature of the difference between "passive" and "aggressive" preemption.

* **Aggressive preemption** immediately kills a subjob so that a higher priority subjob can run instead. This preemption policy does not take into account the agenda, so any work performed before the preemption will be wasted.
* **Passive preemption** will allow agenda items to finish before becoming preempted by higher priority subjobs. This presumes the job contains an agenda, otherwise it will be immediately preempted.

## Setting the Policy
If not set, the default policy is passive. To set the preemption policy modify the [supervisor_preempt_policy](../configuration-parameter-reference/supervisor_preempt_policy) configuration in the Supervisor qb.conf:

```
supervisor_preempt_policy = aggressive
```
or
```
supervisor_preempt_policy = passive
```

## See Also
[supervisor_preempt_policy](../configuration-parameter-reference/supervisor_preempt_policy)
