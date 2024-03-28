use strict;
use warnings;

use Config                        qw( %Config );
use ExtUtils::MakeMaker::CPANfile qw( WriteMakefile );

my %WriteMakefileArgs = (
  NAME             => 'JSON::Pointer::Marpa',
  AUTHOR           => 'Sven Willenbuecher <sven.willenbuecher@gmx.de>',
  VERSION_FROM     => 'lib/JSON/Pointer/Marpa.pm',
  ABSTRACT_FROM    => 'lib/JSON/Pointer/Marpa.pod',
  LICENSE          => 'Perl_5',
  MIN_PERL_VERSION => '5.14.4',
  META_MERGE       => {
    'meta-spec' => { version => 2 },
    provides    => {
      'JSON::Pointer::Marpa' => {
        file    => 'lib/JSON/Pointer/Marpa.pm',
        version => 'v1.0.0',
      },
      'JSON::Pointer::Marpa' => {
        file    => 'lib/JSON/Pointer/Marpa/Semantics.pm',
      },
    },
    resources => {
      repository => {
        type => 'git',
        url  => 'git://github.com/XSven/JSON-Pointer-Marpa.git',
        web  => 'https://github.com/XSven/JSON-Pointer-Marpa',
      },
      bugtracker => {
        web => 'https://github.com/XSven/JSON-Pointer-Marpa/issues',
      },
    },
  },
  clean     => { FILES                => 'JSON-Pointer-Marpa-* cover_db' },
  dist      => { COMPRESS             => 'gzip -9f', SUFFIX => 'gz', },
  realclean => { FILES                => 'local' },
  test      => { RECURSIVE_TEST_FILES => 1 },
);

require './maint/AuthorExtensions.pl'
unless ( $Config{ osname } =~ m/\A(?:freebsd|openbsd|solaris)\z/ or exists( $ENV{ MAKELEVEL } ) );

WriteMakefile( %WriteMakefileArgs );
