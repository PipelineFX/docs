---
sidebar_position: 8
---

# Worker Drive Mounting

Since the Qube! Worker runs as a service and is independent of the logged in user, it should have machine-centric mounts. The preferred method is NFS static mounts. On Windows, UNC paths are recommended. Make sure that the user that the Worker processes use to run the jobs have permissions to access these network file systems.

:::warning
The macOS AFP mounting is user-centric and therefore will not mount by default for the system and be accessible to the Worker daemon/service. We recommend using NFS or Samba mounts instead of AFP.
:::
