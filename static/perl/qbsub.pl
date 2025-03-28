#!/usr/bin/perl
#
# Qube! - Example Perl Job Submission Script 
#	
#####################################################################################
#
# Licensed Materials - Property of PipelineFX L.L.C.
#
# (C) COPYRIGHT PipelineFX Limited Liability Corporation. 2007
# All Rights Reserved.
# 				
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with 
# PipelineFX L.L.C.
#
#####################################################################################
#
#
#


use lib $ENV{"QBDIR"}."/api/perl";
use lib "../../api/perl";
use qb;
use Getopt::Long;

my ($help, $priority, $cluster, $cpus, $export);
my $result = GetOptions(
		"help" => \$help,
		"priority=i" => \$priority,
		"export=s" => \$export,
		"cpus=i" => \$cpus,
		"waitfor=i" => \$waitfor,
		"timelimit=i" => \$timelimit,
		"cluster=s" => \$cluster
	);

#  display help for weird options
display_help() if (!$result);
display_help() if ($help);
display_help() if (!@ARGV);

#  setup job hash/object
my $job = {};
$job->{priority} = $priority if (defined $priority and length($priority));
$job->{cluster} = $cluster if (defined $cluster and length($cluster));
$job->{cpus} = $cpus if (defined $cpus and length($cpus));
$job->{waitfor} = $waitfor if (defined $waitfor and length($waitfor));
$job->{timelimit} = $timelimit if (defined $timelimit and length($timelimit));
$job->{prototype} = "cmdline";
$job->{package} = {
		"cmdline" => join(" ", @ARGV)
	};


if (length $export) {
	qb::archivejob($export, $job);
	print "exported job to file: ".$export."\n";
	exit(0);
}

#  query Qube! - supervisor for the jobs we want
my @jobs = qb::submit($job);

for my $job (@jobs) {
	print "submitted job - id: ", $job->{id}, "\n";

	for (keys %{$job}) {
		print "key: $_  <=>  value: $job->{$_}\n";
	}
}

############################################################################
#
#  display_help - prints help message, and exits.
#
############################################################################

sub display_help
{
print<<HELP;
QB(1)
			Qube! - Perl Command Line API Example

NAME
	qbsub.pl - submit a command line job to Qube!

SYNOPSIS
	qbsub.pl [options] [command]

DESCRIPTION
	qbsub.pl  submits a command for the Qube! supervisor to schedule

	Example:
		qbsub --cpus 2 ls -l
			submit "ls -l" to run on 2 cpus

		qbsub -priority 1
				Render -s 1 -e 30 myscene.ma

OPTIONS
	options modify what and how qbsub submits a job

	ACTION
		Switch			Description
		--priority [priority]	priority 
		--cluster [cluster]	cluster 
		--cpus [#cpus]		number of cpus to run
		--export [file]		export job to [file]
		--waitfor [dep]		wait for specific [dep] event
		--timelimit [time]	set job timelimit


	DISPLAY
		Switch			Description
		--help			help for qbsub
	

SEE ALSO
	Qube! 

HELP
exit(0);
}
