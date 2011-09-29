#!/usr/bin/perl

use strict;
use warnings;

main(@ARGV);



sub main
{
	my %records = ();
	my $file = $ARGV[0];
	message ("Reading File $file");
	%records = extract ($file);
	for (keys %records)
    {
        message(%records);
    }
}

sub message 
{
	my $m = shift or return; 
	print("$m\n");
}

sub extract
	{
	my $filename = $_[0];
	my %myHash = ();
	message ("passed $filename");
	open (FH, $filename);
	while (<FH>){
		my ( $router, $mac, $relay, $host) = /([a-z]{5}[0-9]{3}).*(MAC:.{12}).*(relay:.{1,3}\..{1,3}\..{1,3}\..{1,3}).*(host:.*$)/g;
		push @{ $myHash
		router =>  $router,
		mac => $mac,
		relay => $relay,
		host =>  $host
		}
		return $myHash;
		message (join("\t",$router,$mac,$relay,$host));
	}
}
	