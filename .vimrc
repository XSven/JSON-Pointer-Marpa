let $PERL5LIB = join( filter( map ( [ 't/lib', 'lib', 'local/lib/perl5' ], { idx, val -> getcwd() . '/' . val } ), {idx, val -> isdirectory( val ) } ), ':' )  . ':' . $PERL5LIB
