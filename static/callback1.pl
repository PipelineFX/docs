#!/usr/bin/perl
#
# Qube! - Example Perl Job Dependency Submission Script
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
#  This script is an example of how to setup 2 jobs and have the second depend on the first.
#


use lib "../../api/perl";
use qb;


#
#  First we setup the hash for the first job
#
my $job_first = {
	# we'll name the first job.... "first job".
	"name" => "first job",
	
	# set the priority and cluster (not required) 
	"priority" => 10,
	"cluster" => "/",

	# set the job type
	"prototype" => "cmdline",

	# setup the package data specific to the 'cmdline' job type
	"package" => {
		"cmdline" => "sleep 0"
	},

	#
	# This is where the fun begins... we first assign a label to the job.
	# a label is used to identify jobs in the same process group without
	# using the process id's.  If you are thinking about what the 
	# supervisor does if you have the same label in the same process group...
	# it won't happen.  The supervisor enforces unique labels in the same
	# process group upon submission.
	#
	# The reason we use labels is to keep things abstract. Is to keep the
	# job submission abstract.  Using job id's as the principal method
	# of linking jobs together forces the developer to create jobs which
	# don't template very well.  It also makes bi-directional callbacks
	# impossible.  
	#
	"label" => "first"
};


#
#  Next, we setup the hash for the second job.
#

my $job_second = {
	# we'll name the second job.... "second job".
	"name" => "second job",
	
	# set the priority and cluster (not required) 
	"priority" => 10,
	"cluster" => "/",

	# set the job type
	"prototype" => "cmdline",

	# setup the package data specific to the 'cmdline' job type
	"package" => {
		"cmdline" => "sleep 0"
	},

	#
	#  because we don't want the job to start right away, we must
	#  submit it as blocked
	#
	"status" => "blocked",

	#
	# ok... so we've setup the first job's label.  we can now attach a 
	# callback to the second job so that it watches the first job. 
	#
	# all triggers are identified with the following format:
	# 	<status/name>-<type>-<label> 
	#
	# 	complete-job-first
	#
	#	in the callback we are setting up, the plan is to unblock 
	#	the second job.		
	#
	#	to do this we will use the supervisor's api call:
	#		qb::unblock in combination with the 
	#		automatically defined variable $qb::jobid.
	#

	"callbacks" =>  [ #note: the callbacks are setup as a reference to an array of 
			  # callback hashes
		{
			"triggers" => "done-job-first",
			"language" => "perl",
			"code" => '
				print "$qb::jobid running callback\n";
				qb::unblock($qb::jobid);
			'
		}
	]
};

#
#  now we submit the job.
#
#  the supervisor will associcate both jobs into the same process group automatically.
#
for(qb::submit($job_first, $job_second)) {
	print "submitted: ", $_->{id}, "\n";
}







