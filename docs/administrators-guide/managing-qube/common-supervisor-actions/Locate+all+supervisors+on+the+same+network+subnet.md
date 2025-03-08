---
sidebar_position: 3
---

# Locate all supervisors on the same network subnet

Typically, there should only be one Supervisor per subnet, but if you've experimented with multiple Supervisors or reinstalled one on another machine, you may inadvertently have more than one.  The following command will use the Qube! autodiscovery system to locate all Supervisors on the network subnet.

```
% qbadmin supervisor --find
```
