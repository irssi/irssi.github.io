#!/usr/bin/perl

# Env variables:
#   GITHUB - Disable Github links (for use on Github releases page)
#   VER    - show this version only
#   ONLINE - Download release asset links from Github
#   ...

use strict;
use warnings;
use version;
use POSIX qw(ceil);
use JSON::PP;
use CPAN::Meta::YAML qw(LoadFile DumpFile);
#use YAML::Tiny qw(LoadFile DumpFile);
use FindBin;

my $artef_extra = {};
my $artef_extra_file = "$FindBin::Bin/../_data/relnews_artef.yml";
unless (-d "$FindBin::Bin/../_data") {
    $artef_extra_file = ".relnews_artef.yml";
}
if (-f $artef_extra_file) {
    $artef_extra = LoadFile($artef_extra_file);
}

chomp ( my @news = <> );


for (@news) {
    my $tw = 8;
    1 while s|^(.*?)\t|$1 .
	(" " x (ceil((length($1)+1)/$tw)*$tw - length($1)))|em;
    # s/^(\t+)/" " x (8 * length $1)/ge;
}

my %S; # state
my %E;

sub finish_E {
    $E{text} =~ s/\n+\Z//;
    push @{ $S{ $E{type} || "?" } }, $E{text};
    %E = ();
}

my @sections = ('!', '*', '+', '-', '?');

my %section_title = (
    '*' => 'Changes',
    '+' => 'Additions',
    '-' => 'Fixes',
   );

my %link_type = (
    '#'		=> 'https://github.com/irssi/irssi/issues/',
    'GL#'	=> 'https://gitlab.com/irssi/irssi/issues/',
    'GL!'	=> 'https://gitlab.com/irssi/irssi/merge_requests/',
    'FS#'	=> 'http://bugs.irssi.org/?do=details&task_id=',
    'bdo#'	=> 'https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=',
    'bgo#'      => 'https://bugzilla.gnome.org/show_bug.cgi?id=',
    'oss-fuzz#' => 'https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=',
   );

