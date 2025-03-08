#!/usr/bin/perl
#
# Qube! - Example Perl Job Log Display
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
#	An example script to show the how to retrive log data through the api 
#


use lib "../../api/perl";
use lib "$ENV{QBDIR}/api/perl";
use lib "$ENV{QB_DIR}/api/perl";
use qb;
use Getopt::Long;

my $help, $status, $user;
my $result = GetOptions(
		"help" => \$help
	);

#  display help for weird options
display_help() if (!$result);
display_help() if ($help);

my @logs = qb::stdout(@ARGV);

# loop through each log, which is a perl HASH, each hash contains the job's id and the data
for (@logs) {
	my $log = $_;
	next if (ref($log) ne "HASH");

	print "=" x 40, "\n";
	print $log->{"jobid"}, ".", $log->{"subid"}, "\n";
	print "=" x 40, "\n";
	print $log->{"data"}, "\n";
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
	qblog.pl - list Qube! logs 

SYNOPSYS
	qblog.pl [options] [jobid(s)]

DESCRIPTION
	qblog.pl  displays a list of currently active logs in the Qube! queueing system software	
	using perl api.


OPTIONS
	The options which qblog accepts manipulate either the list of logs

	DISPLAY
		Switch			Description
		--help			help for qblog
	

AUTHOR
	Anthony Higa - PipelineFX

REPORT BUGS
	support\@pipelinefx.com

COPYRIGHT
	Copyright @ 2007 PipelineFX, LLC.
	All rights reserved.

SEE ALSO
	Qube! 

HELP
exit(0);
}

1;

