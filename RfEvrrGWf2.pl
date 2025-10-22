#!/usr/bin/perl
# Error statistics generated from log file: /workspace/sample.log
# Generated on: Wed Oct 22 18:09:22 2025

my %error_stats = (
    'critical' => 1,
    'error' => 4,
    'warning' => 2,
);

my $total_errors = 7;

# Print the statistics
print "Error Statistics:\n";
foreach my $type (sort keys %error_stats) {
    print "$type: $error_stats{$type}\n";
}
print "Total errors: $total_errors\n";
