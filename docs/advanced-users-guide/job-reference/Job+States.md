---
sidebar_position: 2
---

# Job States

## States
As a job moves from submission to execution to completion, it goes through a
variety of states - and at any given moment every job is in exactly one of
several possible states. The starting state of a job can be specified by the
user or developer through the job structure in the API, or through the command line.

| State | Meaning |
| ---   | ---     |
| pending |	Default state for submitted jobs. Signals to the Supervisor that the job may be started at any time. Jobs which have been suspended will also be marked as pending. |
| blocked |	Alternate state for submitted jobs. Tells the system to hold the job until it is unblocked by something, usually another job that this one depends on. |
| running |	Job that is doing work, with no failures. |
| failing |	Job that has not finished, but has at least one frame or instance that has failed. |
| retrying |	Jobs that have retry counts greater than zero, and have been retried (automatically) at least once, are marked as retrying. |
| killed |	Job that has been killed by a user. Killed jobs must be manually retried or resubmitted. |
| complete |	Job is no longer running, and all frames have succeeded. |
| failed |	Job is no longer running, and at least one frame or instance has failed. |

# Actions
States can be changed due to various actions taken by users or the Supervisor.

| Action | Meaning |
| ---    | ---     |
| block	| Typically done by users, but auto-wrangling will also block instances and jobs. |
| interrupt	| Kill the current frame and put the job into a pending state, where it can be picked up and rerun. |
| kill	| End the current frame and don't restart the job. A user must retry or resubmit this job. |
| resubmit	| Bring up the submission UI and possibly modify the job's parameters before sending it back to the Supervisor. |
| retry	| Put the job back onto the queue as-is, without modifying any of the submission parameters. |
| suspend	| Like "interrupt" except that it allows the current frame to finish first. |

