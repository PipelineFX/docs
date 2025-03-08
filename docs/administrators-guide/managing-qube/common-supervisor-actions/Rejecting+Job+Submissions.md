---
sidebar_position: 5
---

# Rejecting Job Submissions

In order to do major maintenance on a Supervisor, you will want to shut down its major functions, namely accepting jobs and dispatching them to hosts. The following command will force the Supervisor to reject job submissions:

```
% qbadmin supervisor --set reject_submit
```

The following command re-enables job submission:

```
% qbadmin supervisor --unset reject_submit
```
