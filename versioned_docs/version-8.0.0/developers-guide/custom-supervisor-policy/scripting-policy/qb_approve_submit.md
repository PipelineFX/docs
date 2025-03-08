---
sidebar_position: 2
---

# qb_approve_submit

```
qb_approve_submit($job)
```

This function provides the chance to review the submitted job before insertion into the queue. This allows the developer to enforce things such as accounting information validity or restricting users to specific clusters. The function must return 1 if the job is to be accepted and 0 if it is to be rejected.
