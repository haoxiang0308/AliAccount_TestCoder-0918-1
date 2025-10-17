#!/usr/bin/perl
# Log Analysis Results
# Generated from log file: /workspace/sample.log

use strict;
use warnings;

# Error statistics
my $CRITICAL_COUNT = 1;
my $ERROR_COUNT = 4;
my $EXCEPTION_COUNT = 1;
my $FATAL_COUNT = 1;
my $WARNING_COUNT = 2;
my $TOTAL_ERRORS = 9;

# Print results
print "Log Analysis Results for: /workspace/sample.log\n";
print "========================\n";
print "CRITICAL: $CRITICAL_COUNT\n";
print "ERROR: $ERROR_COUNT\n";
print "EXCEPTION: $EXCEPTION_COUNT\n";
print "FATAL: $FATAL_COUNT\n";
print "WARNING: $WARNING_COUNT\n";
print "Total Errors: $TOTAL_ERRORS\n";
