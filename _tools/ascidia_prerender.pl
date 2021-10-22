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
    while ($c =~ /^ (?<codeblock> (?<indent> >*\s*)\`{3,}) \s? ascidia(?<tag> \S*) \s*? $
		  (?<content> .*?)
		  ^ \g{codeblock} \s*
		  /gsmx) {
	my ($tx, $k, $p) = ($+{content}, $+{tag}, $+{indent});
	if ($k =~ /\.repl\b/ && $k =~ /\#(\w+)/) {
	    my $fn = $1;
	    my $p_s = 0;
	    #$p =~ s/(\s+)$// && ($p_s = length $1);
	    #eval "\$tx =~ s/^\\Q\$p\\E\\s{0,$p_s}//gm";
	    $tx =~ s/^\Q$p\E//gm;
	    $tx =~ s/^\s*$//m;
	    $tx =~ s/\A\n//;
	    $tx =~ s/(.)/$1 . " " x max( 0, mbwidth($1) - 1 )/ge;
	    my $ofn = '_static/' . ($file =~ /\/index\.[^\/]*$/ ? dirname($file) : $file =~ s/\.[^.\/]*?$//r) . "/${fn}.svg";
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
	    $out =~ s{ font-size="10"(?= |>)}{ font-size="13"}gm;
	    $out =~ s{ fill="rgb\(255,255,255\)" fill-opacity="1"}{ fill-opacity="0"}gm;
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
