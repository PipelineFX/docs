---
sidebar_position: 10 
---

# Renders submitted through the command line fail or lock up

Due to changes in render software architecture, a mechanism called JobObject
which is used by the Qube! worker disrupts the internal code in common
renderers such as 3dsmax and AfterEffects. The worker must be notified not to
use the JobObject. To do this, specify the disable_windows_job_object flag
when submitting your jobs

```
ex. qbsub --flags disable_windows_job_object MyRenderer scene.ma
```

For more information on windows job objects, please refer to the Microsoft
Developer Article:

[MSDN - Job Objects](http://msdn2.microsoft.com/EN-US/library/ms684161.aspx)

