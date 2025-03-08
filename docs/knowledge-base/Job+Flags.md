---
sidebar_position: 5
---

# Job flags

**Flag**| **Value** | **Description**  
---|---|---  
auto_mount| 8| Require automatic drive mounts on worker.  
auto_wrangling| 16384| Enable auto-wrangling for this job.  
convert_path| 131072| Automatically convert paths on worker at runtime.  
disable_auto_complete| 8192| Normally instances are automatically completed by the system when a job runs out of available agenda items. Setting this flag disables that.  
disable_cpu_limit| 4096| Normally, if a job is submitted with the number of instances greater than there are agenda items, Qube! automatically shrinks the number of instances to be equal to the number of agenda items. Setting this flag disables that.  
disable_windows_job_object| 2048| (**Deprecated**) Disable Windows' process management mechanism (called the "Job Object") that Qube! normally uses to manage job processes. Some applications already use it internally, and job objects don't nest well within other job objects, causing jobs to crash unexpectedly.  
elite| 512| Submit job as an elite job, which will be started immediately regardless of how busy the farm is. Elite jobs are also protected from preemption. Must be admin.  
export_environment| 16| Use environment variables set in the submission environment, when running the job on the workers.  
expand| 32| (**Deprecated**) Automatically expand job to use as many instances as there are agenda items (limited by the total job slots in the farm).  
grid| 4| Wait for all instances to start before beginning work (useful for implementation of parallel jobs, such as satellite renders).  
host_list| 256| Run job on all candidate hosts, as filtered by other options (such as "hosts" or "groups").  
mail| 1024| Send e-mail when job is done.  
migrate_on_frame_retry| 65536| When an agenda item (frame) fails but is retried automatically because the retrywork option is set, setting this flag causes the instances to be migrated to another worker host, preventing the frame from running on the same host.  
no_defaults| 524288| Prevent supervisor from applying supervisor_job_flags  
p_agenda| 32768| Enable p-agenda for this job, so that some frames are processed at a higher priority.  
uninterruptible| 1| Prevent job from being preempted.  

