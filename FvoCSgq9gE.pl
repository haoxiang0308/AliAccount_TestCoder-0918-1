#!/usr/bin/perl
use strict;
use warnings;

# This script was auto-generated to summarize errors in /workspace/access.log
my $log_file = '/workspace/access.log';

my %error_counts;

open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ m/ (\d{3}) /) {
        my $status_code = $1;
        if ($status_code =~ m/^[45]/) {
            $error_counts{$status_code}++;
        }
    }
}

close($fh);

print "Error Summary from $log_file:\n";
my $total_errors = 0;
for my $code (sort keys %error_counts) {
    print "Status Code $code: $error_counts{$code} errors\n";
    $total_errors += $error_counts{$code};
}
print "Total Errors: $total_errors\n";
