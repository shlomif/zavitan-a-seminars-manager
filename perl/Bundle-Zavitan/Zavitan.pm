package Bundle::Zavitan;

use strict;
use warnings;

use vars qw($VERSION);

$VERSION = '0.2.1';

1;

__END__

=head1 NAME

Bundle::Zavitan - A bundle to install external CPAN modules used by the
Zavitan Seminars Manager.

=head1 SYNOPSIS


Perl one liner using CPAN.pm:

  perl -MCPAN -e 'install Bundle::Zavitan'

Use of CPAN.pm in interactive mode:

  $> perl -MCPAN -e shell
  cpan> install Bundle::Zavitan
  cpan> quit

Just like the manual installation of perl modules, the user may
need root access during this process to insure write permission
is allowed within the intstallation directory.


=head1 CONTENTS

CGI

Crypt::Blowfish

Data::Dumper

Date::DayOfWeek

Date::Parse

DBI

DBD-Mysql

Math::BigInt

MIME::Base64

Net::SMTP

Time::DaysInMonth

=head1 DESCRIPTION

This bundle installs modules needed by the Zavitan Seminars Manager.

http://developer.berlios.de/projects/semiman/

=head1 AUTHOR

Shlomi Fish E<lt>F<shlomif@vipe.technion.ac.il>E<gt>

=cut
