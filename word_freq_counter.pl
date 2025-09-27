#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (alphanumeric characters)
    for my $word (split /\W+/, lc $line) {
        # Skip empty strings resulting from split
        if ($word) {
            $word_count{$word}++;
        }
    }
}

close $fh;

# Print the word frequencies, sorted alphabetically
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}