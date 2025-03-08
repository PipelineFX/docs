---
sidebar_position: 3
---

# Simple Job Type back end

## Example

There is no need to inform the back end script of the path to the API
libraries.

```perl title="Perl" showLineNumbers
use qb; use DBI;

my $job = qb::jobobj();

while(1) {
	my $frame = qb::requestwork();  
	last if ($frame->{"status"} eq "complete");

	if ($frame->{"status"} eq "blocked") {

	print "job $job->{id} has been blocked.\n"; qb::reportjob("blocked");  
	exit(0);
}

print "running frame: ", $frame->{name}, "\n";  
print "\tcommand: ", $job->{package}->{cmdline}, "\n";

system($job->{package}->{cmdline});

$frame->{"status"} = "complete";

qb::reportwork($frame); }
```
  

  1. First, get the job object. The object is the one passed to the qb::submit() function.
  2. Enter a loop, and wait for work to come from the (Supervisor) frame server:
  3. The qb::requestwork() call blocks the subjob until it gets an agenda item from the Supervisor. We'll call this a frame.
  4. Before we handle the frame, check its status. If it is complete, end the job.
  5. If the frame is blocked, go ahead and quit as well.
  6. Otherwise, print out the frame number, and execute the command.
  7. Once that has been accomplished, register the completed frame with the Supervisor.

