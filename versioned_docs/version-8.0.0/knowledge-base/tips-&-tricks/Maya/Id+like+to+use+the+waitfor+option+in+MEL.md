---
sidebar_position: 2
---

# I'd like to use the "waitfor" option in MEL

Unfortunately the "waitfor" option isn't something available in the individual
APIs however, there is an equivalent field in the job which the "waitfor"
option can take advantage of. It's called "dependency".

Just add into your dependency field something similar to:

`"dependency", "complete-job-123155"`

Where complete is the state you are looking for, job is the kind of event, and
the number is the job id. Note, you should use "done" rather than "complete"
if you don't care if the job has failed, been killed, etc...

