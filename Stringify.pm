package Class::Stringify;

use 5.006;
use strict;
use warnings;

require Exporter;
require DynaLoader;

our @ISA = qw(Exporter DynaLoader);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Class::Stringify ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(

) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);
our $VERSION = '0.001';

bootstrap Class::Stringify $VERSION;

# use the XS function as our stringification operator
use overload '""' => \&as_string;

1;
__END__

=head1 NAME

Class::Stringify - Perl extension for default class stringification

=head1 SYNOPSIS

  use Class::Stringify;
  our @ISA = qw(Class::Stringify);

=head1 DESCRIPTION

Class::Stringify offers an easy solution to the problem of default stringification
in classes with operator overloading.  Simply by inheriting from this class, you'll
never have to see this error ever again:

 Operation `""': no method found, argument in overloaded package...

=head1 HISTORY

=over 2

=item *

10/16/01 - Robby Walker - wrote the module, some testing - version 0.001

=back

=head1 TODO

=over 4

=item *

More testing.

=back

=head1 BUGS

I'm not sure how this module will perform with multi-blessed references.

Also, someone needs to make sure that the HvSTASH call in Stringify.xs doesn't cause a memory leak.

=head1 AUTHORS AND COPYRIGHT

Written by Robby Walker ( webmaster@pointwriter.com ) for Point Writer ( http://www.pointwriter.com/ ).

You may redistribute/modify/etc. this module under the same terms as Perl itself.

=cut
