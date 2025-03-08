---
sidebar_position: 8
---

# Verification Steps on the Client

On a representative client machine when logged in as an end user, do the
following checks from the QubeUI:

1. Submit a basic "set" job - This verifies that you can submit a job that will
pick up, be assigned, and run successfully. This job will not access the file
system, so it won't test that.
	* Run "Submit-\>Tests-\>Qube Test (set) Job...".
	* Give it a few seconds to run, press the "Refresh" button, click on the
	job, and then switch to the "Stdout" panel on the right. Verify that it
	"completes" and outputs a list of environment variables.

2. Submit a basic "dir" or "ls" job - This tests to see if the Workers can
properly access the network file system.
	* For Linux Workers: Run "Submit-\>Tests-\>Qube Test (ls) Job...".
	* For Windows Workers: Run "Submit-\>Tests-\>Qube Test (dir) Job...".
	* Give it a few seconds to run, press the "Refresh" button, click on the
	job, and then switch to the "Stdout" panel on the right. Verify that it
	"completes" and outputs a list of files for that directory.
