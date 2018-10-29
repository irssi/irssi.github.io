#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use IPC::Run 'run';

sub info (@) {
    print STDERR "@_\n";
}

for my $file (@ARGV) {
    info "loading $file...";
    my $fh;
    unless (open $fh, '<', $file) {
	info "..failed: $!";
	next;
    }
    my $c = do { local $/; <$fh> };
    while ($c =~ /^ (\`{3,}) \s? ascidia \s*? $
		  (.*?)
		  ^ \1 \s* 
		  ^\{:(.*?)\}/gsmx) {
	my ($tx, $k) = ($2, $3);
	if ($k =~ /\.repl\b/ && $k =~ /\#(\w+)/) {
	    my $fn = $1;
	    $tx =~ s/^\s*$//m;
	    my $ofn = dirname($file) . "/${fn}.svg";
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
	    $out =~ s{ stroke-width="2\.5" }{ stroke-width="0.7" }gm;
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
