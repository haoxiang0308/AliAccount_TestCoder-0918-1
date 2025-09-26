#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if the file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

# Hash to store word counts
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    foreach my $word (split /\W+/, lc $line) {
        # Skip empty strings resulting from split
        if ($word) {
            $word_count{$word}++;
        }
    }
}

# Close the file handle
close($fh);

# Print the word counts in a sorted manner
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}