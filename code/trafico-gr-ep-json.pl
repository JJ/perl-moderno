#!/usr/bin/env perl

use Modern::Perl;
use autodie;

use LWP::Simple;
use Mojo::DOM;
use JSON;

my $url = "http://www.europapress.es/trafico/";

my $dom = Mojo::DOM->new( get $url );

my $estados_granada = $dom->find("table#tblTrafico tr")->grep(qr/Granada/i);

my %estados;
for my $estado (@$estados_granada ) {
    push @{$estados{$estado->at("td.lugar")->text}}
    , [$estado->at("td.fecha_tr")->text
       , $estado->find("td img")->map(attr =>'alt')->join(" | " )];
}
say encode_json %estados;
