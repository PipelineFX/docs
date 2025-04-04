---
sidebar_position: 3
---

# How do I reboot the Workers remotely?

To reboot a Worker:

```
qbadmin worker --reboot <hostname>
```

Reboot all Workers (Windows):

```
qbsub --flags host_list shutdown r
```

