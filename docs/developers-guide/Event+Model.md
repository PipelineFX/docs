---
sidebar_position: 6
---

# Event Model

  
Qube is an even-driven queuing system. Because of this, Qube inherently tracks
common job events. These include events such as when a job starts running, or
when a host reports new resources available.  
The advantage of an event-driven system is that the queuing algorithm and the
jobs themselves can take action based on those events.  
For a complete explanation on how Qube allows jobs to modify the logic
surrounding the job, please reference the **Callbacks** section of the
documentation.  

