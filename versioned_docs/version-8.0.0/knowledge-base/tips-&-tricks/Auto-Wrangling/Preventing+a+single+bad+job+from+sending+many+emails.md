---
sidebar_position: 1
---

# Preventing a single bad job from sending many emails

When Qube's Auto-Wrangling feature is enabled, it can detect a bad job,
automatically block it, and notify the user via email.

In certain situations, due to timing issues, the system may generate several
email messages before it finishes blocking the job, which can become a
nuisance for some.

This is especially the case when the job in question uses the `cmdrange`
jobtype backend, since, by default, it will move onto the next agenda item
even if the current one fails.

To minimize such behavior, jobs can be told to migrate their instances when
an agenda item fails by setting its `migrate_on_frame_retry` flag.

To have `migrate_on_frame_retry` set on every single job submitted, add it
to the definition of
[supervisor_job_flags](/administrators-guide/configuration-parameter-reference/supervisor_job_flags)
in the supervisor's qb.conf file.

You should be able to confirm that the flag is set on a job by checking the
"flags" field in the output from `qbjobs -l <JOBID>` or the job details in the
UI.