sub issue_links {
    my $keywords = join '|', map { quotemeta } sort { length $b <=> length $a } keys %link_type;
    my $ver = $S{ver}; $ver =~ s/-.*//;
    # rewrite old Bug references to bugs.irssi.org
    if (qv("v$ver") < qv("v0.8.17")) {
	s{(?<!\w)
	  (?<!(?i)Github\sPR\s)
	  (?<!(?i)Release\s)
	  (?:
	      (\#)(\d+)    |
	      (Bug\s)(\d+) |
	      (FS)(\d+)    |
	      (Bugs\s)(\d+)\sand\s(\d+)
	  )(?!\w)
         }{
	     if (defined $1) {
		 "FS$1$2"
	     }
	     elsif (defined $3) {
		 "$3 FS#$4"
	     }
	     elsif (defined $5) {
		 "$5#$6"
	     }
	     elsif (defined $7) {
		 "$7 FS#$8 and FS#$9"
	     }
	 }gex
	     for @_;
    }
    local $link_type{'#'} if $ENV{GITHUB};
    s{(?<!\w)
      (?<!(?i)Release\s)
      ($keywords)(\d+)
      (?!\w)
    }{
	if (defined $link_type{$1}) {
	    "[$1$2]($link_type{$1}$2)"
	}
	else {
	    "$1$2"
	}
    }gex
	for @_;
    s{\b(\w+/\w+)\s+commit\s+([[:xdigit:]]{9,40})\b}{"[$1\@`@{[ substr $2, 0, 9 ]}`](https://github.com/$1/commit/$2)"}ge for @_;
}

sub finish_S {
    if (%E) {
	finish_E();
    }

    if (%S && $ENV{VER} && $S{ver} ne $ENV{VER} && "v$S{ver}" ne $ENV{VER}) {
	%S = ();
	return;
    }

    unless ($ENV{VER}) {
	print "## $S{ver}\n";
	print "{:#v@{[ $S{ver} =~ s/[.]/-/gr ]} }\n"
	    unless $ENV{GITHUB};
	print "\n";
    }

    # Not yet released
    unless ($S{date} =~ /xx/ || $ENV{GITHUB}) {
	print qq{$S{author} released this <abbr class="timeago" title="$S{date}">$S{date}</abbr> @{[ $S{info} ? "▪ $S{info}" : "" ]}\n\n};
	my $org = 'irssi';
	my $type = 'xz';
	my $sig = 'asc';
	my $no_gz_sig;
	my $ver = $S{ver}; $ver =~ s/-.*//;
	if (qv("v$ver") < qv("v0.8.18")) {
	    $org = 'irssi-import';
	    $type = 'bz2';
	    $sig = 'sig';
	}
	if (qv("v$ver") == qv("v0.8.13")) {
	    $no_gz_sig = 1;
	}
	if (qv("v$ver") > qv("v0.8.5")) {
	    my @rg;
	    @rg = (+{
		a => +{
		    url => "https://github.com/$org/irssi/releases/download/$S{ver}/irssi-$S{ver}.tar.$type",
		    name => "irssi-$S{ver}.tar.$type",
		},
		sig => +{
		    url => "https://github.com/$org/irssi/releases/download/$S{ver}/irssi-$S{ver}.tar.$type.$sig",
		    name => "signature.$sig",
		},
	    }, +{
		a => +{
		    url => "https://github.com/$org/irssi/releases/download/$S{ver}/irssi-$S{ver}.tar.gz",
		    name => "irssi-$S{ver}.tar.gz",
		},
		( $no_gz_sig ? () : (
		    sig => +{
			url => "https://github.com/$org/irssi/releases/download/$S{ver}/irssi-$S{ver}.tar.gz.$sig",
			name => "signature.$sig",
		    },
		   )),
	    });
	    delete $artef_extra->{"v$S{ver}"}{rg};
	    $artef_extra->{"v$S{ver}"}{artef_rg} = \@rg;
	    DumpFile($artef_extra_file, $artef_extra);

	    if ($ENV{ONLINE}) {
		my $mod_header = "";
		print STDERR "ref: $S{ver}";
		if ($artef_extra->{"v$S{ver}"} && $artef_extra->{"v$S{ver}"}{last_modified}) {
		    my $mod = $artef_extra->{"v$S{ver}"}{last_modified};
		    $mod_header = "-H 'If-Modified-Since: $mod'";
		    print STDERR " / $mod";
		}
		print STDERR "\n";
		my $info = `curl -Ssfi $mod_header "https://api.github.com/repos/$org/irssi/releases/tags/$S{ver}"`;
		if ($? == -1) {
		    die "failed to run curl: $!\n";
		}
		elsif ($?) {
		    my $exit = $? >> 8;
		    if ($exit == 22) {
			# ignore, includes 404 and 403
		    }
		    else {
			die "curl failed: exit ".($? >> 8)."\n";
		    }
		}
		my ($header, %header, $http_code);
		($header, $info) = split /(?:\r?\n){2}/, $info, 2;
		for my $h (split /\r?\n/, $header) {
		    if ($h =~ /: /) {
			my ($n, $v) = split /: /, $h, 2;
			$n = lc $n;
			$n =~ s/-/_/g;
			$header{$n} = $v;
		    }
		    elsif (/^http/i) {
			my ($ver, $code, $txt) = split ' ', $h, 3;
			$http_code = $code;
		    }
		}
		if ($header{last_modified}) {
		    $artef_extra->{"v$S{ver}"}{last_modified} = $header{last_modified};
		}
		if ($info) {
		    #warn "<<$info>>";
		    my $info_ref = decode_json $info;
		    my @new_info;
		    for my $asset (@{$info_ref->{assets}}) {
			my $url = $asset->{browser_download_url};
			my $name = $asset->{name};
			next if $name =~ /^irssi-\Q$S{ver}\E\.tar\.(gz|bz2|xz)(\.(asc|sig))?$/;
			next if $name =~ /^ZZZZ/;
			next if $name =~ /\.sig\.sig$/;
			push @new_info, +{ name => $name, url => $url };
		    }
		    if (@new_info) {
			$artef_extra->{"v$S{ver}"}{artef_extra} = \@new_info;
		    }
		    else {
			delete $artef_extra->{"v$S{ver}"}{artef_extra};
		    }
		}
		DumpFile($artef_extra_file, $artef_extra);
	    }
	    print qq@{% include relnews_artef_block.markdown ver="$S{ver}" %}@;
	    print "\n\n";
	}
    } elsif ($S{ver} =~ /-head$/ && !$ENV{GITHUB}) {
	print qq{<span class="glyphicon glyphicon-download-alt"></span> `git clone https://github.com/irssi/irssi`\n\n[Commit log](https://github.com/irssi/irssi/commits)\n\n};
    }

    for my $section (@sections) {
	my @e = @{ (delete $S{$section} || [] )};
	next unless @e;
	print "### $section_title{$section}\n\n"
	    if defined $section_title{$section};
	for my $e (@e) {
	    my @lines = split "\n", $e;
	    s/</&lt;/g for @lines;

	    # disable markdown smartypants on command line flags
	    s/(?:\W|^)\K-(-\w+)/\\-\\$1/g for @lines;

	    # disable markdown floats on alternations
	    s/(\[[^]]+\])/$1 =~ s:\|:\\|:gr/ge for @lines;
	    s/(\w)\|(\w)/$1\\|$2/g for @lines;

	    # disable markdown italics on host masks
	    s/\*([!@].*?)\*/\\*$1\\*/g for @lines;

	    # disable markdown __ bold
	    s/__/\\_\\_/g for @lines;
	    s/``((?:[^`']|`[^`]|'[^'])*)''/``$1``/g for @lines;
	    s/`([^`']*)'/`$1`/g for @lines;

	    # simple bold -> markdown bold
	    s/(?<!\\)\*(\S.*?)(?<!\\)\*/**$1**/g for @lines;

	    # stop mentions
	    if ($ENV{GITHUB}) {
		s/(?:\s|^)\K@(?=\w)/\@&zwj;/g for @lines;
	    }

	    issue_links($_) for @lines;
	    if (defined $section_title{$section} || @e > 1) {
		$_ = "  $_" for @lines[1..$#lines];
		$_ = "- $_" for $lines[0];
	    }
	    else {
		# bold first word on single item
		$lines[0] =~ s/^(\w+)([:.])/**$1**$2/;
	    }
	    print join "\n", @lines;
	    print "\n";
	}
	print "\n";
    }

    delete @S{'ver', 'author', 'date', 'info', 'mail'};
    for (sort keys %S) {
	print "___ $_ => $S{$_}\n"
    }
    %S = ();
}

my $l = 1;
for (@news) {
    if (/^v/) {
	if (%S) {
	    finish_S();
	    print "---\n\n" unless $ENV{VER};
	}
	my ($ver, $date, @oth) = split " ";
	my $oth = "@oth";
	$oth =~ /^(.[^<]*)(?:\s+<([^>]*)>(?:\s+(.*))?)?$/;
	my ($author, $mail, $info) = ($1, $2, $3);
	$ver =~ s/^v//;
	%S = (ver => $ver, date => $date, author => $author, mail => $mail, info => $info);
    }
    elsif (/^(?| {8}(\S)| {4,8}(!){1,3})\s(.*)$/) {
	my ($type) = ($1);
	if ($type eq '!' && %E && $E{type} eq $type) {
	    # ignore
	}
	else {
	    if (%E) {
		finish_E();
	    }
	    %E = (type => $type);
	}
	if (length $E{text} && $E{text} !~ /\s\Z/) {
	    $E{text} .= ' ';
	}
	$E{text} .= $2;
    }
    elsif (/^ {10}/) {
	warn "no type of E on line $l: $_\n" unless defined $E{type};
	if (/^ {10}\s/) {
	    $E{text} .= "\n";
	} elsif (length $E{text} && $E{text} !~ /\s\Z/) {
	    $E{text} .= ' ';
	}

	$E{text} .= substr $_, 10;
    }
    elsif (/^\s*$/) {
	if (%E && $E{type} eq '!') {
	    finish_E();
	    %E = ();
	}
	if (%E) {
	    $E{text} .= "\n\n";
	}
    }
    else {
	warn "unrecognised line $l: $_\n";
    }++$l;
}

if (%S) {
    finish_S();
}
