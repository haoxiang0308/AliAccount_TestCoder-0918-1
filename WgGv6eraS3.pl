#!/usr/bin/perl
# Log Error Analysis Results
# Generated from log file: sample.log
# Generated on: Tue Oct 28 12:44:32 2025

# Total errors found: 5

# Error breakdown:
# Database connection failed: 3 occurrences
# File not found: 1 occurrences
# Invalid user credentials: 1 occurrences

# Error statistics as Perl data structure
my $error_stats = {
    'total_errors' => 5,
    'errors' => {
        'Database connection failed' => 3,
        'File not found' => 1,
        'Invalid user credentials' => 1,
    },
    'source_file' => 'sample.log',
};

# Print summary
print "Log Analysis Summary:\n";
print "Total errors: $error_stats->{'total_errors'}\n";
print "Errors by type:\n";
foreach my $err (keys %{$error_stats->{'errors'}}) {
    print "  $err: $error_stats->{'errors'}->{$err}\n";
}
