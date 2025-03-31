---
sidebar_position: 2
---

# Distributed Renders with V-Ray

How to use the V-Ray Distributed Render (DR) feature with Qube!

Please read this file carefully, if you would like to take advantage of V-Ray
DR with Qube!

## Prerequisites

* All worker machines need to have the following installed and working properly:

* Qube core 5.1 or above
* Qube Worker 5.1 or above
* Qube 3dsmax Jobtype 5.2 or above
* 3dsmax 8.0 or above
* First and foremost, V-Ray DR for 3dsmax must be setup, and  
tested to be working properly, outside of Qube! Please consult your 3dsmax  
documentation for details on setting it up.

* For V-Ray DR, the jobtype needs to be able to write to the  
"vray_dr.cfg" file found in the system's 3dsmax installation "plugcfg"  
folder, which is something like:  
```
"C:\Users\USERNAME\AppData\Local\Autodesk\3dsMax\2011 - 64bin\enu\plugcfg"
```
Accordingly, you'll need to make sure that all execution users on all  
workers have write-access to the file and containing folder.

## Usage

* Open or create a scene.

* Make sure your scene is properly set up to use V-Ray as the renderer.

"Rendering" menu -> "Render" -> "Common" tab -> "Assign Renderer" rollout

* Make sure to turn on "Use Placeholder Objects" in the "Translator  
Options" rollout of the "Processing" tab.

* Make sure to leave "Bucket Order" set to "Hilbert" in the "Options"  
section of the "Sampling Quality" rollout of the "Renderer" tab.

* The following caveats inherent to DBRs also apply to DBR on Qube!

Icon

Contour shading does not work with distributed bucket rendering.

Icon

You cannot use distributed bucket rendering when you render to texture.

* Save the scene if changes were made.

* Open the Qube! Submission dialog: "Qube!" Menu -> "Submit Render..."

* In the "Parameters" section, select "vray" in the "Enable DBR" pull-down.

* In the "Qube Job Basics" section, specify the desired number of Subjob  
Processes.

* Set up other parameters as necessary.

* Submit the render, by clicking the "Submit" button.

## Known Issues and Limitations

* Workers will wait idle until the specified number of CPUs are  
collected for the job. For example, if a job specified 8 CPUs, the  
job will not start processing until all 8 CPUs are available--  
sometimes the first 7 CPUs can wait for a long time before the 8th  
one becomes available.

* If renderers other than V-Ray are designated, the job will render the only
using the master node-- other reserved nodes will sit idle until the job is
finished or killed.

* All limitations of the 3dsmax jobtype apply to DR rendering  
on Qube!. For example, the scenefile must be located on a shared  
file-server path where all workers may uniformly access.

* All limitations of V-Ray and V-Ray DR for 3dsmax, inherently apply. For
example, if a slave node becomes inaccessible during a render, the entire job
may crash, due to the nature of the rendering software.

