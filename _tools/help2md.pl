use strict;
use warnings;
use YAML qw(LoadFile DumpFile);
use FindBin;
use List::Util qw(uniq);
use Hash::Util qw(lock_keys);
use version;

my $config_file = "$FindBin::Bin/help2md.yml";
my $config = LoadFile($config_file);

# HTML filter for Irssi syntax colouriser
sub _to_ic { 
    my ($cc, $cg, $type, $on) = @_;
    my $col = @$cg >= 3 ? $cg->[$type] :
        @$cg == 2 && $type > 0 ? $cg->[$type - 1] :
        @$cg == 1 && $type == 1 ? $cg->[0] :
        ''; 
    my $str = '';
    if ($col =~ s/[*]//) {
        $str .= "B";
    }
    if ($col =~ s/[_]//) {
        $str .= "U";
    }
    if (length $col) {
        if ($on) {
            push @$cc, $col;
        }
        else {
            pop @$cc;
            $col = @$cc ? $cc->[-1] : '';
        }
        $str .= "$col";
    }
    if ($on) {
	"<span class=\"syn$str\">"
    }
    else {
	"</span>"
    }
}

sub _html {
    $_[0] =~ s/</&lt;/gr
}

sub _add_syn_colors {
    my $text = shift;
    my $cc = pop // [];
    my $cgroup = shift // [];
    my @next_level = @_;
    $text =~ s{
                  (,?\s*|\|) |
                  (< .*? >) |
                  ((?<!^) [[] (?: [^][]++ | (?R) )* []]) |
                  ([^][\s,|><]+)
          }{
#             defined $1 ? _popcol($cc, $1) :
              defined $1 ? $1 :
                  length $2 ? _to_ic($cc,$cgroup,1,1)._html($2)._to_ic($cc,$cgroup,1,0) :
                  length $3 ? _to_ic($cc,$cgroup,2,1)._add_syn_colors($3, @next_level, [@$cc])._to_ic($cc,$cgroup,2,0) :
                  length $4 ? _to_ic($cc,$cgroup,0,1)._html($4)._to_ic($cc,$cgroup,0,0) : ""
          }gexr;
}

# Multi-version link/suffix generator
sub _get_mv {
    my ($page, $ver) = @_;
    my $multiver_links = '';
    my $ver_suffix = '';
    my @multiver = map { @{ $_->{versions} || [] } } grep { $_->{page} && ($page eq 'index' || $_->{page} eq $page) } @{ $config->{multiversion_pages} || [] };
    if (@multiver) {
	my ($default_ver) = map { $_->{_default_} } grep { $_->{_default_} } @{ $config->{multiversion_pages} || [] };
	@multiver = uniq sort { version->parse("v$a") <=> version->parse("v$b") } ($default_ver, @multiver);
	$multiver_links = join ' - ', map {
	    my $link;
	    my $name = "v$_";
	    my @latest = ($default_ver, (grep { version->parse("v$_") <= version->parse("v$ver") } @multiver));
	    if (version->parse("v$_") == version->parse("v".$latest[-1])) {
		$link = "[ $name ]";
	    }
	    else {
		my $xz = "$_";
		my $suffix = version->parse("v$xz") == version->parse("v$default_ver") ? '' : "_($xz)";
		if ($page eq 'index' && $suffix eq '') {
		    $link = "[ [$name](/documentation/help) ]";
		}
		else {
		    $link = "[ [$name](/documentation/help/$page$suffix) ]";
		}
	    }
	    $link
	} @multiver;
	$ver_suffix = (grep { version->parse("v$_") == version->parse("v$ver") } @multiver) && version->parse("v$ver") != version->parse("v$default_ver") ? "_($ver)" : '';
	$multiver_links = "\n<nav markdown=\"1\">\n$multiver_links\n</nav>\n";
    }
    ($multiver_links, $ver_suffix)
}

sub finish_table {
    my ($out, $state) = @_;
    if ($state->{WORD}) {
	#$PARAM_WORD =~ s/</&lt;/g;
	push @{$state->{table}}, "| $state->{WORD} | @{$state->{INFO}} |\n";
    } elsif (@{$state->{table}||[]}) {
	print $out @{$state->{table}}, "{:.table.kv}\n\n";
	@{$state->{table}} = ();
    }
    $state->{WORD} = '';
    $state->{INFO} = [];
}

# Subcommand page command list filter
sub check_filter {
    my ($string, $page) = @_;
    (!$page->{filter_re} || ("$string " =~ /^\s*$page->{filter_re}/i &&
	(!$page->{filter_not_re} || "$string " !~ /^\s*$page->{filter_not_re}/i)))
}

