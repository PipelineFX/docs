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
#  This script is an example of how to submit a global callback
#

#
#  Note: if you get a zero length return, it's probably because your account is not
#  administrative
#


use lib "../../api/perl";
use lib "$ENV{QB_DIR}/api/perl";
use lib "$ENV{QBDIR}/api/perl";

use qb;

my $callback = {
			"triggers" => "globaltime-10000",
			"language" => "perl",
			"code" => '
				print "running time callback\n" x 100;
			'
		};

#
#  now we submit the global callback.
#
#  the supervisor will associate both jobs into the same process group automatically.
#

my @result = qb::submitcallback($callback);

if (@result == 0) {
	print "no callbacks submitted... are you an admin?\n";
	exit(1);
}

for(@result) {
	print "submitted: ", $_->{"triggers"}, "\n";
}







