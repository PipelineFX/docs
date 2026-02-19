---
title: Basic Installation Verification
sidebar_position: 5
---

# Basic Installation Verification

## Verify Supervisor installation

On the supervisor, start the Qube! US. It should connect to the
supervisor service and show the supervisor hostname and license count in
the UI title bar:

![image](img/57ea86e886b845247fc24ae9422575fd8179b97b.png)

If you see 0 licenses you will need to install the licenses on the
supervisor. See  if you have a license key to install.

### Test the supervisor connectivity

Use the Qube! UI Administration menu to test the supervisor's network
connectivity from the worker machine:

![image](img/4bbaba0dc2c83046127b8506da59be1936046d9b.png)

It should bring up a dialog:

![image](img/29a2bd35f11cb7a6db0663b6783eddf3648e1a79.png)

If you see this, your supervisor is up and running and responding to
requests.

## Verify Worker installation:

The simplest test possible is to submit a job that simply runs the
"set" command, which does nothing but print out the operating
system's environment variables. You can see what it's expected to do
by opening a cmd prompt on Windows or a Terminal on OS X and simply
typing `set` and hitting \<`Enter`\>.

Start the Qube! UI, and select the Submit-\>Tests-\>Test 'set' job
menu item.\
![image](img/e822834479db83256b84996480046ce493d11167.png)

Then, just click "Submit":\
![image](img/4a0c1bf250695778a04af881d0ae7d2e37fcb224.png)

Go to the Jobs Panel in the Qube! UI, and you should see the job in the
list (it will be named "Qube Test 'set' Job"). After a short period
of time you should see the job in a "Complete" state.\

![image](img/98320480a21ab119fd28da2629a06990e01df218.png)

Note that the ID of your job will be different from the screenshot
above.
