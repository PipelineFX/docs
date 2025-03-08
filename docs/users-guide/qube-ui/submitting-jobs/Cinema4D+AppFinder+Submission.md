---
title: Cinema4D AppFinder Submission
---

# Cinema4D AppFinder Submission

## Step by step instructions for submitting Cinema4D AppFinder jobs with Qube!

### Install the Qube! Submission UI into Cinema4D

**(First Time Only)**

If you want the submission menu inside of Cinema4D (recommended) then
install the InApp plugins via the QubeUI application as shown here. To
do this, launch the QubeUI:

-   **Windows**: Double-click the color desktop icon

-   **macOS**: Find the color icon in Applications/pfx/qubeui and
    double-click on it

Then navigate to the File menu, choose "Install App UI" and choose the
Cinema4D (AppFinder) option. This will install the Cinema4d (AppFinder)
submission UI only. You will need to do this on every workstation that
you intend to submit Cinema jobs from.

![image](img/372a03f3b1f6445b28b34d7c47d6d6e717f07bf8.png)

### Launch a Qube! submission UI

Once installed you should be able to locate the "Qube! menu in
Cinema4D's menu bar via Extensions -\> User Scripts -\> Qube_Submit -\>
Qube! Submit (AppFinder).

![image](img/9bee58e17659a122c76ffe14d6d09320ec06b431.png)

AppFinder vs macOS vs Windows

:::info

What's the difference?

**Qube! Submit (AppFinder)** uses information from the worker to
determine if it is running Windows or macOS, and then use the render
executable specific to that platform.

**Qube! Submit (macOS)** assumes the targeted workers are running macOS.

**Qube! Submit (Windows)** assumes the targeted workers are running
Windows.

:::

### Job Submission Details

:::info

Not all sections need to be filled in in order to render only the fields
marked in red are required

:::

Parameters Specific to Cinema4d (AppFinder)

**Cinema4d path**

In the Cinema4d (AppFinder) submission window the **Cinema4d path** is set to 
the \_\_C4DCL\_\_ token, not a traditional path like
"C:\Program Files\Maxon Cinema 4D 2025". When the job is dispatched to a
worker the token with be replaced with the correct path by the AppFinder
job to the correct C4D executable version at run time.

![image](img/10948640b8ca5b156249f7e1817b607fc15db3af.png)

### Submit

Click 'Submit'

![image](img/7c9c828f9566b76f2a237d08f612c067ecc2597d.png)

For further details on the submission UI see below.
