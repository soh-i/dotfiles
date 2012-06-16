#!/usr/bin/env perl 

use strict;
use warnings;

use Data::Dumper;

## Hash of hash ## 

my ($query, $db, $indentity, $alinlen, $mis, $gap, $qs, $qe, $ss, $se, $e_value, $bit);
my $blast= {};
my $fh;

open($fh, '<', $ARGV[0]) or die();
while (my $file = <$fh>) {
    chomp $file;
    ($query, $db, $indentity, $alinlen, $mis, $gap, $qs, $qe, $ss, $se, $e_value, $bit)
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


__END__


#print Dumper $blast;
print $blast->{'lcl|Supercontig2-snap.639'}->{bit_score};


__END__
foreach my $data (sort keys %$blast ) {
    print $data, "{\n";
    foreach my $name ( sort keys %{$blast->{$data}} ) {
	my $value = $blast->{$data}{$name};
	print $name, ":", "$value", "\n";
    }
}


__END__

