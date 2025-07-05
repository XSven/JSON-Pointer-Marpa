use strict;
use warnings;

use File::Spec::Functions qw( catfile rel2abs );

# load standard dependencies file (do not change this file!)
require &rel2abs( catfile( qw( maint cpanfile ) ) );

on configure => sub { };

on runtime => sub {
  requires 'Marpa::R2'   => '0';
  requires 'URI::Escape' => '0';
  requires 'constant'    => '0';
  requires 'subs'        => '0'
};

on test => sub {
  requires 'JSON::PP' => '0'
};

on develop => sub { }
