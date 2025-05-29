use strict;
use warnings;

package JSON::Pointer::Marpa::Semantics;

use subs qw( _index_exists _member_exists );

use constant { ## no critic (ProhibitConstantPragma)
  EMPTY => '',
  SLASH => '/',
  TILDE => '~'
};

# This is a rule evaluation closure of a quantified rule
# https://metacpan.org/pod/distribution/Marpa-R2/pod/Semantics.pod#Quantified-rule-nodes
sub new {
  my ( $class, $crv ) = @_;    # crv == currently referenced value

  return bless { crv => $crv }, $class;
}

sub concat {
  shift;
  return join '', @_;
}

sub array_index_dereferencing {
  my ( $self, $index ) = @_;

  my $crv         = $self->get_crv;
  my $type_of_crv = ref $crv;
  if ( $type_of_crv eq 'ARRAY' ) {
    $self->set_crv( _index_exists( $crv, $index ) );
  } elsif ( $type_of_crv eq 'HASH' ) {
    $self->set_crv( _member_exists( $crv, $index ) );
  } else {
    Marpa::R2::Context::bail( "Currently referenced value $crv isn't a JSON object member!" )
  }

  return;
}

sub next_array_index_dereferencing {
  my ( $self, $next_index ) = @_;

  my $crv = $self->get_crv;
  ref $crv eq 'ARRAY'
    ? Marpa::R2::Context::bail( "Handling of '$next_index' array index not implemented!" )
    : $self->set_crv( $crv->{ $next_index } );

  return;
}

sub object_name_dereferencing {
  my ( $self, $name ) = @_;

  my $crv = $self->get_crv;
  return unless defined $crv;
  Marpa::R2::Context::bail( "Currently referenced value $crv isn't a JSON object member!" )
    unless ref $crv eq 'HASH';
  $self->set_crv( $crv->{ $name // '' } );

  return;
}

sub set_crv {
  my ( $self, $crv ) = @_;

  $self->{ crv } = $crv;

  return;
}

sub get_crv {
  my ( $self ) = @_;

  return $self->{ crv };
}

sub _index_exists ($$) {
  my ( $crv, $index ) = @_;

  return (
    $index < @$crv ? $crv->[ $index ] : Marpa::R2::Context::bail(
      "JSON array has been accessed with an index $index that is greater than or equal to the size of the array!"
    )
  );
}

sub _member_exists ($$) {
  my ( $crv, $member ) = @_;

  return (
    exists $crv->{ $member }
    ? $crv->{ $member }
    : Marpa::R2::Context::bail( "JSON object has been accessed with a member $member that does not exist!" )
  );
}

1;
