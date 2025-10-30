#!/usr/bin/perl
# Generated script with error statistics from log file: /workspace/sample.log
use strict;
use warnings;

# Error statistics from log file '/workspace/sample.log'
my %error_stats = (
    'CRITICAL' => 2,
    'ERROR' => 4,
    'FATAL' => 1,
);

# Print error statistics
print "Error statistics from /workspace/sample.log:\n";
for my $error_type (sort keys %error_stats) {
    print "$error_type: $error_stats{$error_type}\n";
}

# Total errors
my $total_errors = 0;
for my $count (values %error_stats) {
    $total_errors += $count;
}
print "\nTotal errors: $total_errors\n";
