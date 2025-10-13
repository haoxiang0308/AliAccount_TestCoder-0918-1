#!/usr/bin/perl
use strict;
use warnings;

# Check for command line argument
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words based on non-word characters
    my @words = split(/\W+/, lc $line);
    foreach my $word (@words) {
        # Skip empty strings resulting from the split
        next if $word eq '';
        $word_count{$word}++;
    }
}

close($fh);

# Print the word frequencies
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}