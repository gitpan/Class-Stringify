# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

use Test;
BEGIN { plan tests => 2 };
use Class::Stringify;

package Object;

use Class::Stringify;
our @ISA = qw(Class::Stringify);

use overload '+' => \&add;

sub new {
	bless [];
}

sub add {
	# do something
}

package main;

# First, make sure objects are stringifying properly
$obj = new Object;
my $test_str = $obj."";

ok( $test_str =~ /^Object\([0-9a-fA-FxX]+\)$/ ); # make sure we get ClassName(hex number)

# Then, make sure that two shared references stringify the same
my $copy = $obj;
my $test_str2 = $copy."";

ok ( $test_str eq $test_str2 );

