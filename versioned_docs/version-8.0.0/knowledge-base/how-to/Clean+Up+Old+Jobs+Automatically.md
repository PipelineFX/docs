---
sidebar_position: 1
---

# Clean Up Old Jobs Automatically

## Synopsis

Old jobs left in Qube! are often of little to no use.  While their database
entries aren't very detrimental to the operation of Qube!, the logs from all of
those jobs, when ignored, can balloon in size, sometimes filling the drive(s)
on which they reside.

By removing old jobs, you reduce the number of files used by the database,
and, more importantly, reduce disk space required to hold logs of jobs that
are no longer useful to your production/facility.

We have included a python script called job_cleanup.py that takes, as an
argument, the number of days worth of jobs that you would like to **keep**. 
It then removes all of the remaining jobs and their logs.  The idea, then, is
that you run this script daily, always keeping, for example, the last 30
days's worth of jobs and deleting the rest.  The script looks at the job's
completion time rather than submission or start time, so a job will not be
considered for removal until the its most recent completion time is older than
the specified number of days.

:::info
Performance Charts data comes from a separate database, so even after removing
old jobs, the Performance Charts remain fully intact.
:::

:::danger
Job removal is a fairly database- and disk-intensive operation; avoid removing
a very large number of jobs at one time. Limit job removal to 1000 jobs at a
time, and wait a few minutes between removals to avoid the supervisor's
filesystem getting swamped with table deletion operations.
:::

## Requirements

