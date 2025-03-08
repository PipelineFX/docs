---
sidebar_position: 4
---

# Extra fields

The extra in the event specification refers to the type of event. Each type of event may require additional information.

In the case of the job, it requires nothing more. However in the case of the subjob it requires the subjob's ID number.

## Example

When the job's instance #5 is done, execute callback: done-subjob-self-5

Extra information required by each type:

type | information required
---|---
job | None
subjob | subjobid
work | workid/name
host | hostname
time | timeofday
repeat | timeofday-interval
global | None
globaltime | timeofday
globalrepeat | timeofday-interval

:::warning[&emsp;]
The time of day is given in Qube time format. Intervals are in seconds.
:::
