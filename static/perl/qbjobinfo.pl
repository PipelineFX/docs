#!/usr/bin/perl
############################################################################
#
#  Copyright: PipelineFX, L.L.C.
#
#  qbjobinfo.pl
#
#	An example script to show how to use the qb::jobinfo function
#
############################################################################


#
#  Include the path to the Qube! api
#
use lib "$ENV{QB_DIR}/api/perl";
use lib "../../api/perl";

#
# Include the Qube! perl api
#
use qb;

#############################################################################################################################
sub example1 {
#
#  Given no options, the qb::jobinfo routine returns all jobs in the queue.  However it doesn't include
#  any information on subjobs, callbacks or agenda.  The information provided is only the top level data
#  for a job.
#
#  The data returned is a reference to a list of hashes.  Each hash represents a single job and has keys corresponding to
#  the data available for you to access.  If you are interested in Object Oriented interaction with the Qube! data, each
#  object has already been blessed a qb::Job object.
#
#  In this portion of the example, we'll print out the available keys and their values per job using just the hash data.
#

	my @jobs = qb::jobinfo();

	foreach $job (@jobs) {
		foreach $key (sort keys %{$job}) {  # just for giggles... we'll alphabetize the keys
			print $key, " => ", $job->{$key}, "\n";
		}
		print "-" x 40, "\n";
	}
}

#############################################################################################################################
sub example2 {
#
# Unlike the prior example, we are interested in obtaining extra data such as callback, agenda and subjob information.
# To do this, you must first setup and list fields which you want to have included with the returned data.
# This data is not included by default in order to reduce network traffic and memory usage for both client and supervisor.  
#
# Please keep in mind if there is no "agenda" field or "callbacks" field returned, it's probably because the jobs
# do not have an agenda or callbacks respectively.
#

	my $fields = ['subjobs', 'work', 'callbacks'];
	my @jobs = qb::jobinfo($fields);

	foreach $job (@jobs) {
		foreach $key (sort keys %{$job}) {  # just for giggles... we'll alphabetize the keys
			print $key, " => ", $job->{$key}, "\n";
		}

		#
		#  Since we've queried for the subjob data, we might as well print it out.
		#

		print "subjobs:\n";
		my $subjobs = $job->{"subjobs"};
		foreach $subjob (@{$subjobs}) {
			foreach $key (keys %{$subjob}) {  
				print "\t", $key, " => ", $subjob->{$key}, "\n";
			}
			print "\t", "-" x 20, "\n";
		}
		print "-" x 40, "\n";
	}
}


#############################################################################################################################
sub example3 {
#
#  This example will show how to filter out jobs when querying from the supervisor.  This allows the client app to only 
#  handle the data it needs rather than have to filter it out.
#
#
#   In the first section we'll only query for jennifer's jobs
#
#   Example 1

	my $filter = {"user" => "jennifer"};
	my @jobs = qb::jobinfo($filter);

	print "found: ".@jobs."\n";

#
#   Example 2
# 
#         Filter for multiple users
#           my $filter = {"user" => ["marie", "bill"]};
#

#
#   Example 3
# 
#         Filter using regular expressions
#           my $filter = {"user" => "~^[lL]"};
#

#
#   Example 4
# 
#         Filter using multiple filters 
#           my $filter = {
#				"user" => "troy",
#				"priority" => 1
#		};
#

#
#   Example 5
# 
#         Combining both Field Request and Filter 
#           my $filter = {
#				"user" => "troy",
#				"priority" => 1
#		};
#           my $fields = ["subjobs"];
#
#	  qb::jobinfo($fields, $filter);
#

#
#   This is a partial list of all fields you may search with:
#
#	name				type
#	id 				INTEGER
#	pid 				INTEGER
#	pgrp 				INTEGER
#	cluster 			STRING
#	priority 			INTEGER
#	localorder 			INTEGER
#	globalorder 			INTEGER
#	status 				INTEGER
#	subjobstatus 			INTEGER
#	agendastatus 			INTEGER
#	user 				STRING 
#	domain 				STRING
#	name 				STRING
#	label 				STRING
#	flags 				INTEGER
#	cpus 				INTEGER
#	todo 				INTEGER
#	restrictions 			STRING
#	requirements 			STRING
#	reservations 			STRING
#	hosts 				STRING
#	hostorder 			STRING
#	groups 				STRING
#	data 				STRING
#	pathmap 			STRING
#	account 			STRING
#	prototype 			STRING
#	kind 				STRING 
#	path 				STRING
#	reason 				STRING
#	lastupdate 			INTEGER
#	timesubmit 			INTEGER
#	timestart 			INTEGER
#	timecomplete 			INTEGER
#	timeout 			INTEGER
#	retrysubjob 			INTEGER
#	retrywork 			INTEGER
#	dependency 			STRING
#	mailaddress 			STRING
#	prototypepath 			STRING
#	sourcehost 			INTEGER
#	deadline 			INTEGER

}

#############################################################################################################################
#
#  Simple main
#
my $EXAMPLE = shift @ARGV;

if ($EXAMPLE == 1) {
	example1();
} elsif ($EXAMPLE == 2) {
	example2();
} elsif ($EXAMPLE == 3) {
	example3();
} else {
	print "
To choose the example you would like to execute, use the command:

    perl qbjobinfo.pl <example #>

    Ex. perl qbjobinfo.pl 1

";
}


#
#  Return 1 - standard perl practice
#
1;