my $indent_marker = '%|';
my %re = (
    indent_marker => qr/%\|/,
    looks_like_plain_commands => qr/[[:upper:]]+(?: [[:upper:]]+)*/,
    looks_like_single_command => qr/[[:upper:]]+/,
    section_head => qr/%9(.*):%9/,
    bold => qr/%9/,
   );
lock_keys(%re);

sub main {
    my $dir = shift;
    my $out = shift;
    unless ($dir && $out) {
	die "syntax: perl $0 <path> <outpath> [<version>]\n";
    }
    my $ver = shift;
    $ver ||= '';
    $ver =~ s/^v//;

    my @allver = uniq sort { version->parse("v$b") <=> version->parse("v$a") } map { $_->{_default_} ? ($_->{_default_}) : @{ $_->{versions} || [] } } @{ $config->{multiversion_pages} || [] };
    my ($default_ver) = map { $_->{_default_} } grep { $_->{_default_} } @{ $config->{multiversion_pages} || [] };

    $ver = $allver[0] unless $ver;

    system("cd \Q$dir\E; perl utils/syntax.pl");

    chomp (my @help_files = `find \Q$dir\E/docs/help -type f`);
    @help_files = grep !/[~#]$/, grep !/Makefile/, @help_files;

    s{^\Q$dir\E/docs/help(?:/|$)}{} for @help_files;

    @help_files = grep !m{^in(?:/|$)}, @help_files;
    @help_files = grep /./, @help_files;

    unless (@help_files) {
	die "No help found in $dir/docs/help\n";
    }

    chomp(my @syntaxes = `cd \Q$dir\E; find . -name \*.c -exec grep -Hn SYNTAX {} +`);
    my %cmd;
    for my $l (@syntaxes) {
	my @fields = split ":", $l;
	my @command = split " ", $fields[3];
	my $srcfile = $fields[0];
	$srcfile =~ s/^\.\///;
	$cmd{ $command[0] }{ $srcfile } = 1;
    }

    @help_files = sort @help_files;

    system("mkdir -p \Q$out\E/documentation/help");
    my ($multiver_links_main, $ver_suffix_main) = _get_mv('index', $ver);
    my $ver_suffix_title_main = $ver_suffix_main ? " ($ver)" : '';
    my $ver_prefix_main = $ver_suffix_main ? '../' : '';

    # Main help index page
    open my $index, '>', "$out/documentation/help/index${ver_suffix_main}.markdown";
    print $index qq'---
layout: page
title: Help$ver_suffix_title_main
---

These are the `/help` pages of the Irssi on-line help.
{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/tree/master/docs/help/in
- https://github.com/irssi/irssi.github.io/blob/master/_tools/help2md.yml

{% endcomment %}
$multiver_links_main
<div markdown="1" class="helpindex">

';

    my %table_state;
    for (@help_files) {
	my $help_file_name = $_;
	# should this file be split into subcommand pages?
	my (@subcommand_split) = map { @{$_->{pages}} } grep { $_->{command} eq $help_file_name } @{$config->{subcommand_pages} || []};
	open my $sin, '<', "$dir/docs/help/$_";
	chomp (my @tx = <$sin>);
	my @otx = @tx;
	my @sub_pages = ( +{ file => $help_file_name, title => $help_file_name, is_sub_page => undef } );
	while (@sub_pages) {
	    my $page = shift @sub_pages;
	    @tx = @otx;
	    my ($multiver_links, $ver_suffix) = _get_mv($page->{file}, $ver);
	    open my $syn, '>', "$out/documentation/help/$page->{file}${ver_suffix}.markdown";
	    my $ver_suffix_main_link = '';
	    my $ver_suffix_title = '';
	    if ($ver_suffix) {
		$ver_suffix_main_link = "/index$ver_suffix";
		$ver_suffix_title = " ($ver)";
	    }
	    unless ($page->{is_sub_page}) {
		print $index "* [$page->{file}]($ver_prefix_main$page->{file}$ver_suffix)\n";
	    }
	    print $syn qq'---
layout: page
title: "Help: $page->{title}$ver_suffix_title"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/$help_file_name.in
';
	    # List of syntax sources
	    if ($cmd{"\U$help_file_name"}) {
		for (sort keys %{$cmd{"\U$help_file_name"}}) {
		    print $syn "- https://github.com/irssi/irssi/blob/master/$_\n";
		}
	    }
	    print $syn qq'

{% endcomment %}
<nav markdown="1">
[Help index](/documentation/help$ver_suffix_main_link)
</nav>
';

	    if ($page->{is_sub_page}) {
		print $syn "\n<nav markdown=\"1\">\n[\u$help_file_name subcommands index](/documentation/help/$help_file_name$ver_suffix)\n</nav>\n$multiver_links";
	    }
	    elsif (@subcommand_split) { # main help page of a page with sub pages
		# find valid subpages
		my @all_commands;
		my %commands_seen;
		for (@tx) {
		    if (/^%9Syntax:/) {
			# continue
		    }
		    elsif (/^%9/) {
			# next block after Syntax
			last;
		    }
		    if (s/$re{indent_marker}// || /^$re{looks_like_plain_commands}$/) {
			my $command;
			for (split ' ') {
			    if (/^$re{looks_like_single_command}$/) { # uppercase letters
				$command .= "\L$_ ";
			    }
			    else {
				# flags, arguments, etc.
				last;
			    }
			}
			push @all_commands, $command;
		    }
		}
		print $syn "$multiver_links\n### Subcommands\n\n";
		for (@subcommand_split) {
		    my ($sub_page_name, $title, $commands, $not_commands) = @{$_}{qw(name title commands excludes)};
		    my @sub_page_commands;
		    if ($commands) {
			my $re = join '|', map { quotemeta "$help_file_name $_ " } sort { length $b <=> length $a } sort @$commands;
			@sub_page_commands = grep /^($re)/, @all_commands;
		    }
		    else {
			# all left-over commands of this help file
			@sub_page_commands = grep !$commands_seen{$_}, grep /^\Q$help_file_name /, @all_commands;
		    }
		    my $not;
		    if ($not_commands) {
			# remove excluded subcommands
			$not = join '|', map { quotemeta "$help_file_name $_ " } sort { length $b <=> length $a } sort @$not_commands;
			@sub_page_commands = grep !/^($not)/, @sub_page_commands;
		    }
		    if (@sub_page_commands) {
			my ($multiver_links, $ver_suffix) = _get_mv("${help_file_name}_${sub_page_name}", $ver);
			print $syn qq'
#### [$title](/documentation/help/${help_file_name}_${sub_page_name}$ver_suffix)

<div markdown="1" class="helpindex">

'; #
			for (@sub_page_commands) {
			    print $syn "* $_\n";
			}
			print $syn '
</div>
';
			my $sub_page_commands_re = join '|', map { quotemeta } @sub_page_commands;
			$title = "$help_file_name: $title" unless $title =~ /^\Q$help_file_name\E\b/i;
			push @sub_pages, +{ file => "${help_file_name}_${sub_page_name}", title => $title, filter => \@sub_page_commands, filter_re => $sub_page_commands_re, filter_not_re => $not, is_sub_page => 1 };
			@commands_seen{@sub_page_commands} = (1) x @sub_page_commands;
		    }
		}
		my $all_re = join '|', map { quotemeta } sort { length $b <=> length $a } sort keys %commands_seen;
		$page->{filter_re} = $page->{filter_not_re} = $all_re;
		@tx = @otx;
	    }
	    elsif ($multiver_links) {
		# Links to other versions of this help page
		print $syn $multiver_links;
	    }
	    my $in = 'syn';
	    for (@tx) {
		if (/^$re{bold}Syntax:/) {
		    $in = 'syn';

		    next
			if @subcommand_split && !$page->{is_sub_page};

		}
		elsif (/^$re{bold}Parameters:/) {
		    $in = 'param';
		}
		elsif (/^$re{bold}References:/) {
		    finish_table($syn, \%table_state);
		    $in = 'refs';
		}
		elsif (/^$re{bold}/) {
		    finish_table($syn, \%table_state);
		    $in = '';
		}
		s/^$re{section_head}$/### $1 ###/;
		if (/^$re{bold}(See also):$re{bold} (.*)$/i) {
		    my $res = "### $1 ###
";
		    my @see_also = split " ", $2;
		    s/,$// for @see_also;
		    for (@see_also) {
			my (undef, $ver_suffix1) = _get_mv("\L$_", $ver);
			my (undef, $ver_suffix2) = _get_mv($page->{file}, $ver);
			my $ver_suffix = $ver_suffix1 eq $ver_suffix2 ? $ver_suffix2 : '';
			$_ = "[$_](/documentation/help/\L$_\E$ver_suffix)";
		    }
		    $_ = $res . join ", ", @see_also;
		}
		# deindent textual paragraphs (try to keep examples)
		s/^    ([[:alpha:]] ?[[:lower:]].*)$/$1/ ||
		    s/^        ([* ] [[:alpha:]] ?[[:lower:]].*)$/$1/;

		my $cmdlen = -1 + index $_, $indent_marker;
		if ($in eq 'syn' && (s/$re{indent_marker}// || /^$re{looks_like_plain_commands}$/)) {
		    next
			if !check_filter("$_ ", $page);

		    $_ = qq'<div class="highlight irssisyntax"><pre style="--cmdlen:${cmdlen}ch"><code>'
			._add_syn_colors($_, ["*", "*05", "10"], ["09", "14"], ["*", "13", "13"], ["14"], [])
			. "</code></pre></div>\n\n";
		}
		elsif ($in eq 'param'
		       # detect tables with key lengths of 12-13 and column space of 4 (levels, modes)
		       || /^        .............?    /
		       # detect tables with key lengths of 2 and column space of 4 (stats, who)
		       || /^        ..    /
		      ) {
		    if (/^\s{8}\s+(\S.*)$/) {
			# continuation
			$_ = $1;
			s/$re{indent_marker}//;
		    }
		    elsif (/^\s+\S/) {
			my ($word, $rest);
			if (-1 != index $_, $indent_marker) {
			    ($word, $rest) = split /$re{indent_marker}/, $_, 2;
			}
			elsif (-1 != index $_, ':') {
			    ($word, $rest) = split /:/, $_, 2;
			    $word .= ':';
			}
			elsif (/^\s+(\S+)\s{2,}(.*)$/) { # column space >= 2
			    ($word, $rest) = ($1, $2);
			}
			elsif (/^\s+(-?<[^>]+>)\s+(.*)$/) { # <placeholder> or -<placeholder>
			    ($word, $rest) = ($1, $2);
			} else {
			    finish_table($syn, \%table_state);
			}
			if ($word) {
			    $word =~ s/^\s+//;
			    $word =~ s/\s+$//;
			}

			if ($page->{filter_re} && $word =~ /^$re{looks_like_plain_commands}:?$/) {
			    my $checkword = "$help_file_name $word";
			    $checkword =~ s/:$//;
			    $checkword .= " ";

			    next
				if !check_filter($checkword, $page);
			}

			if ($word) {
			    $word = "`$word`";
			    $word =~ s/:`/`:/;
			    $_ = $rest;
			    finish_table($syn, \%table_state);
			    $table_state{WORD} = $word;
			}
			else {
			    finish_table($syn, \%table_state);
			    s/$re{indent_marker}//;
			}
		    }
		    else {
			finish_table($syn, \%table_state);
		    }
		}
		else {
		    finish_table($syn, \%table_state);
		    s/</&lt;/g;
		}

		unless (/^ {4}/ && $in ne 'param') {
		    # disable markdown smartypants on command line flags
		    s/(?:\W|^)\K-(-\w+)/\\-\\$1/g;

		    # disable markdown floats on alternations
		    s/(\[[^]]+\])/$1 =~ s:\|:\\|:gr/ge
			unless $in eq 'syn';
		    s/(\w)\|(\w)/$1\\|$2/g;
		    #s/>\|</>\\|</g
		    #    if $in eq 'syn';

		    # disable markdown italics on host masks
		    s/\*([!@].*?)\*/\\*$1\\*/g;

		    # disable markdown __ bold
		    s/__/\\_\\_/g;
		    # text monospace to markdown
		    s/``((?:[^`']|`[^`]|'[^'])*)''/``$1``/g;
		    s/`([^`']*)'/`$1`/g;

		    # simple bold -> markdown bold
		    s/(?<!\\)\*(\S.*?)(?<!\\)\*/**$1**/g;

		}

		if ($in eq 'refs') {
		    # hyperlinks
		    s{(\w+://\S+)}{[$1]($1)}g;
		    $_ .= "\n";
		}

		# irssi escapes
		s/%%/%/g;

		if ($in eq '' && /^ {4}/ && $page->{filter_re} && $page->{is_sub_page}) {
		    if (/^ {4}\/(\Q$help_file_name\E .*)/i) {
			# filter examples on sub pages
			next if !check_filter("$1 ", $page);
		    }
		}

		if ($table_state{WORD}) {
		    # delay printing to finish_table()
		    push @{$table_state{INFO}}, $_;
		}
		else {
		    # non-tabular line
		    print $syn "$_\n";
		}
	    }
	    #print $syn "```\n",(join "\n", @otx),"\n```\n";
	}
    }
    my %help_file_seen;
    # create category sections on the main help index
    for my $cat (@{$config->{categories}}) {
	print $index qq'

### $cat->{category}

<div markdown="1" class="helpindex">

';

	for (@help_files) {
	    my $cmd = "\U$_";
	    my $srcf = $cmd{$cmd};
	    if ($cat->{excludes} && grep { $cmd eq $_ } @{$cat->{excludes}}) {
		next;
	    }
	    my $found;
	    if ($cat->{paths}) {
		for my $sea (@{$cat->{paths}}) {
		    $found = grep { $_ =~ $sea } keys %$srcf;
		    last if $found;
		}
	    }
	    else {
		# the category without paths will collect any unseen help file
		$found = !$help_file_seen{$_};
	    }
	    next unless $found;
	    $help_file_seen{$_} = 1;
	    my ($multiver_links, $ver_suffix) = _get_mv($_, $ver);
	    print $index "* [$_]($ver_prefix_main$_$ver_suffix)\n";
	}
	print $index '

</div>
';
    }
}

main(@ARGV);

#print "$_\n" for @help_files;
