---
sidebar_position: 3
---

# Event contexts

The _context_ or the "label" of the event is a specification to narrow the
scope of the event. When someone specifies 'job' they don't normally mean all
jobs, so a context is required to determine which job they are describing. A
context can be specified in 3 different forms:

1. pre-defined label
2. process group label  (see: [Job Labels](/developers-guide/Job+Labels))
3. job ID

Pre-defined labels are:

label| description  
---|---  
self| This job  
parent| The job referred to by  _pid_  

