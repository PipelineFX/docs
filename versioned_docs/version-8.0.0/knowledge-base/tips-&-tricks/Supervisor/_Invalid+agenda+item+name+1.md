---
sidebar_position: 3
---

# I am getting 'Invalid agenda item name "1". Skipping slice.' warnings in the QubeGUI. What's going on and how do I fix this?

**Cause** : It's likely that you have just recently reset your Qube! database
on the same machine that was previously running a Qube! supervisor. The
database was cleared, but the job log files are still present. The discrepancy
between those log files and what is stored on the Supervisor database is what
the QubeUI is likely issuing these warnings about.

**Solution** : Delete or move the job log files. They can be found at:

  * Windows:         C:\Program Files\qube\logs\job
  * Linux & macOS:   /var/spool/qube/job

