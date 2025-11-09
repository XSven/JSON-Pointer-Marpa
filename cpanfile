use strict;
use warnings;

on configure => sub {
  requires 'ExtUtils::MakeMaker'           => '6.76';    # Offers the NO_PERLLOCAL, RECURSIVE_TEST_FILES features
  requires 'ExtUtils::MakeMaker::CPANfile' => '0';       # Needs at least ExtUtils::MakeMaker 6.52
  requires 'File::Spec'                    => '0';
  requires 'strict'                        => '0';
  requires 'warnings'                      => '0'
};

on runtime => sub {
  requires 'Carp'        => '1.32';                      # Don't vivify @CARP_NOT and @ISA in caller's namespace
                                                         # https://github.com/jeffreykegler/Marpa--R2/issues/297
                                                         # Question: Too many dependencies?
  requires 'Marpa::R2'   => '0';
  requires 'URI::Escape' => '0';
  requires 'constant'    => '0';
  requires 'strict'      => '0';
  requires 'subs'        => '0';
  requires 'warnings'    => '0'
};

on test => sub {
  requires 'JSON::PP'    => '0';
  requires 'Test::API'   => '0';
  requires 'Test::Fatal' => '0';
  requires 'Test::More' => '1.001005'    # Subtests accept args
}
