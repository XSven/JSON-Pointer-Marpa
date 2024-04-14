use strict;
use warnings;

package JSON::Pointer::Marpa::Semantics;

use constant { ## no critic (ProhibitConstantPragma)
  EMPTY => '',
  SLASH => '/',
  TILDE => '~'
};

# This is a rule evaluation closure of a quantified rule
# https://metacpan.org/pod/distribution/Marpa-R2/pod/Semantics.pod#Quantified-rule-nodes
sub new {
  my ( $class, $state ) = @_;

  return bless { state => $state }, $class;
}

sub concat {
  shift;
  return join '', @_;
}

sub array_index_dereferencing {
  my ( $self, $index ) = @_;

  return unless defined $self->get_state;

  ref $self->get_state eq 'HASH'
    ? $self->set_state( $self->get_state->{ $index } )
    : $self->set_state( $self->get_state->[ $index ] );

  return;
}

sub next_array_index_dereferencing {
  my ( $self ) = @_;

  Marpa::R2::Context::bail( "Handling of '-' array index not implemented!" );
}

sub object_name_dereferencing {
  my ( $self, $name ) = @_;

  return unless defined $self->get_state;

  $self->set_state( $self->get_state->{ $name // '' } );

  return;
}

sub set_state {
  my ( $self, $value ) = @_;

  $self->{ state } = $value;

  return;
}

sub get_state {
  my ( $self ) = @_;

  return $self->{ state };
}

1;
