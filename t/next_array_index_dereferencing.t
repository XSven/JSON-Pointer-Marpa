use strict;
use warnings;

use Test::More import => [ qw( BAIL_OUT is is_deeply use_ok ) ], tests => 2;

my $class;

BEGIN {
  $class = 'JSON::Pointer::Marpa';
  use_ok $class or BAIL_OUT "Cannot load class '$class'!";
}

is_deeply $class->get(
  { operators => { '-' => { name => 'minus', type => 'number' }, '.' => { name => 'concat', type => 'string' } } },
  '/operators/-' ),
  { name => 'minus', 'type' => 'number' }, "'/operators/-' is '{ name => 'minus', type => 'number' }'"
