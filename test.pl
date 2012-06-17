#!/usr/bin/env perl 

use strict;
use warnings;

my $blast= {};
my $fh;

open($fh, '<', $ARGV[0]) or die();
while (my $file = <$fh>) {
    chomp $file;
    my ($query, $db, $indentity, $alinlen, $mis, $gap, $qs, $qe, $ss, $se, $e_value, $bit)
	= split(/\s+/, $file);
    
    $blast->{$query} ||= {};
    $blast->{$query}->{subject}       = $db;
    $blast->{$query}->{identity}      = $indentity;
    $blast->{$query}->{gap}           = $gap;
    $blast->{$query}->{mismatch}      = $mis;
    $blast->{$query}->{query_start}   = $qs;
    $blast->{$query}->{query_end}     = $qe;
    $blast->{$query}->{subject_start} = $ss;
    $blast->{$query}->{subject_end}   = $se;
    $blast->{$query}->{e_value}       = $e_value;
    $blast->{$query}->{bit_score}     = $bit;

}

print Dumper $blast;

