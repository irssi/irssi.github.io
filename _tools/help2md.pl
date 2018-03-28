use strict;
use warnings;

my @categories = (
    # [ "Category" => [ paths ], [ excludes ] ]
    ['Connection' => [qr/fe-irc-server/, qr/fe-ircnet/, qr/core\/servers/, qr/core\/chat-commands/, qr/fe-server/, qr/rawlog/], [qw[MSG FOREACH]] ],
    ['Core Commands' => [qr/core\/chat-commands/, qr/fe-channels/, qr/fe-queries/] ],
    ['Window Commands' => [qr/textbuffer-commands/, qr/mainwindows/, qr/window-commands/, qr/lastlog/] ],
    ['Settings' => [qr/fe-settings/, qr/themes/, qr/keyboard/, qr/statusbar-config/, qr/session/, qr/fe-recode/, qr/window-commands/, qr/completion/, qr/hilight-text/, qr/fe-ignore/, qr/fe-log/], [qw[FOREACH]] ],
    ['Misc' => [qr/fe-modules/, qr/fe-help/, qr/fe-exec/, qr/fe-core-commands/, qr/core\/commands/] ],
    ['IRC Commands' => [qr/irc-commands/, qr/fe-netsplit/, qr/dcc/, qr/notify-commands/, qr/irc\/core/] ],
    ['IRC Proxy' => [qr/irc\/proxy/] ],
    ['Other pages']
   );

my @subcommand_pages = (
    # [ "command" => [ "page_name", "category title" => [ subcommands ], [ excludes ] ] ]
    ['window' => [
	['creation', 'window/split window creation' => [
	    qw[
		  new close hide show rshow list
	     ]]],
	['changing', 'window changing' => [
	   qw[
		 goto next last previous refnum left right
	    ]]],
	['properties', 'window attribute manipulation' => [
	   qw[
		 number level immortal server name history theme stick hidelevel
	    ]]],
	['items', 'window items' => [
	   qw[
		 item
	    ]]],
	['moving', 'window moving/number changing' => [
	   qw[
		 number move
	    ]], ['move dleft', 'move dright', 'move up', 'move down']],
	['resizing', 'split window resizing' => [
	   qw[
		 grow shrink size balance rgrow rshrink rsize rbalance
	    ]]],
	['navigation', 'split window navigation' => [
	   qw[
		 up dup dleft down ddown dright
	    ]]],
	['split_moving', 'split window moving' => [
	    'move dleft', 'move dright', 'move up', 'move down', 'stick'
	   ]],
	['logging', 'logging' => [
	   qw[
		 log logfile
	    ]]],
	['misc', 'other subcommands'],
       ]],
   );

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
	print $out @{$state->{table}}, "{:.table.kv}\n\n";
	@{$state->{table}} = ();
    }
    $state->{WORD} = '';
    $state->{INFO} = [];
}

sub check_filter {
    my ($string, $page) = @_;
    (!$page->{filter_re} || ("$string " =~ /^\s*$page->{filter_re}/i &&
	(!$page->{filter_not_re} || "$string " !~ /^\s*$page->{filter_not_re}/i)))
}

