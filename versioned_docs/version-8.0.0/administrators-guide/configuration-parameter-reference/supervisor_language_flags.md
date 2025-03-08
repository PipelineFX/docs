---
sidebar_position: 53
---

# supervisor_language_flags

## Synopsis

`supervisor_language_flags` =  _mask_

_Mask_ sets which languages the Supervisor will accept for callback code.
_Mask_ can be a comma-separated list of names, or a decimal value that is the
sum of the desired values (see Examples below).

## Values

Name| Decimal Value | Binary Value | Description  
---|---|---|---  
qube|  1 | 0000001 | Enables the "qube" callback language that uses the "code" section of the job to specify, for example, "unblock-subjob-self" instead of using Perl or Python  
Perl|  2 | 0000010 | Enables the use of Perl callbacks  
Python|  4 | 0000100 | Enables the use of Python callbacks  
post|  8 | 0001000 | Enables client-side callbacks. This is primarily used when a client-side script needs the Qube! job to complete before continuing.  "Qbsub --waitfor" or qb.waitfor() make use of this flag  
mail| 16 | 0010000 | Enables the mail function to work when a job is submitted with the email option turned on.  
dependency| 32 | 0100000 | Enables simple dependencies, for example, "link- done-job-12345"  
auto_wrangling| 64 | 1000000 | Enables [Auto-Wrangling](../../administrators-guide/configuring-qube/Auto-Wrangling)  
  
## Examples
```
supervisor_language_flags = 6  
```
or
```
supervisor_language_flags = "perl,python"
```

## Defaults
```
supervisor_language_flags = "qube,post,mail,dependency,auto_wrangling"
```

