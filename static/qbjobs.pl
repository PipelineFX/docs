#!/usr/bin/perl
#
# Qube! - Example Perl Job Display Script 
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
#	An example script to show the capabilities of the perl api
#


use lib "$ENV{QB_DIR}/api/perl";
use lib "../../api/perl";
use qb;
use Getopt::Long;

my $help, $status, $user;
my $result = GetOptions(
		"help" => \$help,
		"status=s" => \$status,
		"user=s" => \$user,
	);

#  display help for weird options
display_help() if (!$result);
display_help() if ($help);

############################################################################
#
#
#   The "fields" and "filters" portion of the query is important for
#     obtaining exactly the information you are looking for.  
#
#   For example:
# 
#       All jobs which are owned by user "yuna"
#		
# 	my $filter = {};
#	$filter->{"user"} = "yuna";
#
#	my @jobs = qb::jobinfo($filter);
#
#       All jobs which are owned by user "yuna" or "tidus"
#
#	my $filter = {};
#	my $filter->{"user"} = ["yuna","tidus"];
#
#
############################################################################
my $fields = ["subjobs"];
my $filter = {};
$filter->{status} = $status if (length($status));
$filter->{user} = $user if (length($user));

#  query Qube! - supervisor for the jobs we want
my @jobs = qb::jobinfo($filter);

#  figure out the max col length for all the jobs.
tally_title_lengths();
tally_col_lengths($_) for (@jobs);

#  display the jobs
display_title();
display_job($_) for (@jobs);




############################################################################
#
#  format display 
#
############################################################################
my %cols;
sub tally_title_lengths
{
	for (qw(id pid pgrp label user prototype status name cpus priority cluster)) {
		$cols{$_} = length($_);
	}
}

sub tally_col_lengths
{
	my $job = shift;
	for (qw(name user label priority id pid pgrp cluster cpus status prototype)) {
		$cols{$_} = $cols{$_} < length($job->{$_}) ? length($job->{$_}) : $cols{$_};
	}
}

sub display_title
{
	my $total = 0;
	for (qw(id pid pgrp label user prototype status name cpus priority cluster)) {
		print $_;
		print " " x ($cols{$_} - length($_) + 1);
		$total += $cols{$_} + 1;
	}
	print "\n";
	print "-" x $total, "\n";
}

sub display_job
{
	my $job = shift;
	for (qw(id pid pgrp label user prototype status name cpus priority cluster)) {
		print $job->{$_};
		print " " x ($cols{$_} - length($job->{$_}) + 1);
	}
	print "\n";
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
			Qube! - Perl Command Line API

NAME
	qbjobs.pl - list Qube! jobs

SYNOPSYS
	qbjobs.pl [options] [jobid(s)]

DESCRIPTION
	qbjobs.pl  displays a list of currently active jobs in the Qube! queueing system software	
	using perl api.


OPTIONS
	The options which qbjobs accepts manipulate either the list of jobs or the fields displayed.  

	FILTER
		Switch			Description
		--status [status]	display jobs with status <status>
		--user [login]		display jobs for user <login>
		

	DISPLAY
		Switch			Description
		--help			help for qbjobs
	

AUTHOR
	Anthony Higa - PipelineFX

REPORT BUGS
	support\@pipelinefx.com

COPYRIGHT
	Copyright \@ 2007 PipelineFX, LLC.
	All rights reserved.

SEE ALSO
	Qube! 

HELP
exit(0);
}

1;

