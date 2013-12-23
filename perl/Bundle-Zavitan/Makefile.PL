use strict;
use warnings;

use ExtUtils::MakeMaker;
WriteMakefile(
              NAME  => 'Bundle::Zavitan',
              VERSION_FROM => 'Zavitan.pm',
              'dist'       => {
                               COMPRESS => 'gzip -9f',
                               SUFFIX   => '.gz',
                               DIST_DEFAULT => 'all tardist',
                              },
             );
