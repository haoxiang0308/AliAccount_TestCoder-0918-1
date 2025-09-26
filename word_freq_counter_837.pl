#!/usr/bin/env perl
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
    # Convert line to lowercase and split into words
    # Words are defined as sequences of alphanumeric characters
    my @words = map { lc $_ } $line =~ /\b\w+\b/g;

    # Count each word
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

close($fh);

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}