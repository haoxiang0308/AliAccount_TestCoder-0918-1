#!/usr/bin/perl
use strict;
use warnings;

# Check for correct number of arguments
if (@ARGV != 1) {
    print "Usage: $0 <input_file>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if the file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Hash to store word counts
my %word_count;

# Open the file for reading
open my $fh, '<', $filename or die "Cannot open '$filename': $!";

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    for my $word (split /\W+/, lc $line) {
        # Skip empty strings resulting from split
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file handle
close $fh;

# Print the word frequencies
print "Word frequencies in '$filename':\n";
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}