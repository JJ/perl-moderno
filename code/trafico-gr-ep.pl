#!/usr/bin/env perl

use Modern::Perl;
use autodie;

use LWP::Simple;
use Mojo::DOM;

my $url = "http://www.europapress.es/trafico/";

my $dom = Mojo::DOM->new( get $url );

my $estados_granada = $dom->find("table#tblTrafico tr")->grep(qr/Granada/i);

for my $estado (@$estados_granada ) {
  say "-> "
    , $estado->at("td.lugar")->text
    , " - ".$estado->find("td img")->map(attr =>'alt')->join(" | " );
}
