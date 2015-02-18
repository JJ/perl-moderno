#!/usr/bin/env perl

use Modern::Perl '2014';
use autodie;

use File::Slurp::Tiny qw(read_file);
use Dancer2;
use JSON;

my $data_file = read_file('gr-trafico.json');

my $data = decode_json $data_file;

get '/' => sub {
    my $keys = keys %$data;
    return encode_json { ciudades => $keys };
};

get 'trafico/:ciudad' => sub {
    if ( $data->{$params->{'ciudad'}} ) {
	return encode_json $data->{$params->{'ciudad'}};
    } else {
	status 404;
	return halt;
    }
}
 
start;
