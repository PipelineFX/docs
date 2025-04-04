---
sidebar_position: 2
---

# Where is the output from the executed callback code

If you're printing out debug data in your callback script, it **may** appear in
the .cb file that lives in the job log directory (either on the supervisor or
in your central job log location if you've set one up).

Whether or not it shows up depends largely on the callback language and the OS
on which the supervisor runs.

It is recommended that any debug messages are explicitly printed to a file
rather than to stdout.

