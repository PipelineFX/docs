---
sidebar_position: 5
---

# Process group labels

Process group labels exist to provide the developer with an abstract method of
determining job relationships independent of the job name or job ID relative
to the process group ID.

In order to support this, the jobs must all be submitted under the same
process group ID either by submitting the jobs in the same API call, or by
attaching the job to a process group upon submission.

The system automatically checks for the uniqueness of the process group label,
and will automatically assign unique labels to jobs which don't have labels.
Once the jobs are all in the same process group, each job is allowed to
reference each other by using their labels.

## Example

done-job-hello  
running-job-world

## See Also:

[Job Labels](/developers-guide/Job+Labels)

