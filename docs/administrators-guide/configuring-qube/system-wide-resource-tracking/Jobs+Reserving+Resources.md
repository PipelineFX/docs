---
sidebar_position: 6
---

# Jobs Reserving Resources

All resources must be *reserved* by job processes by setting the "reservations" field at job submission.

For example, setting the reservations field to
```
global.shake=1
```

will have the job reserve 1 of the global.shake resources for each job process.

By default, "host.processsors=1" is automatically reserved at job submissions. This means that each job process will reserve 1 host.processor resource and will only run on a system that has at least one host.processor (job slot) available.
Adding a "+" when reserving resources will have it reserve all the remaining resources on that Worker for that resource.
