#!/usr/bin/perl
# Log Error Analysis Results
# Generated from log file: app.log
# Generated on: Tue Oct 28 12:44:39 2025

# Total errors found: 6

# Error breakdown:
# Connection timeout: 3 occurrences
# Database unavailable: 2 occurrences
# Permission denied: 1 occurrences

# Error statistics as Perl data structure
my $error_stats = {
    'total_errors' => 6,
    'errors' => {
        'Connection timeout' => 3,
        'Database unavailable' => 2,
        'Permission denied' => 1,
    },
    'source_file' => 'app.log',
};

# Print summary
print "Log Analysis Summary:\n";
print "Total errors: $error_stats->{'total_errors'}\n";
print "Errors by type:\n";
foreach my $err (keys %{$error_stats->{'errors'}}) {
    print "  $err: $error_stats->{'errors'}->{$err}\n";
}
