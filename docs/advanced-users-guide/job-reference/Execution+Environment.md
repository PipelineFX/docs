---
sidebar_position: 8
---

# Execution Environment

## Job Environment

By default, Qube! will execute the job in the job owner's environment as defined on the Worker. Keep in mind that the job owner may be the user who submits the job, or the job owner may be the generic 'qubeproxy' user, depending on how your installation is configured.

Specifically, the Worker runs setuid to the job owner's ID. This isn't the same as loading the user's .cshrc or .bashrc file, so variables defined in those files will not get set. You can control the job's execution environment explicitly by defining environment variables into the /etc/init.d Worker scripts (if they need to be global to the facility), or by setting them as part of the package of job commands that land on the Worker (if you just need to control the environment per job). A good tool for understanding the execution environment is to submit a command line job that runs 'set' or 'env' and examine the results.

You can also submit a job with the 'export_environment' flag - this packages up the environment that the job is submitted from and exports it to the Worker to be used to run the job. While this is useful for developers and others to control the execution environment, it is a sure way to kill cross-platform jobs, and is generally not a good idea. For instance, you may encounter some LD_LIBRARY issues when doing this, and in general it makes the environment more opaque and unreliable.

Really, a facility should not rely on users to control or set the execution environment, but should ensure that the environment is properly configured across all job submissions.

## Drive Mounting (Windows Only)

Qube! is capable of mounting the current network mounted windows drives. This can either be specified in the qb.conf (settable directly with a text editor or through the QubeGUI) or detected on the submission client machine. The format and location of the qb.conf file is discussed in the Administrator's Guide. It can also be specified on submission with the 'auto_mount' flag.

**Example**
```
% qbsub --flags auto_mount dir H:
```
