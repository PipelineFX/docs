---
sidebar_position: 27
---

# qbsub

**qbsub** submits a command for the Supervisor to schedule.  If the --range is specified, a job with an agenda will be submitted.

## Usage 

qbsub [options] command

where command is a command to be executed on the remote host.

## Options
| Option | Description |
| ---    | ---         |
| --name string | Job name | |
| --priority int | Priority value |
| --requirements string | Job requirements expression - Job Requirements |
| --reservations string | Job reservations expression - Job Reservations  |
| --restrictions string | Job restrictions expression - worker_restrictions |
| --pid int | Parent job to submitted job |
| --pgrp int | Process group ID |
| --cluster string | Cluster specification |
| --kind string | Job kind |
| --account string | Arbitrary accounting data string |
| --user string | User account to use Note: needs admin or impersonation privilege |
| --domain string | Qube! domain to use Note: needs admin or impersonation privilege |
| --cpus int | Number of subjobs to run |
| --max_cpus int (or "\*") | Maximum number of instances to use ("\*" means "no limit") for Smart-share auto-expansion (new in 6.6) |
| --processors int | Number of processors to reserve per host |
| --status string | Initial job state (blocked or pending) |
| --hosts string, ...  | List of comma delimited hosts to run job on |
| --omithosts string, ...  | List of comma delimited hosts to not run job on |
| --groups string, ...  | List of comma delimited host groups to run job on |
| --omitgroups string | List of comma delimited host groups to not run job on |
| --hostorder string | Order in which the hosts are preferred - hostorder syntax |
| --flags string, ...  | Flags (see below for description of all available flags) |
| --mail | Email job owner when job is complete. |
| --dependency string | Wait until trigger string condition has been met before starting. |
| --preexec string | Execute command string on the Supervisor when the job starts running. |
| --postexec string | Execute command string on the Supervisor when the job completes. |
| --waitfor int | Wait until job ID int is done before starting. |
| --timelimit int | Automatically kill the job if it runs longer than int seconds. |
| --agendatimelimit int |	Automatically kill an agenda item if it runs longer than int seconds. |
| --waiton | Qbsub will block until the submitted job completes. |
| --range string | Execute over range string QB_FRAME_NUMBER |
| --padding int | Range pad value. |
| --reverse | Reverse the frame range |
| --binary | Use binary for frame range ordering |
| --partitions int | Number of partitions to use (default: # of frames) |
| --chunk int | Number of frames to use per partition (default: 1) |
| --p_agenda string | Specify which frames to use as p-agenda (default: 1st, last, and middle frames) |
| --p_priority int | Set priority for p-agenda (default: site-wide value, or 1) |
| --p_cpus int | Number of subjobs to use to process p-agenda (default: length of p-agenda list) |
| --export string | Export job to \*.qja file. |
| --import string | Import job from \*.qja file. |
| --address string, ...  | List of string email addresses when using --email option |
| --type string --prototype string | Use string job type. |
| --data string | Raw package data string (for use only with --type option). |
| --retrysubjob int | Retry each subjob int times. |
| --retrywork int | Retry each work agenda item int times. |
| --retryworkdelay int | Insert artificial delay of int seconds before each automatic retry of work item |
| --preflights string,... | instance-level preflights (comma-separated) |
| --postflights string,... | instance-level postflights (comma-separated) |
| --agenda_preflights string,... | agenda-level preflights (comma-separated) |
| --agenda_postflights string,... | agenda-level posflights (comma-separated) |
| --xml | Output in XML format |
| --help | Command help |
| --version | Command version |


| Flag | Value | Description |
|------|-------|-------------|
| auto_mount | 8	| Require automatic drive mounts on worker. | |
| auto_wrangling | 16384	| Enable auto-wrangling for this job. |
| convert_path | 131072 | Automatically convert paths on worker at runtime. |
| disable_auto_complete | 8192	| Normally instances are automatically completed by the system when a job runs out of available agenda items. Setting this flag disables that. |
| disable_cpu_limit | 4096	| Normally, if a job is submitted with the number of instances greater than there are agenda items, Qube! automatically shrinks the number of instances to be equal to the number of agenda items. Setting this flag disables that. |
| disable_windows_job_object | 2048	| (<span style={{color: 'red'}}>Deprecated in Qube6.5</span>) Disable Windows' process management mechanism (called the "Job Object") that Qube! normally uses to manage job processes. Some applications already use it internally, and job objects don't nest well within other job objects, causing jobs to crash unexpectedly. |
| elite | 512	| Submit job as an elite job, which will be started immediately regardless of how busy the farm is. Elite jobs are also protected from preemption. Must be admin. |
| export_environment | 16	| Use environment variables set in the submission environment, when running the job on the workers. |
| expand | 32	| (<span style={{color: 'red'}}>Deprecated in Qube6.5</span>) Automatically expand job to use as many instances as there are agenda items (limited by the total job slots in the farm). |
| grid | 4	| Wait for all instances to start before beginning work (useful for implementation of parallel jobs, such as satellite renders). |
| host_list | 256	| Run job on all candidate hosts, as filtered by other options (such as "hosts" or "groups"). |
| mail | 1024	| Send e-mail when job is done. |
| migrate_on_frame_retry | 65536	| When an agenda item (frame) fails but is retried automatically because the retrywork option is set, setting this flag causes the instances to be migrated to another worker host, preventing the frame from running on the same host. |
| no_defaults| 524288| Prevent supervisor from applying supervisor_job_flags |
| p_agenda | 32768	| Enable p-agenda for this job, so that some frames are processed at a higher priority. |
| uninterruptible | 1	| Prevent job from being preempted. |

## Notes

## Examples
Submit "ls -l" job named "myjob1" to run on 2 cpus:

% **qbsub** --name myjob1 --cpus 2 ls -l

Submit maya render to machine that has maya installed:

% **qbsub** -priority 1 --reservations host.maya=1 Render -s 1 -e 30 myscene.ma

Submit a render job at priority 1 which matches host qb003:

% **qbsub** -priority 1 --requirements host.name=qb003 Render -s 1 -e 30 myscene.ma

Submit a simple ls job and send testuser@example.com notification when the job is complete:

% **qbsub** --mail --address "testuser@example.com" ls

Export to job.qja template file a simple dir command with priority set to 5:

% **qbsub** --priority 5 --export job.qja dir

Import job.qja template and submit this template and override the cluster specification to /example:

% **qbsub** --cluster /example --import job.qja

Submit an agenda-based, 200-frame Maya "Render" job, to be processed by 10 subjobs:

% **qbsub** --range 1-200 --cpus 10 Render -s QB_FRAME_NUMBER --e QB_FRAME_NUMBER /path/to/myscene.ma

Same as above, but use p-agenda to process some key frames at higher priority. We'll let the system choose the p-agenda, which will be the 1st, last, and middle frames of the entire range (i.e. 1, 200, and 99). Note als that this submission will generate 2 jobs:

% **qbsub** --range 1-200 --flags "p_agenda" --cpus 10 Render -s QB_FRAME_NUMBER -e QB_FRAME_NUMBER /path/to/myscene.ma

Same as above, but explicitly specify p-agenda frames. Note that we can omit the "-flags" option in this case:

% **qbsub** --range 1-200 --p_agenda "1-200x50" --cpus 10 Render -s QB_FRAME_NUMBER -e QB_FRAME_NUMBER /path/to/myscene.ma

Execute "myprog /home/data/myfile.data", but convert the path at runtime to a suitable path on the worker if necessary (as dictated by the worker_path_map defined on the worker): 

## See also
Job Requirements

Job Reservations

How to restrict a host to only one instance of a given kind of job, but still allow other jobs

Host Ordering
