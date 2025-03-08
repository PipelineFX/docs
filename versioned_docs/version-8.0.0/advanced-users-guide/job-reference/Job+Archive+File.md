---
sidebar_position: 12
---

# Job Archive File

The job archive is a file format used by Qube!'s tools both to store template information and to record a job's initial state. The Supervisor automatically creates an archive file when the job is submitted. These are stored in the job's job log directory (see Job Logs).

However users are also allowed to create these files for use as templates for submitting similar jobs repeatedly. Some of the data recorded in the template archive files can then be overridden at submission time. The contents of a binary job archive file (suffix: .qja) can be viewed with the standard Qube! tools, while files in the XML format (suffix: .xja) can be examined in any standard text editor.

**Examples**
| Command | Result |
| --- | --- |
| % qbsub --export file.qja sleep 10	| Archive the command to a job archive file |
| % qbsub --export file.xja --xml sleep 10	| Archive the command to an XML file |
| % qbsub --import file.qja	| Submit the file to the queue |
| % qbsub --priority 10 --import file.qja | Submit the file and change the priority |
| % qbarchive --long file.qja | View the contents of the job archive file |

