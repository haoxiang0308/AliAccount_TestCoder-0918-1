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
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    my @words = map { s/[^\w]//g; $_ } split /\s+/;
    foreach my $word (@words) {
        # Only count non-empty words
        if ($word) {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the word counts, sorted alphabetically
print "Word Frequencies in '$filename':\n";
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}