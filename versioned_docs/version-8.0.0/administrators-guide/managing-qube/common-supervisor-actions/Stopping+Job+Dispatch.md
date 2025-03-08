---
sidebar_position: 6
---

# Stopping Job Dispatch

After disabling job submission to the Supervisor, you will also want to prevent the Supervisor from dispatching additional jobs to hosts. The following command will stop Supervisor job dispatch:

```
% qbadmin supervisor --set stop_activity
```

The following command re-enables job dispatch:

```
% qbadmin supervisor --unset stop_activity
```
