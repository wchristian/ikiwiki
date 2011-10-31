#!/usr/bin/perl
use warnings;
use strict;
use Test::More;

SKIP: {
    my $t = "HTML::Template::Compiled";
    skip "$t not available", 1 unless use_ok $t;

    my @templates = glob( "templates/*.tmpl" ), glob( "doc/templates/*.mdwn" );

    for my $template ( @templates ) {
        my $obj = eval { $t->new( filename => $template ) };
        ok( !$@,  $template . " $@" );
        ok( $obj, $template );
    }
}

done_testing();
