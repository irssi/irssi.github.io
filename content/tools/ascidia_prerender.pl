#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use IPC::Run 'run';
use Text::CharWidth 'mbwidth';
use List::Util 'max';

sub info (@) {
    print STDERR "@_\n";
}

for my $file (@ARGV) {
    info "loading $file...";
    my $fh;
    unless (open $fh, '<:utf8', $file) {
	info "..failed: $!";
	next;
    }
    my $c = do { local $/; <$fh> };
    while ($c =~ /^ ((>*\s*)\`{3,}) \s? ascidia \s*? $
		  (.*?)
		  ^ \1 \s*
		  ^\2 \{:(.*?)\}/gsmx) {
	my ($tx, $k, $p) = ($3, $4, $2);
	if ($k =~ /\.repl\b/ && $k =~ /\#(\w+)/) {
	    my $fn = $1;
	    my $p_s = 0;
	    $p =~ s/(\s+)$// && ($p_s = length $1);
	    eval "\$tx =~ s/^\\Q\$p\\E\\s{0,$p_s}//gm";
	    $tx =~ s/^\s*$//m;
	    $tx =~ s/(.)/$1 . " " x max( 0, mbwidth($1) - 1 )/ge;
	    my $ofn = ($file =~ /\/index\.[^\/]*$/ ? dirname($file) : $file =~ s/\.[^.\/]*?$//r) . "/${fn}.svg";
	    info ".. found image $fn";
	    my $ac;
	    my @cmd = ('ascidia', '-t', 'svg', '-c', '16');
	    my $out;
	    unless (run \@cmd, \$tx, \$out) {
		info ".. failed to run ascidia: $! $?";
		next;
	    }
	    unless ($out =~ /^<svg/m) {
		info ".. could not find valid image";
		next;
	    }
	    my ($width, $height);
	    if ($out =~ m{<rect.*? width="(.*?)"}) {
		$width = $1;
	    }
	    if ($out =~ m{<rect.*? height="(.*?)"}) {
		$height = $1;
	    }
	    unless ($width && $height) {
		info ".. could not determine image size";
		next;
	    }
	    $out =~ s{<svg }{<svg width="$width" height="$height" };
	    $out =~ s{ stroke-width="2\.5"(?= |>)}{ stroke-width="0.7"}gm;
	    $out =~ s{ font-size="10"(?= |>)}{ font-size="12"}gm;
	    system("mkdir -p ".quotemeta(dirname($ofn)));
	    my $oh;
	    unless (open $oh, '>', $ofn) {
		info ".. failed to open image for output: $!";
		next;
	    }
	    print $oh $out;
	    close $oh;
	}
    }
}
