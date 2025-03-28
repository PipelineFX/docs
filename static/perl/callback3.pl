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
#  this an example of setting up 2 jobs where the frames and job status are
#  dependent upon each other.
#

use lib "../../api/perl";

use qb;


my $FRAME_RANGE = "1-10";
my $job_first_frames = qb::genframes($FRAME_RANGE);

#
#  First we setup the hash for the first job
#
my $job_first = {
	# we'll name the first job.... "first job".
	"name" => "first job",
	
	# set the priority and cluster (not required) 
	"priority" => 10,
	"cluster" => "/",
	"cpus" => "5",

	# set the job type
	"prototype" => "frame",

	# setup the package data specific to the 'frame' job type
	"package" => {
		"cmdline" => "qbping -sleep 10"
	},

	#
	# assign the frame list to the job
	#
	"agenda" => $job_first_frames,

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

#
#  Before we setup the job hash, we setup the work hashes and then
#  set them to 'blocked'
#
my $job_second_frames = qb::genframes($FRAME_RANGE);
for (@{$job_second_frames}) {
	$_->{"status"} = "blocked"
}

#
#  We run through the list of frames and setup a callback per frame 
#  we must also remember to unblock the job itself. 
#
my $job_second_callbacks = [];
for (@{$job_second_frames}) { 
	my $name = $_->{"name"};
	push @{$job_second_callbacks}, {
			"triggers" => "complete-work-first-$name",
			"language" => "perl",
			"code" => '
				print "$qb::jobid running callback\n";
				qb::workunblock($qb::jobid.":'.$name.'");
				qb::unblock($qb::jobid);
			'
		};
}

my $job_second = {
	# we'll name the second job.... "second job".
	"name" => "second job",
	
	# set the priority and cluster (not required) 
	"priority" => 10,
	"cluster" => "/",
	"cpus" => "10",

	# set the job type
	"prototype" => "frame",

	# setup the package data specific to the 'frame' job type
	"package" => {
		"cmdline" => "sleep 10"
	},

	#
	#  because we don't want the job to start right away, we must
	#  submit it as blocked
	#
	"status" => "blocked",

	#
	# assign the frame list to the job
	#
	"agenda" => $job_second_frames,

	#
	# install callbacks
	#
	"callbacks" => $job_second_callbacks
};

#
#  now we submit the job.
#
#  the supervisor will associate both jobs into the same process group automatically.
#
for(qb::submit($job_first, $job_second)) {
	print "submitted: ", $_->{id}, "\n";
}







