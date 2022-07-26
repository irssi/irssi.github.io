#!/usr/bin/perl
use strict;
use warnings;
use File::Spec;
use FindBin;
use Cwd;

my $src = shift || "$FindBin::Bin/../../irssi";
my $doc = shift || "$FindBin::Bin/../../irssi.github.io";

unless (-f "$src/irssi.conf") {
    die "Irssi sources not found in $src";
}

my $sfn = File::Spec->abs2rel("$doc/sphinx/documentation/settings.md", getcwd);

open my $if, '<', $sfn
    or die "$sfn not found: $!";

my $section;
my %settings;
my %sect_jm;
while (my $line = <$if>) {
    chomp $line;
    if ($line =~ /^##  \[(.*)\]/) {
	$sect_jm{ $section } = $. - 1 if $section;
	$section = $1;
	$sect_jm{ $section } = $. + 1;
    }
    if ($line =~ /^`(\w+)/) {
	$line =~ /^(?:`(.*)`|`(.*)` \*\*`(.*)`\*\*)$/;
	my $setting = defined $1 ? $1 : $2;
	my $value = $3;

	if ($settings{ $setting } ) {
	    warn "$sfn:$.: error: $setting was defined already in $settings{ $setting }[2]";
	}
	$settings{ $setting } = [ $section, $value, $. ];
	$sect_jm{ $section } = $. + 1;
    }
}
my $last_line = $.;
$sect_jm{ irssiproxy } = $last_line;

chomp ( my @sources = `ack --cc --noenv -l 'settings_add_\\w+' \Q$src\E/src` );
unless (@sources) {
    die "Could not find any source files";
}
for my $srcfn (@sources) {
    if (open my $if, '<', $srcfn) {
	my $src = do { local $/; <$if> };
	my @constants = $src =~ m{^#\s*define\s+(.*?)$}gm;
	my %constants = ((
	    COMPLETE_MCASE_AUTO => 2,
	    HELPDIR => '/usr/local/share/irssi/help',
	    PERL_USE_LIB => '/usr/local/perl-582/i386-freebsd',
	    awaylog_file => '~/.irssi/away.log',
	    wcwidth_impl_default => 1,
	    str => 'UTF-8',
	   ),
			 map { my ($k, $v) = split " ", $_, 2; ($k, $v) } @constants
			);
	my @results = $src =~ m{\bsettings_add_(\w+)\s*\(\s*"(.*?)"\s*,\s*"(.*?)"\s*,\s*(.*?)\)}gs;
	while (@results) {
	    my ($type, $cat, $name, $value) = splice @results, 0, 4;
	    my @choice;
	    if ($type eq 'choice') {
		my ($v, $c) = $value =~ /^(.*),\s*"(.*)"\s*$/;
		$value = $v;
		@choice = split ";", $c;
	    }
	    if ($constants{ $value }) {
		$value = $constants{ $value };
	    }
	    if (@choice && $value =~ /^\d+$/) {
		$value = $choice[ $value ];
		if ($value eq 'on' || $value eq 'off') {
		    $value = uc $value;
		}
	    }
	    if ($type eq 'bool') {
		if ($value eq 'TRUE') { $value = "ON"; }
		elsif ($value eq 'FALSE') { $value = "OFF"; }
	    } elsif ($type eq 'size' || $type eq 'str' || $type eq 'time' || $type eq 'level') {
		$value =~ s/^PACKAGE_TARNAME"/"irssi/;
		$value =~ s/^"(.*)"$/$1/;
	    }
	    unless ($settings{ $name }) {
		warn "$sfn:$sect_jm{ $cat }: error: Missing setting: ## [$cat]

($name)=
`$name` **`$value`**

";
		if (@choice) {
		    warn "Available choices: @choice

";
		}
	    } elsif ($settings{ $name }[0] ne $cat) {
		warn "$sfn:$settings{ $name }[2]: error: Wrong category for $name: \[$settings{ $name }[0]] should be \[$cat];\n defined in $srcfn;\n\n";
	    } elsif (($settings{ $name }[1]//'\x01') ne $value && !(($settings{ $name }[1]//'') eq ' ' && $value eq '') && !($value eq 'NULL')) {
		warn "$sfn:$settings{ $name }[2]: error: Wrong default value for $name: **`@{[$settings{ $name }[1]//'']}`** should be **`$value`**;\n defined in $srcfn;\n\n";
	    }
	}
	die "@results" if @results;
    } else {
	warn "Could not open $srcfn: $!";
    }
}

