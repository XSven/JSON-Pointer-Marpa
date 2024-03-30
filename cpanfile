use strict;
use warnings;

on 'configure' => sub {
  requires 'App::cpanminus'                => '1.7046';
  requires 'Config'                        => '0';
  requires 'ExtUtils::MakeMaker::CPANfile' => '0';
  requires 'File::Spec'                    => '0';
  requires 'lib'                           => '0';
  requires 'strict'                        => '0';
  requires 'subs'                          => '0';
  requires 'version'                       => '0.9915';
  requires 'warnings'                      => '0';
};

on 'runtime' => sub {
  requires 'Marpa::R2'   => '0';
  requires 'URI::Escape' => '0';
  requires 'strict'      => '0';
  requires 'warnings'    => '0';
};

on 'test' => sub {
  requires 'JSON::PP'    => '0';
  requires 'Test::Fatal' => '0';
  requires 'Test::Needs' => '0';
  requires 'Test::More'  => '0.47';
};

on 'develop' => sub {
  requires 'Devel::Cover'       => '0';
  requires 'Test::Perl::Critic' => '0';
  requires 'Test::Pod'          => '1.26';
  suggests 'App::CPANtoRPM'         => '0';
  suggests 'App::Software::License' => '0';
};
