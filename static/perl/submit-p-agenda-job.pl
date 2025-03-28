#!/usr/bin/perl -w

use strict;

# This script demonstrates how to submit an agenda-based job (in this case, a
# simple "cmdrange" job, with the p-agenda feature enabled, using the API.

# P-agenda jobs are supported in Qube 6.3 and above.

# A p-agenda enabled job is a job where the submitter may request that some of
# the agenda items be processed at a higher priority than the rest.  This is
# typically used to render a few frames of an animation sequence at a higher
# priority, to provide a fast turn around for a quick preview of the few
# "poster" frames.

# The "p" in p-agenda stands for "priority", "preview", or/and "poster".

# When a p-agenda job is submitted, 2 jobs are acutally created (so you get 2
# job IDs back).  The 1st job will process the p-agenda, at a higher priority
# (specified at submission, or using the system-wide default otherwise), using
# as many subjobs as there are p-agenda items by default, and the 2nd job will
# process the rest of the agenda items, using the specified number of subjobs,
# at the job's requested priority.

# Just like the normal "agenda" item list for a job, p-agenda items may be
# specified as the "p_agenda" item list for the job by the submitter. If not,
# the system will automatically pick the 1st, last, and the middle agenda
# items (for a total of 3 p-agenda items), in that order.  There may be a
# maximum number of p-agenda items per job that anyone can specify, which is
# controlled by the site-admin using a qb.conf parameter
# (supervisor_p_agenda_max).  By default, there's no limit.

# If the specified p-agenda items are not found in the agenda list, they will
# be processed by the 1st (high-priority) job anyway.  If the job's p-agenda
# items are also found in the job's agenda list, then obviously the 2nd
# (normal priority) job will skip those agenda items, since they'll already be
# processed by the 1st job.


# some voodoo to find the path to the Qube API "qb" module on any platform...
BEGIN {
	if ($ENV{QB_DIR}) {
		$ENV{QBDIR} = $ENV{QB_DIR};
	} elsif ($^O eq "darwin") {
		$ENV{QBDIR} = "/Applications/pfx/qube";
	} elsif ($^O eq "linux") {
		$ENV{QBDIR} = "/usr/local/pfx/qube";
	} elsif ($^O eq "MSWin32") {
		$ENV{QBDIR} = "C:/Program Files/pfx/qube";
	}
	unshift @INC, "$ENV{QBDIR}/api/perl";

}

use lib "../../api/perl";
use qb;

sub main
{
    # First, we set up the job dict as we would normally do for an
    # agenda-based job.  Here, we're submitting a "cmdrange" job, requesting
    # 10 subjobs ('cpus') to process it.
	my $job = {};
	$job->{'name'} = 'p-agenda job submitted from perl';
	$job->{'cpus'} = 10;
	$job->{'prototype'} = 'cmdrange';

	# our test job will run a "sleep 30" command to emulate a real job
	my $package = {};
    $package->{'cmdline'} = 'sleep 30';
    $job->{'package'} = $package;

    # The agenda for the job.  We have 1-20 frames.
    my $agendaRange = '1-20';
    my $agenda = qb::genframes($agendaRange);
    $job->{'agenda'} = $agenda;

    # Now, we specify that this job is a p-agenda job, by setting the
    # "p_agenda" job flag.
    $job->{'flagsstring'} = 'p_agenda';

    # (Optional) Let's hand-pick specific agenda items as the p-agenda items
    # (Note that we include an item "21" that's outside the 1-20 range, but
    # that's okay).  If we didn't explicitly specify the p_agenda list, the
    # system will automatically choose the 1st, last, and middle items from
    # the 'agenda' list, in that order.  In our case, that would have been "1,
    # 20, 10".  Note also that, there may be a limit to the number of p-agenda
    # that can be used for a job, set by the site-admin in the supervisor's
    # qb.conf (supervisor_p_agenda_max).
    $job->{'p_agenda'} = qb::genframes('1,12,20,21');

    # (Optional) We'll specify the priority for the p-agenda items. If this is
    # not specified, the system will assign the default, set by the site-admin
    # in the supe's qb.conf (supervisor_default_p_agenda_priority)
    $job->{'p_agenda_priority'} = 123;

    # (Optional) specify the number of subjobs ("cpus") to use for processing
    # the p-agenda items. If this is not specified, the system will assign as
    # many subjobs as there are p-agenda items.
    $job->{'p_agenda_cpus'} = 3;

    # We'll now submit the job. Actually, the system will create 2 jobs, one
    # for the p-agenda items at a high prioirty, and 1 for the rest of the
    # agenda items.  So we'll get back 2 job IDs.
	for(qb::submit($job)) {
		print "submitted: ", $_->{id}, "\n";
	}
}

main();



