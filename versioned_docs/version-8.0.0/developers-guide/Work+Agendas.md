---
sidebar_position: 8
---

# Work Agendas

  
Qube! supports an abstract coordination concept called a work agenda. By
definition, it is a list of "things to do".

The use of a job agenda allows for the most flexible and dynamic use of
processor power, with the use of third party applications such as Maya. The
method of use, from submission to completion starts with first determining the
smallest unit of "work" for the application. In the case of a graphics
renderer such as Maya, the smallest unit of work is a frame.

Once the smallest unit of work has been determined, the developer is
responsible for generating the list of work to do. Because the use of 'frame'
numbers is common, Qube! has a few helper functions already written to help
simplify the list generation.

The agenda is then inserted into the job, and submitted into the queue.

Upon receipt of the job, the execution component of the job then calls the
function qbrequestwork(). The Supervisor then hands out the work agenda list
one item at a time until it has all been assigned and completed.

Because the job agenda is designed to only hand out job work items one at a
time, it is possible to have more than one subjob running identical code on
several hosts. It also allows for dynamic creation and removal of subjobs,
which are working on the job.

