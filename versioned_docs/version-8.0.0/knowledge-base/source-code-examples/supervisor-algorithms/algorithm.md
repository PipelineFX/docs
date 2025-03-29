---
sidebar_position: 1
---

```perl title="algorithm.pm" showLineNumbers
#########################################################################################
#
#	PipelineFX L.L.C.
#
#	Author: Anthony Higa
#
#	This file is an example module on how to write a 'priority scheme' replacement
#	module.	
#
#	This is specifically designed to allow Qube! administrators to create their own
#	priority scheme which best fits their studio.
#
#	To use this module: Modify the supervisor's /etc/qb.conf
#
#	Add or change supervisor_queue_binding to:
#		supervisor_queue_binding = Perl
#		supervisor_queue_library = /path/to/this/module/algorithm.pm
#
#########################################################################################

#
# qb_init
#
#  This function is used to initialize stuff like databases, etc... in preparation
#  for qb_jobcmp and qb_hostcmp.  
#
sub qb_init
{
print <<INIT;
#########################################################################################

	Copyright: PipelineFX L.L.C. 
		All Rights Reserved.
	
	Software: Qube!

	Purpose: supervisor queuing algorithm replacement perl module.

		This is an example module to be used for reference in 
	building a custom queuing algorithm.

	Qube! license holders may modify this module for their own private use.

#########################################################################################
INIT
}

#
# qb_jobcmp
#
#  This is the definition of the jobcmp function.  It is a simple function designed
#	to compare 2 jobs together relative to a single host.
#
#	return 1 if a > b 
#	return -1 if b > a
#	return 0 if a == b
#
#
#	These are the available fields for the job hash:
#
#		id, pid, pgrp, priority, user, status, name, label, cluster, cpus, prototype, 
#		requirements, reservations, restrictions, account
#
#	These are the available fields for the host hash:
#
#		name, state, cluster, resources, restrictions, address
#


#
#  This example is to sort jobs ascending by job priority, then id 
#
sub qb_jobcmp
{
	my $joba = shift;
	my $jobb = shift;
	my $host = shift;

	#
	# Sort by priority and then by job id
	#

	$jobb->{priority} <=> $joba->{priority}
			or	
	$jobb->{id} <=> $joba->{id};
}

sub qb_hostcmp
{
	my $hosta = shift;
	my $hostb = shift;
	my $job = shift;

	#
	# since the hosts which start with 'qb' are the faster hosts on our farm,
	# we'll use the host's name to sort the list so that the 'qb' hosts
	# are used first.
	#

	open FILE, ">>/tmp/junk.txt";
	print FILE $hosta->{name}, "\n"
	close FILE;

	($hosta->{"name"} =~ /^qb/ ? 0 : 1) <=> ($hostb->{"name"} =~ /^qb/ ? 0 : 1);
}

sub qb_jobreject
{
	my $job = shift;
	my $host = shift;

	#
	#  As an example, all jobs owned by root will never be allowed to run
	#
	return 1 if ($job->{"user"} eq "root");

	#
	#  We will secretly build into the queuing algorithm a permanent lock to my host
	#  so nobody can run stuff on my machine except me!!!
	#
	return 1 if ($host->{"name"} eq "supervisor" and not $job->{"user"} eq "anthony");

	#
	#  return 0 if nothing is wrong.
	#
	return 0;
}

```