sub main {
    my $dir = shift;
    my $out = shift;
    unless ($dir && $out) {
	die "syntax: perl $0 <path> <outpath>\n";
    }

    system("cd \Q$dir\E; perl utils/syntax.pl");

    chomp (my @files = `find \Q$dir\E/docs/help -type f`);
    @files = grep !/Makefile/, @files;

    s{^\Q$dir\E/docs/help(?:/|$)}{} for @files;

    @files = grep !m{^in(?:/|$)}, @files;
    @files = grep /./, @files;

    unless (@files) {
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

    @files = sort @files;

    system("mkdir -p \Q$out\E/documentation/help");
    open my $index, '>', "$out/documentation/help/index.markdown";
    print $index '---
layout: page
title: Help
---

These are the `/help` pages of the Irssi on-line help.

<div markdown="1" class="helpindex">

';

    my %table_state;
    for (@files) {
	my $fn = $_;
	print $index "* [$_]($_)\n";
	my (@subcommand_split) = map { @{$_->[1]} } grep { $_->[0] eq $fn } @subcommand_pages;
	open my $sin, '<', "$dir/docs/help/$_";
	chomp (my @tx = <$sin>);
	my @otx = @tx;
	my @sub_pages = ( +{ file => $fn, title => $fn } );
	while (@sub_pages) {
	    my $page = shift @sub_pages;
	    @tx = @otx;
	    open my $syn, '>', "$out/documentation/help/$page->{file}.markdown";
	    print $syn qq'---
layout: page
title: "Help: $page->{title}"
---

{% comment %}

Please submit changes to
- https://github.com/irssi/irssi/blob/master/docs/help/in/$fn.in
';
	    if ($cmd{"\U$fn"}) {
		for (sort keys %{$cmd{"\U$fn"}}) {
		    print $syn "- https://github.com/irssi/irssi/blob/master/$_\n";
		}
	    }
	    print $syn qq'

{% endcomment %}
[Help index](/documentation/help)
';
	    if ($page->{file} ne $fn) {
		print $syn "\n[\u$fn subcommands index](/documentation/help/$fn)\n";
	    }
	    elsif (@subcommand_split) {
		# find valid subpages
		my @commands;
		my %commands_seen;
		for (@tx) {
		    if (/^%9Syntax:/) {
			# continue
		    }
		    elsif (/^%9/) {
			last;
		    }
		    if (s/%\|// || /^[[:upper:]]+$/) {
			my $command;
			for (split ' ') {
			    if (/^[[:upper:]]+$/) {
				$command .= "\L$_ ";
			    }
			    else {
				last;
			    }
			}
			push @commands, $command;
		    }
		}
		print $syn "### Subcommands\n\n";
		for (@subcommand_split) {
		    my ($name, $title, $commands, $not_commands) = @$_;
		    my @c1;
		    if ($commands) {
			my $re = join '|', map { quotemeta "$fn $_ " } sort { length $b <=> length $a } sort @$commands;
			@c1 = grep /^($re)/, @commands;
		    }
		    else {
			@c1 = grep !$commands_seen{$_}, grep /^\Q$fn /, @commands;
		    }
		    my $not;
		    if ($not_commands) {
			$not = join '|', map { quotemeta "$fn $_ " } sort { length $b <=> length $a } sort @$not_commands;
			@c1 = grep !/^($not)/, @c1;
		    }
		    if (@c1) {
			print $syn qq'
#### [$title](/documentation/help/${fn}_$name)

<div markdown="1" class="helpindex">

'; #
			for (@c1) {
			    print $syn "* $_\n";
			}
			print $syn '
</div>
';
			my $c1_re = join '|', map { quotemeta } @c1;
			$title = "$fn: $title" unless $title =~ /^\Q$fn\E\b/i;
			push @sub_pages, +{ file => "${fn}_$name", title => $title, filter => \@c1, filter_re => $c1_re, filter_not_re => $not };
			@commands_seen{@c1} = (1) x @c1;
		    }
		}
		my $all_re = join '|', map { quotemeta } sort { length $b <=> length $a } sort keys %commands_seen;
		$page->{filter_re} = $page->{filter_not_re} = $all_re;
		@tx = @otx;
	    }
	    my $in = 'syn';
	    for (@tx) {
		if (/^%9Syntax:/) {
		    $in = 'syn';

		    next
			if @subcommand_split && $page->{file} eq $fn;

		}
		elsif (/^%9Parameters:/) {
		    $in = 'param';
		}
		elsif (/^%9References:/) {
		    finish_table($syn, \%table_state);
		    $in = 'refs';
		}
		elsif (/^%9/) {
		    finish_table($syn, \%table_state);
		    $in = '';
		}
		s/^%9(.*):%9$/### $1 ###/;
		if (/^%9(See also):%9 (.*)$/i) {
		    my $res = "### $1 ###
";
		    my @see_also = split " ", $2;
		    s/,$// for @see_also;
		    for (@see_also) {
			$_ = "[$_](/documentation/help/\L$_\E)";
		    }
		    $_ = $res . join ", ", @see_also;
		}
		s/^    ([[:alpha:]] ?[[:lower:]].*)$/$1/ ||
		    s/^        ([* ] [[:alpha:]] ?[[:lower:]].*)$/$1/;

		my $cmdlen = -1 + index $_, '%|';
		if ($in eq 'syn' && (s/%\|// || /^[[:upper:]]+(?: [[:upper:]]+)?$/)) {
		    next
			if !check_filter("$_ ", $page);

		    $_ = qq'<div class="highlight irssisyntax"><pre style="--cmdlen:${cmdlen}ch"><code>'._add_syn_colors($_, ["*", "*05", "10"], ["09", "14"], ["*", "13", "13"], ["14"], []) . "</code></pre></div>\n\n";
		}
		elsif ($in eq 'param'
		       || /^        .............?    /
		       || /^        ..    /) {
		    if (/^\s{8}\s+(\S.*)$/) {
			# continuation
			$_ = $1;
			s/%\|//;
		    }
		    elsif (/^\s+\S/) {
			my ($word, $rest);
			if (-1 != index $_, '%|') {
			    ($word, $rest) = split /%\|/, $_, 2;
			}
			elsif (-1 != index $_, ':') {
			    ($word, $rest) = split /:/, $_, 2;
			    $word .= ':';
			}
			elsif (/^\s+(\S+)\s{2,}(.*)$/) {
			    ($word, $rest) = ($1, $2);
			}
			elsif (/^\s+(-?<[^>]+>)\s+(.*)$/) {
			    ($word, $rest) = ($1, $2);
			} else {
			    finish_table($syn, \%table_state);
			}
			if ($word) {
			    $word =~ s/^\s+//;
			    $word =~ s/\s+$//;
			}

			if ($page->{filter_re} && $word =~ /^[[:upper:]]+(?:\s[[:upper:]]+)*:?$/) {
			    my $checkword = "$fn $word";
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
			    s/%\|//;
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
		    s/``((?:[^`']|`[^`]|'[^'])*)''/``$1``/g;
		    s/`([^`']*)'/`$1`/g;

		    # simple bold -> markdown bold
		    s/(?<!\\)\*(\S.*?)(?<!\\)\*/**$1**/g;

		}

		if ($in eq 'refs') {
		    s{(\w+://\S+)}{[$1]($1)}g;
		    $_ .= "\n";
		}

		# irssi escapes
		s/%%/%/g;

		if ($in eq '' && /^ {4}/ && $page->{filter_re} && $page->{file} ne $fn) {
		    if (/^ {4}\/(\Q$fn\E .*)/i) {
			next if !check_filter("$1 ", $page);
		    }
		}

		if ($table_state{WORD}) {
		    # delay printing to finish_table()
		    push @{$table_state{INFO}}, $_;
		}
		else {
		    print $syn "$_\n";
		}
	    }
	    #print $syn "```\n",(join "\n", @otx),"\n```\n";
	}
    }
    my %seen;
    for my $cat (@categories) {
	print $index qq'

### $cat->[0]

<div markdown="1" class="helpindex">

';

	for (@files) {
	    my $cmd = "\U$_";
	    my $srcf = $cmd{$cmd};
	    if ($cat->[2] && grep { $cmd eq $_ } @{$cat->[2]}) {
		next;
	    }
	    my $found;
	    if ($cat->[1]) {
		for my $sea (@{$cat->[1]}) {
		    $found = grep { $_ =~ $sea } keys %$srcf;
		    last if $found;
		}
	    }
	    else {
		$found = !$seen{$_};
	    }
	    next unless $found;
	    $seen{$_} = 1;
	    print $index "* [$_]($_)\n";
	}
	print $index '

</div>
';
    }
}

main(@ARGV);

#print "$_\n" for @files;
