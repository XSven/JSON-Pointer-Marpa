use strict;
use warnings;

use Test::More import => [ qw( BAIL_OUT require_ok ) ], tests => 2;
use Test::API import => [ qw( public_ok ) ];

my $class;

BEGIN {
  $class = 'JSON::Pointer::Marpa::Semantics';
  require_ok $class or BAIL_OUT "Cannot load class '$class'!"
}

public_ok $class,
  qw( SLASH TILDE new bail concat array_index_dereferencing next_array_index_dereferencing object_name_dereferencing get_crv set_crv )
