---
sidebar_position: 10
---

# client_restrictions

## Synopsis

`client_restrictions` = _restrictions_

The client applications will use  _restrictions_  as the default job restriction if not specified.

## Job and Worker Restrictions

Restrictions are used to allow or restrict where jobs run, and are applied to both jobs and Workers.  Restrictions are based on cluster names. A job has preferential priority on a Worker whose cluster matches the job's cluster, but the job is free to run on any Worker in any other cluster, subject to the restrictions defined here.

#### Restrictions defined for jobs

When a job has a restriction defined, it means _only run on hosts that satisfy the restriction expression_. Hosts that don't satisfy the restriction expression won't be considered as dispatch candidates (the job will never be sent to that Worker).

#### Restrictions defined for Workers

When a Worker has a restriction defined via its [worker_restrictions](./worker_restrictions) value, it means _only run jobs whose cluster value matches one of the clusters in that worker's restriction expression._  The worker won't accept jobs whose cluster doesn't match one of the clusters in the worker's restriction expression.

#### Restrictions Syntax

A restriction is really defined as a "filter" for hosts based upon information in the queuing algorithm; the values are one or more cluster names. In the priority/cluster queuing system, a user specifies the restrictions with a directory structure format:
<!--
A restriction is really defined as a "filter" for hosts based upon information in the queuing algorithm; the values are one or more cluster names. In the[ priority/cluster queuing system](/display/QUBE/How+to+use+clustering+for+workers), a user specifies the restrictions with a directory structure format:
-->

```
/[<segment>/][<segment>/][+|*]
```

* **\*** means  _only the first level below_.
* **+**  means  _all levels below that level, regardless of depth_  in the hierarchy.

:::tip[&emsp;]
The restriction value is actually evaluated as an expression, and multiple clusters are specified in a "this cluster  **OR** that cluster  **OR** the other cluster" type of string, with the " **||** " symbol to mean  **OR.**
:::

## Examples

### Job Restrictions

| Syntax| Meaning |
|-------|---------|
| qbsub -cl /private -restr /private \<cmd\> | Submit a job that will have highest priority in \/private and run _only_ in \/private |  
| qbsub -cl /private/very -restr '/private \|\| /private/\*' \<cmd\>| Submit a job that will have highest priority in /private/very, but could run in _any host_ in  /private or in the first level below /private |
| qbsub -cl /private/very/deep -restr '/private \|\| /private/+' \<cmd\>| Submit a job that will have highest priority in /private/very/deep, but could run in _any_  host at any level at /private or below |
  
### Worker Restrictions

| Syntax | Meaning |
|--------|---------|  
| worker_cluster = "/private/very/deep"<br/>worker_restrictions = "/private/very/deep" | Define a host that will  _only_ run jobs in /private/very/deep |
| worker_cluster = "/private"<br/>worker_restrictions = "/private \|\| /private/\*"    | Define a host that will run jobs in any cluster at _/private or 1 level below_ - done with the **\*** |
| worker_cluster = "/private/very"<br/>worker_restrictions = "/private/very \|\| /private/very/+"| Define a host that will only run jobs in /private/very or any level below - done with the **+** | 
  
## Defaults

No job restrictions.

## See Also

[Controlling Host Selection](../../advanced-users-guide/job-reference/Controlling+Host+Selection)

