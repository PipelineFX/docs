#!/usr/bin/perl
############################################################################
#
#  Copyright: PipelineFX, L.L.C.
#
#  qbhosts.pl
#
#	An example script to show the capabilities of the perl api
#
############################################################################

# columns
my @COLS = qw(name address state cluster groups);

use lib "$ENV{QB_DIR}/api/perl";
use lib "../../api/perl";
use lib "../api/perl";
use qb;
use Getopt::Long;

my $help, $state;
my $result = GetOptions(
		"state" => \$state,
		"help" => \$help,
	);

#  display help for weird options
display_help() if (!$result);
display_help() if ($help);

my $fields = [];
my $filter = {};
$filter->{state} = $state if (length($state));

#  query Qube! - supervisor for the hosts we want
my @hosts = qb::hostinfo($filter);

#  figure out the max col length for all the hosts.
tally_title_lengths();
tally_col_lengths($_) for (@hosts);

#  display the hosts
display_title();
display_host($_) for (@hosts);




############################################################################
#
#  format display 
#
############################################################################

my %cols;
sub tally_title_lengths
{
	for (@COLS) {
		$cols{$_} = length($_);
	}
}

sub tally_col_lengths
{
	my $host = shift;
	for (@COLS) {
		$cols{$_} = $cols{$_} < length($host->{$_}) ? length($host->{$_}) : $cols{$_};
	}
}

sub display_title
{
	my $total = 0;
	for (@COLS) {
		print $_;
		print " " x ($cols{$_} - length($_) + 1);
		$total += $cols{$_} + 1;
	}
	print "\n";
	print "-" x $total, "\n";
}

sub display_host
{
	my $host = shift;
	for (@COLS) {
		print $host->{$_};
		print " " x ($cols{$_} - length($host->{$_}) + 1);
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
HELP
exit(0);
}

1;

