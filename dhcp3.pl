#!/usr/bin/perl

use strict;
use warnings;

main(@ARGV);

sub main
{
my $file = $ARGV[0];
open (FH, $file);
while (<FH>){
	my ($router, $mac, $relay, $host) = /([a-z]{5}[0-9]{3}).*(MAC:.{12}).*(relay:.{1,3}\..{1,3}\..{1,3}\..{1,3}).*(host:.*$)/g;
	message (join ("\t",$router,$mac,$relay,$host));
#!	my @list = /^.*(MAC:.{12}).*(relay:.{1,2,3}\..{1,2,3}\..{1,2,3}\..{1,2,3}).*(cltip::.{1,2,3}\..{1,2,3}\..{1,2,3}\..{1,2,3}).*(host:.*$)/g;
#!	message (join('   ', @list)) if @list;
#! vicrr030.lan.net.gov.bc.ca 
	}
}

sub message 
{
	my $m = shift or return; 
	print("$m\n");
}