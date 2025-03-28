#!/usr/bin/perl
#
#  This script is an example of how to setup subjob- and work-level e-mail
#

use lib "$ENV{QBDIR}/api/perl";
use lib "$ENV{QB_DIR}/api/perl";
use qb;

#
#  setup the hash for the job
#
my $FRAME_RANGE = "1-3";
my $frames = qb::genframes($FRAME_RANGE);
my $job = {
	"name" => "test job",
	# set the job type
	"prototype" => "cmdrange",
	"package" => {
		"cmdline" => "echo QB_FRAME_NUMBER; sleep 10"
	},
    # note: callbacks are setup as a reference to an array of callback hashes
	"callbacks" =>  [
		{
			"triggers" => "done-work-self-*",
			"language" => "mail",
			"code" => ""
		}
	],
	"agenda" => $frames,
};

#  now we submit the job.
for(qb::submit($job)) {
	print "submitted: ", $_->{id}, "\n";
}







