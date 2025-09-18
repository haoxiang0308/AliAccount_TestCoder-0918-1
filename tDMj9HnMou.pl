#!/usr/bin/perl
use strict;
use warnings;

# Check if filename is provided as command line argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    die "File '$filename' does not exist.\n";
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase
    $line = lc($line);
    # Remove punctuation and split into words
    my @words = split(/\W+/, $line);
    
    # Count each word
    foreach my $word (@words) {
        # Skip empty strings
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print the word frequencies
print "Word frequencies in '$filename':\n";
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}