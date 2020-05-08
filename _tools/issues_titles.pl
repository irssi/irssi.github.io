use strict;
use warnings;
use YAML qw(LoadFile DumpFile);
use Net::GitHub;
use FindBin;

my $issue_file = "$FindBin::Bin/gh_issues.yml";
my $cache_file = "$FindBin::Bin/.issue_cache.yml";

my $github = Net::GitHub->new();
$github->set_default_user_repo('irssi', 'irssi');
my $issue = $github->issue;
if (-f $cache_file) {
    print STDERR "Loading cache...";
    my $cache = LoadFile($cache_file);
    while (my ($k, $v) = splice @{ $cache->{cache} }, 0, 2) {
	print STDERR '.';
	$issue->cache->set($k, $v);
    }
    print STDERR "\n";
}

my %x;
for my $ur (
    ['irssi','irssi'],
    ['irssi-import','bugs.irssi.org']
   ) {
    while (my $r_issue = $issue->next_repos_issue(@$ur, { state => 'all' })) {
	print "@$ur ", $r_issue->{number}, "\n";
	$x{ $ur->[0] }{ $ur->[1] }{ $r_issue->{number} } = $r_issue;
    }
}

END {
    DumpFile($cache_file, { cache => $issue->cache->{_fifo} });
    DumpFile($issue_file, \%x);
}
