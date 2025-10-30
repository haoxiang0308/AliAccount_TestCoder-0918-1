#!/usr/bin/perl
use strict;
use warnings;

# Generated script containing log analysis results
# Analyzed log file: /workspace/sample.log
# Error pattern: ERROR
# Total errors found: 5

# Error count variable
my $total_errors = 5;

# Function to display error statistics
sub show_error_stats {
    print "Log file: /workspace/sample.log\n";
    print "Error pattern: 'ERROR'\n";
    print "Total errors found: $total_errors\n";
}

# Call the function if script is executed directly
if (@ARGV == 0 || $ARGV[0] ne 'library') {
    show_error_stats();
}
