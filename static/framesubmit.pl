#!/usr/bin/perl
#
# Qube! - Example Perl Frame Submission Script
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
#  This script is an example of how one may create a job that uses frames
#	as the atomic element in a job.  
#
#  Remember, this can easily be adapted for jobs which break up its frames into
#	tiles, or for distributing multiple chunks of frames to a single subjob
#
#  Abstractly, one isn't even required to use the 'frame' concept.  You can even
#	break up a job by steps which are atomic (or even dependent to be converted later)
#
#

#
# we need to include the Perl module location this is only
# necessary if you haven't installed the Qube module
#
use lib "../../api/perl";

# load Qube's Perl module
use qb;

#
# We now copy the %ENV variable
#
#	This is so that we can delete any data in the job env which doesn't make sense
#	on the farm. For this type of job we throw away the LS_COLORS variable.
#
my %env = %ENV;
delete $env{"LS_COLORS"};

#
# This job is meant to demonstrate the kind of api pipeline will 
# provide for Qube!.
#
# The qb::submit function is pretty simple.
#
#	@submitted_jobs = qb::submit(@list_of_jobs);
#
#	A job description is a simple Perl hash reference
#
#	my $job = {
#		"name" => "job name",
#		"priority" => <number>,
#		"branch" => "<branch specifier>",
#		"prototype" => "job type",
#		"cpus" => 20
#	};	
#
#	push @list_of_jobs, $job;
#
#	Included with a job is arbitrary data that is passed to the
#	job's execution module.  For a frame job, we'll just run
#	a simple command line each time, so the parameters
#	we allow are "cmdline" and "env"
#
#	To pass data you are allowed a single reference to any of perl's
#	basic structures...  (of course it's recursive so you can do complex data types)
#
#	In most cases it is best to pass a single hash as the main common data
#	structure.  Arrays and scalars will not allow for easy maintenance in case 
#	your supervisor decides they want the program to jump over buildings and
#	crawl through sewers.
#	
#	So:
#		my %env = $ENV;
#		$job->{data} = {
#			"cmdline" => "command line string",
#			"env" => \%env
#		};
#
#
#	To specify what frames you want done, this is created when you make a 
#	'work' list.  A work list is just a simple global list of items that
#	need to be completed in order to finish the job.
#
#	So for this type of job, we will use the work list to contain all
#	the frames we want to run.
#
#	These are 2 ways of doing this, you can either create the frame list
#	yourself or you can have a special function in Qube's perl api
#	do it for you.
#
#	We'll show the easy way for now, and then later the method with more
#	detailed control.
#
#	my $frames = qb::genframes("1-100");
#
#       The above use of genframes generates the work-list from 
#       frame 1 to 100.  Of course, genframes is more flexible in that
#       a frame range can be specified in this manner:
#
#                                       example
#               single:                 1
#               start-end:              1-100
#               start-end-step:         1-100x3  (ex. 1, 4, 7, 10, 13 ... 100)
#               comma:                  1,2,3
#               negative:               -100
#               complex:                -100-100 (ex. -100, -99 ... 99, 100)
#                                       -40-30x4,1,3,4,12 (weird... but it works)
#                                       100--10 (ex. 100, 99, 98 ... -9, -10)
#                                       
#       Note: for convenience, we have included the base function that does the above
#       as qb:rangesplit("1-100") which returns a list of frame numbers.
#

my $frames = qb::genframes("1-1");

for (@{$frames}) {
	$_->{"package"} = {"hello" => "asdfasdf"};
}

for (qb::submit(
	{
		"name" => "Frame Job",
		"priority" => 1,
		"prototype" => "frame",
		"cluster" => "/",
	#	"requirements" => "host.name = qb001 ",
		"cpus" => 1,
		"package" => 
			{	
				"cmdline" => '/bin/sleep ' . int(rand(40) + 1)
			},
		"agenda" => $frames
	}
))
{
	# we'll loop through the jobs and print out their id number...
	# the job hash's returned should include all the default data
	# the director has filled in such as the job id, pid, etc...
	print "new job id: ", $_->{id}, "\n";
}




