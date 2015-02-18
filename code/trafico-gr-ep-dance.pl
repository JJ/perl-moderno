#!/usr/bin/env perl

use Modern::Perl '2014';
use autodie;

use File::Slurp::Tiny qw(read_file);
use Dancer2 qw(:syntax);

my $data_file = read_file('gr-trafico.json');

my $data = from_json $data_file;

get '/' => sub {
    my @keys = keys %$data;
    return to_json { ciudades => \@keys };
};

get '/trafico/:ciudad' => sub {
    if ( $data->{params->{'ciudad'}} ) {
	return to_json $data->{params->{'ciudad'}};
    } else {
	status 404;
	return halt;
    }
};
 
start;
