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
#  This script is an example of how to setup 3 jobs and have them
#	chain execute.
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
		"cmdline" => "sleep 10"
	},

	#
	# this is where the fun begins... we first assign a label to the job.
	# a label is used to identify jobs in the same process group without
	# using the process id's.  If you are thinking about what the 
	# supervisor does if you have the same label in the same process group...
	# it won't happen.  The supervisor enforces unique labels in the same
	# process group upon submission.
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
		"cmdline" => "sleep 10"
	},

	#
	#  because we don't want the job to start right away, we must
	#  submit it as blocked
	#
	"status" => "blocked",
	"label" => "second",

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

	#
	#    This is a slightly more efficent method because it uses Qube's predefined callback
	#
	#
	#	"callbacks" =>  [ #note: the callbacks are setup as a reference to an array of 
	#			  # callback hashes
	#		{
	#			"triggers" => "done-job-first",
	#			"language" => "qube",
	#			"code" => 'unblock-self'
	#		}
	#	]
	#
	#

};


#
#  Next, we setup the hash for the third job.
#

my $job_third = {
	# we'll name the third job.... "third job".
	"name" => "third job",
	
	# set the priority and cluster (not required) 
	"priority" => 10,
	"cluster" => "/",

	# set the job type
	"prototype" => "cmdline",

	# setup the package data specific to the 'cmdline' job type
	"package" => {
		"cmdline" => "sleep 10"
	},

	#
	#  because we don't want the job to start right away, we must
	#  submit it as blocked
	#
	"status" => "blocked",

	#
	# ok... so we've setup the second job's label.  we can now attach a 
	# callback to the third job so that it watches the second job. 
	#
	# all triggers are identified with the following format:
	# 	<status/name>-<type>-<label> 
	#
	# 	complete-job-second
	#
	#	in the callback we are setting up, the plan is to unblock 
	#	the third job.		
	#
	#	to do this we will use the supervisor's api call:
	#		qb::unblock in combination with the 
	#		automatically defined variable $qb::jobid.
	#

	"callbacks" =>  [ #note: the callbacks are setup as a reference to an array of 
			  # callback hashes
		{
			"triggers" => "complete-job-second",
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
#  the supervisor will place the jobs into the same process group automatically.
#
for(qb::submit($job_first, $job_second, $job_third)) {
	print "submitted: ", $_->{id}, "\n";
}







