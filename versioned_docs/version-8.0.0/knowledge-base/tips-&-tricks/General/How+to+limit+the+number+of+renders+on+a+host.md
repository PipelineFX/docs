---
sidebar_position: 1
---

# How to limit the number of renders on a host

The easiest thing to do is to submit your jobs with a memory reservation. The
reservation will force the Supervisor to look for hosts with the requisite
amount of memory before dispatching the job, and then block out (or reserve)
the amount requested. This will serve to limit the number of subjobs running
on the host to only the number that it can safely handle.

For example, say your hosts have 4 subjob slots and 2GB of memory. If each
render process or thread needs 1GB or memory, you will soon overtax the
machine because you will have 4 subjobs each asking for 1GB or more.

If you add a resource reservation (in MB) when you submit the job:

`host.memory=1000`

Then you will only have at most 2 subjobs running on the host, because that's
as much memory as it can handle. Memory is a resource, so you should be able
to monitor it in the QubeUI by selecting a Worker and examining the
Properties tab, under host resources.

You can also restrict jobs by limiting the number subjobs per host on a per
job basis. If you have hosts with 4 subjob slots, you can just send each job a
resource reservation of:
    
`host.processors=4`

However, if you have a mix of hosts with different numbers of subjob slots,
then you would need to do something like this:

`host.processors=1+`

This will reserve a minimum of 1 slot per subjob, up to the maximum number of
slots on the host. This won't guarantee a host will have multiple subjobs, so
you may need to investigate the other options above.

You could reconfigure each host to have only one subjob slot per host. To do
this, you will need to log in to the Worker and use the Configuration tool. Go
to Worker Settings, then Advanced settings and set the Worker CPUs to 1.

Create a limited resource on each host. For example, if you're working with
Maya render jobs, you can create a Maya worker resource with a quantity of 1
per Worker. You'll need to use the Configuration tool, select Worker Settings,
then Worker Configuration. Add a Resource called host.maya Worker resource,
and a Total of 1.

When you submit the job add this reservation:
    
`host.maya=1`

More information on resources and using the Configuration UI can be found in
the Administration manual.