Python 3.6 or greater must be installed on the supervisor.  For Windows, we
recommend [www.python.org.](http://www.python.org.)  Linux and macOS should have
Python already installed.

## How to use the script

You will find this same information by running "job_cleanup.py -h"

```
C:\Program Files\pfx\qube\utils>python job_cleanup.py -h
Usage:
        job_cleanup.py [options]: delete jobs and/or logs, either for jobs completed more than X days ago, and/or for all jobs removed from Qube!.

Options:
  -h, --help            show this help message and exit
  -c CHUNK, --chunk=CHUNK
                        Chunk each query with a fixed number of jobs, so as to
                        save memory on the server side (and prevent supe
                        thread crash). 0 defaults to no chunking
  -j, --removeJobs      Delete jobs from Qube completed more than X days ago,
                        must be used in conjunction with the "-d" days
                        argument
  -d DAYS, --days=DAYS  Delete logs for any jobs that were submitted more than
                        a certain number of days ago
  --removeLogs          Delete logs as part of the job removal
  --removeOrphanedLogs  Delete logs for jobs that no longer exist in Qube -
                        removed but their logs were left behind.
  -v, --verbosity       Increase verbose logging (to stdout). -vv is more
                        verbose than -v
  -q, --quiet           Suppress all logging and output short of fatal errors
  -I, --ignore-sanity   Ignore sanity check (allows more than 10% of jobs to
                        be removed).
  -n, --dry-run         Show what would have been done, but do nothing.`  
```

## Before you begin: Preparation

Before you set up the scheduled task/cron job, you need to be sure the script
will run to completion without errors. 

By default, the script will not delete more than 10% of the jobs in the
database.  The first time you run the script, you'll likely need to ignore
that check, but you probably do not want to ignore it on a daily basis.

The job_cleanup script also provides a way for you to simulate the process
without actually doing anything - a dry run.  This way you can see what's
going to happen to see if it's in line with your expectations.

For our example, we want our scheduled task to remove all but the last 30 days
worth of jobs, removing all of the old job logs and any orphaned logs (those
jobs that have been deleted, but their job logs were left behind).



Preparation, then, should go like this:

1. cd QBDIR/utils
2. Do a dry run: `job_cleanup.py -j -d 30 --removeLogs --removeOrphanedLogs -n`
This will probably fail the sanity check.  That's ok.  If it does not fail
the sanity step, skip to step 4.  If it does fail the sanity check, continue
to step 3.   
3. Do a dry run, ignoring the sanity check: `job_cleanup.py -j -d 30 --removeLogs --removeOrphanedLogs -n -I`    
This should print out a long list of jobs that will be removed, each line
should say "(dry run)" at the end, letting you know it's not actually doing
anything. **Only when you're satisfied**  - in other words, when it's not
reporting it will delete jobs you want to keep - with what the dry run
returns, proceed to step 4.   
4. Now run the script without the -n, this will actually delete files and jobs and **is irreversible**: `job_cleanup.py -j -d 30 --removeLogs --removeOrphanedLogs -I`

Step 4 may take a considerable amount of time.

:::tip
If you wanted to remove all but the last 7 days worth of jobs, for example,
you would change the "-d 30" to "-d 7".
:::

## Creating a scheduled task to clean up old jobs on a Windows supervisor

Use the Windows Task Scheduler wizard.  Go to Start > Control Panel >
Administrative Tools > Task Scheduler, then click on "Create Basic Task" and
follow through the wizard.

You likely want the scheduled task to run daily, in the middle of the night. 
You want it to "Start a program" and the program should be:
```
"C:\Program Files\pfx\qube\utils\job_cleanup.py" -j -d 30 --removeLogs --removeOrphanedLogs
```

:::note
These arguments will keep the last 30 days worth of jobs.  If you would
like more or less, then adjust the -d argument accordingly.
:::

## Creating a scheduled task to clean up old jobs on an macOS supervisor

macOS uses launchctl and launchd to schedule scripts. To set this up, create a
.plist file with contents similar to this file, which will run the script once
a day at 12:03am:

``` title="qb_job_cleanup.plist"
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.pipelinefx.job_cleanup</string>
    <key>OnDemand</key>
    <true/>
    <key>RunAtLoad</key>
    <false/>
    <key>Program</key>
    <string>/Applications/pfx/qube/utils/job_cleanup.py</string>
    <key>ProgramArguments</key>
    <array>
        <string>-j</string>
        <string>-d 30</string>
        <string>--removeLogs</string>
        <string>--removeOrphanedLogs</string>
        <string>-I</string>
    </array>
    <key>StandardOutPath</key>
    <string>/var/tmp/qb.cleanup.log</string>
    <key>StandardErrorPath</key>
    <string>/var/tmp/qb.cleanup.log</string>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>00</integer>
        <key>Minute</key>
        <integer>03</integer>
    </dict>
</dict>
</plist>
```

:::warning[Important]
You can name this file whatever you like, but the name must end in .plist, and the name (without the .plist suffix) must match the Label string. In this example we have used com.pipelinefx.job_cleanup and com.pipelinefx.job_cleanup.plist
:::

Then perform these steps in a Mac Terminal (shell):

```bash
$ sudo mv com.pipelinefx.job_cleanup.plist /Library/LaunchDaemons/
$ sudo chown root /Library/LaunchDaemons/com.pipelinefx.job_cleanup.plist
$ sudo chmod 644 /Library/LaunchDaemons/com.pipelinefx.job_cleanup.plist
$ sudo launchctl load /Library/LaunchDaemons/com.pipelinefx.job_cleanup.plist
```

* The sample script is written to run each day at 3 minutes past midnight. You can change the Hour & Minute tags to suit your installation. You can also restrict this to running, say, weekly on Sunday by adding <key>Weekday</key> <integer>0</integer> into the StartCalendarInterval dictionary.
* Note that the output of stderr and stdout is written to /var/tmp/qb.cleanup.log. This can be changed by you to the location of your choice, and you can separate stderr and stdout into two different files if you prefer.
* Testing this setup first by adding '-n' as an argument in the file is a good idea.

You can test the script without waiting for midnight by typing:

```bash
$ sudo launchctl start com.pipelinefx.job_cleanup
```

You can remove the script with this commands:

```bash
$ sudo launchctl unload /Library/LaunchDaemons/com.pipelinefx.job_cleanup.plist
$ sudo rm /Library/LaunchDaemons/com.pipelinefx.job_cleanup.plist
```

## Creating a cron job to clean up old jobs on a Linux supervisor
Add a file in /etc/cron.daily called job_cleanup.  Be sure it is executable by all (chmod a+x job_cleanup).  This is a shell script that will be run daily. A working example looks like this:

```bash
#!/bin/bash
logfile= /var/log/job_cleanup .log
/usr/local/pfx/qube/utils/job_cleanup .py -j -d 30 --removeLogs --removeOrphanedLogs >> $logfile
```

:::note
These arguments will keep the last 30 days worth of jobs.  If you would like more or less, then adjust the -d argument accordingly.
:::

## See also

* [qbremove](/advanced-users-guide/command-line-reference/qbremove)
