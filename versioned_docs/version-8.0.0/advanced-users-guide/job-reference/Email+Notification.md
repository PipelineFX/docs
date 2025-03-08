---
sidebar_position: 10 
---

# Email Notification

Jobs can be set up to automatically e-mail the job's owner when the job has completed. This is enabled on a per-job basis. It is also possible to send e-mail to any other address. This is specified in the job's address field. Emails are sent from the Supervisor, so it must have that ability enabled.

## Configuration
Email is configured via variables in the qb.conf file, specifically: **need links**

| Variable | Controls |
| ---      | ---      |
| mail_administrator	| The mail user account to which the Supervisor will send email in the event of critical system events |
| mail_domain	| The domain name the Supervisor will append to the user's name if the user hasn't provided a full email address to use |
| mail_from	| The mail user name or address that the Supervisor will use in the "From" field of notification email that it sends |
| mail_host	| The SMTP server to use to send email through |
| mail_job_status_format	| A file that defines the format to use when sending job status to a user via email |
| mail_license_status_format	| A file that defines the format to use when sending warnings about expiring licenses |
| mail_port	| The port number to use on the SMTP server |
| mail_subjob_status_format	| A file containing the format to use when sending subjob status to a user via email |
| mail_work_status_format	| A file containing the format to use when sending work status to a user via email |

## Command-Line Examples
It is also possible to specify email recipients from the command line:

| Command | Meaning |
| ---     | ---     |
| % qbsub --flags mail ls	| E-mail job owner when the job is done. |
| % qbsub --flags mail --address anon@server.com ls	| Email a specific address |

