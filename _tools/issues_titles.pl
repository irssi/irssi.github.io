#!/usr/bin/perl
use strict;
use warnings;
use Storable qw(nstore retrieve);
use YAML qw(LoadFile DumpFile);
use Net::GitHub;
use FindBin;

my $issue_file = "$FindBin::Bin/gh_issues.yml";
my $cache_file2 = "$FindBin::Bin/.issue_cache.sto";

my $github = Net::GitHub->new(
    $ENV{GITHUB_TOKEN} ? (access_token => $ENV{GITHUB_TOKEN}) : ());
$github->set_default_user_repo('irssi', 'irssi');
my $issue = $github->issue;
my $cache;
if (-f $cache_file2) {
    print STDERR "Loading cache(sto)...";
    $cache = retrieve($cache_file2);
}

if ($cache) {
    while (my ($k, $v) = splice @{ $cache->{cache} }, 0, 2) {
	print STDERR '.';
	$issue->cache->set($k, $v);
    }
    print STDERR "\n";
}

my %x;
for my $ur (
    ['irssi','irssi'],
    ['irssi-import','bugs.irssi.org'],
    ['ailin-nemui', 'irssi'],
   ) {
    while (my $r_issue = $issue->next_repos_issue(@$ur, { state => 'all' })) {
	print "@$ur ", $r_issue->{number}, "\n";
	$x{ $ur->[0] }{ $ur->[1] }{ $r_issue->{number} } = +{
	    (title => $r_issue->{title}),
	    ($r_issue->{milestone}
	     ? (milestone => $r_issue->{milestone}{title})
	     : ()),
	   };
    }
}

print STDERR "saving cache...\n";
nstore({ cache => $issue->cache->{_fifo} }, $cache_file2);
print STDERR "saving issues...\n";
DumpFile($issue_file, \%x);
print STDERR "...end\n";
