---
sidebar_position: 1
---

# Event names

The _name_ is the component of the event which details when the event should
take place. This is either pre-defined, or user-defined.

The possible pre-defined event names for jobs are:

Event Name| Event Trigger  
---|---  
complete| Job is set to complete  
done| Job is set to complete or killed or failed  
submit| Job has been submitted  
killed| Job has been killed  
blocked| Job has been blocked  
failed| Job has failed  
running| Job has started running  
waiting| Job has been set to waiting  
assigned| Job has been assigned to a host  
removed| Job has been removed  
modified| Job has been modified  
dummy| Event is time-based
<!-- dummy| Event is time-based - see [here](/display/QUBE/How+to+submit+a+job+that+will+wait+until+later+to+run) -->

