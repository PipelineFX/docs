---
sidebar_position: 1
---

# Job Dependency Attribute Syntax

A job's dependency attribute can take several forms :

* \<jobid>
* complete-job-\<jobid>
* link-\<state>-\<type>-\<jobid> 
* info-\<state>-\{"",[]} 

The info syntax is only used when the dependencies are defined in a job's callbacks, in which case the job's dependency attribute only is used to inform WranglerView on how to draw the Dependency Graph layout.  This syntax resembles a python dictionary, and several characters are significant: 

* \* - means each frame 
* \"\" (blank) - means entire job 

:::warning
**Only** use **double-quotes** in the info string, there's a known bug where the use of single-quotes will result in the job instances appearing to be hung on the worker; they will start the instance but never get assigned frames.
:::

## Examples: 

**Wait for job 900 to complete**
* 900

**Wait for job 529 to complete**
* link-complete-job-529

**Link to job 430 on a frame-by-frame basis, as each frame in job 430 completes, unblock the corresponding frame in this job.**
* link-complete-work-430

**The job has several layers or dependencies:**
* info-complete-\{"1":["540:3"], "\*":["600:\*"], "":["700"]\}
  * frame 1 waits for frame 3 in job 540
  * and each frame waits for the corresponding frame in job 600
  * and the entire job waits for job 700

**The job has several layers or dependencies:**
* info-complete-\{"":["123","456"], "\*":["345:\*"], "10":["346:2", 346:4"]\}
  * the entire job waits for jobs 123 and 456
  * and each frame waits for the corresponding frame in job 345
  * and frame 10 waits for:
    * frame 2 in job 346
    * and frame 4 in job 346
