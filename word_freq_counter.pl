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
    chomp $line;
    # Convert to lowercase and split into words (handles punctuation)
    foreach my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings from leading/trailing punctuation
        $word_count{$word}++;
    }
}

close($fh);

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}