#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was passed as an argument
if (@ARGV != 1) {
    die "Usage: $0 <logfile>\n";
}

my $logfile = $ARGV[0];
my $error_count = 0;

# Open the log file for reading
open(my $fh, '<', $logfile) or die "Could not open '$logfile': $!";

# Read the file line by line
while (my $line = <$fh>) {
    # Check if the line contains the word 'ERROR' (case-sensitive)
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

# Close the file handle
close($fh);

# Print the total count of errors
print "Total number of errors found: $error_count\n";