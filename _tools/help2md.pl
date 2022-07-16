use strict;
use warnings;
use YAML qw(LoadFile DumpFile);
use FindBin;
use List::Util qw(uniq);
use Hash::Util qw(lock_keys);

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

sub finish_table {
    my ($out, $state) = @_;
    if ($state->{WORD}) {
	#$PARAM_WORD =~ s/</&lt;/g;
	push @{$state->{table}}, "| $state->{WORD} | @{$state->{INFO}} |\n";
    } elsif (@{$state->{table}||[]}) {
	print $out "| | |\n| --- | --- |\n", @{$state->{table}}, "\n";
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
	die "syntax: perl $0 <path> <outpath>\n";
    }
    system("cd \Q$dir\E; perl utils/syntax.pl");

    chomp (my @help_files = `find \Q$dir\E/docs/help -type f`);
    @help_files =
	grep !/[~#]$/,
	grep !/Makefile/,
	grep !/meson\.build/,
	@help_files;

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

    # Main help index page
    open my $index, '>', "$out/documentation/help/index.md";
    print $index qq'# Help

These are the `/help` pages of the Irssi on-line help.

<!-- comment

Please submit changes to
- https://github.com/irssi/irssi/tree/master/docs/help/in
- https://github.com/irssi/irssi.github.io/blob/main/_tools/help2md.yml

endcomment -->

:::{toctree}
:maxdepth: 1
:hidden:

';

    my %table_state;
    my %short_descs;
    for (@help_files) {
	my $help_file_name = $_;

	# should this file be split into subcommand pages?
	my (@subcommand_split) = map {
	    @{$_->{pages}}
	} grep {
	    $_->{command} eq $help_file_name
	} @{$config->{subcommand_pages} || []};

	open my $sin, '<', "$dir/docs/help/$_";
	chomp (my @tx = <$sin>);
	my @otx = @tx;
	my @sub_pages = (
	    +{
		file => $help_file_name,
		title => $help_file_name,
		is_sub_page => undef
	    } );

	while (@sub_pages) {
	    my $page = shift @sub_pages;
	    @tx = @otx;
	    open my $syn, '>', "$out/documentation/help/$page->{file}.md";
	    unless ($page->{is_sub_page}) {
		#print $index "$page->{file}\n";
	    }
	    print $syn qq'# $page->{title}

<!-- comment

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

endcomment -->

';
	    if ($page->{file} eq 'bind') {
		print $syn q'
:::{toctree}
:maxdepth: 1
:hidden:

bind_-list

:::
';
	    }

	    if ($page->{is_sub_page}) {
		#print $syn "\n<nav markdown=\"1\">\n\n[\u$help_file_name subcommands index](/documentation/help/$help_file_name)\n\n</nav>\n";
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
		print $syn "\n## Subcommands\n\n";
		for (@subcommand_split) {
		    my ($sub_page_name, $title, $commands, $not_commands)
			= @{$_}{qw(name title commands excludes)};
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
		    my @toctree;
		    if (@sub_page_commands) {
			my $toctitle = $title;
			$toctitle =~ s{^window(?:/split window)? |(?<=^split )window }{}
			    or $toctitle =~ s{^(\Q$help_file_name\E) }{};
			push @toctree, "$toctitle <${help_file_name}_${sub_page_name}>";
			print $syn qq'
### [$title](/documentation/help/${help_file_name}_${sub_page_name})

<div markdown="1" class="helpindex sub">

'; #
			for (@sub_page_commands) {
			    print $syn "* $_\n";
			}
			print $syn '
</div>
';
			my $sub_page_commands_re = join '|', map { quotemeta } @sub_page_commands;
			$title = "$help_file_name: $title" unless $title =~ /^\Q$help_file_name\E\b/i;
			push @sub_pages, +{
			    file => "${help_file_name}_${sub_page_name}",
			    title => $title,
			    filter => \@sub_page_commands,
			    filter_re => $sub_page_commands_re,
			    filter_not_re => $not,
			    is_sub_page => 1
			};
			@commands_seen{@sub_page_commands} = (1) x @sub_page_commands;
		    }
		    if (@toctree) {
			print $syn qq'
:::{toctree}
:maxdepth: 1
:hidden:

@{[join "\n", @toctree]}

:::
';
		    }
		}
		my $all_re = join '|', map { quotemeta } sort { length $b <=> length $a } sort keys %commands_seen;
		$page->{filter_re} = $page->{filter_not_re} = $all_re;
		@tx = @otx;
	    }
	    my $in = 'syn';
	    my $in_section = '';
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
		if (s/^$re{section_head}$/## $1 ##/) {
		    $in_section = $1;
		}
		if (/^$re{bold}(See also):$re{bold} (.*)$/i) {
		    my $res = "## $1 ##
";
		    $in_section = $1;
		    my @see_also = split " ", $2;
		    s/,$// for @see_also;
		    for (@see_also) {
			$_ = "[$_](/documentation/help/\L$_\E)";
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

		    push @{$page->{_syn}}, $_;

		    $_ = qq'<div class="irssisyntax highlight"><pre style="--cmdlen:${cmdlen}ch"><code>'
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
			# filter not applicable command options
			if ($page->{filter_re} && $page->{_syn} && $word && $word =~ /^-/) { # flag
			    my $checkword = $word;
			    $checkword =~ s/:$//;
			    unless (grep { /\Q$checkword\E\b/ } @{ $page->{_syn} } ) {
				next;
			    }
			}


			if ($word) {
			    $word = "`$word`";
			    $word =~ s/:`/`:/;
			    $_ = $rest;
			    finish_table($syn, \%table_state);
			    if ($word eq '`-list`:' && $page->{file} eq 'bind') {
				$word =~ s{(\`(.*)\`)}{[$1](/documentation/help/$page->{file}_$2)};
			    }
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
		    s/</&lt;/g unless /^ {4}/;
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
		    if ($in_section eq 'Description' and not $page->{is_sub_page}) {
			if (/^##/) {
			    # skip
			} else {
			    if (not exists $short_descs{$help_file_name}) {
				$short_descs{$help_file_name} = $_;
			    } elsif (/^\s*$/) {
				$short_descs{$help_file_name} .= "\n";
			    } else {
				if ($short_descs{$help_file_name} !~ /\n\z/) {
				    $short_descs{$help_file_name} .= ' ';
				}
				$short_descs{$help_file_name} .= $_;
			    }
			}
		    }
		}
	    }
	    #print $syn "```\n",(join "\n", @otx),"\n```\n";
	}
    }

    my %help_file_seen;
    # create category sections on the main help index
    for my $cat (@{$config->{categories}}) {
	print $index "cat_$cat->{category}\n";
    }
    print $index qq'

:::
';
    for my $cat (@{$config->{categories}}) {
	print $index qq'

## $cat->{category}

<div markdown="1" class="helpindex">

';

	open my $cat_index, '>', "$out/documentation/help/cat_$cat->{category}.md";
	print $cat_index qq'# $cat->{category}

<!-- comment

Please submit changes to
- https://github.com/irssi/irssi/tree/master/docs/help/in
- https://github.com/irssi/irssi.github.io/blob/main/_tools/help2md.yml

endcomment -->

';
	my @cat_toctree;
	print $cat_index "| | |\n| --- | --- |\n";
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
	    my $toc_seen = $help_file_seen{$_};
	    $help_file_seen{$_} = 1;
	    print $index "* [$_](./$_)\n";
	    my $short_desc = $short_descs{$_} // do { warn qq{no desc for $_\n}; '' };
	    $short_desc =~ s/\n+\z//;
	    $short_desc =~ s/\n.*\z/ .../s;
	    print $cat_index "| [$_](./$_) | $short_desc |\n";
	    push @cat_toctree, "$_" unless $toc_seen;
	}
	if (@cat_toctree) {
	    print $cat_index qq'

:::{toctree}
:maxdepth: 1
:hidden:

@{[join "\n", @cat_toctree]}

:::
';
	}
	print $index '

</div>
';
    }
}

main(@ARGV);

#print "$_\n" for @help_files;
