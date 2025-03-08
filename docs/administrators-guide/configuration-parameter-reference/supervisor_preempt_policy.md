---
sidebar_position: 75
---

# supervisor_preempt_policy

## Synopsis

`supervisor_preempt_policy` = _method_

The pre-emption method the Supervisor will use. The Supervisor during its pre-
emption routine will determine if the system should kill a job and replace it.
However, the administrator is given the flexibility to determine if they want
their jobs to die instantly, or be notified that they should shut down. This
policy can also be controlled via a scripted policy as well.

## Values

Method | Meaning  
---|---  
passive | Shut down process when convenient  
aggressive | Kill process now  
mixed | Allow the custom algorithm to determine either aggressive or passive, on a per-incident basis  
disabled | Do not pre-empt processes  
  
## Example

```
supervisor_preempt_policy = aggressive
```

## Defaults

passive

