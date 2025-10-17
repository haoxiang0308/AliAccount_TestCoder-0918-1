#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
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

# Hash to store word frequencies
my %word_freq = ();

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (sequences of letters/digits)
    $line = lc($line);
    my @words = $line =~ /\b([a-z0-9]+)\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_freq{$word}++;
    }
}

# Close the file
close($fh);

# Sort words by frequency (in descending order)
my @sorted_words = sort { $word_freq{$b} <=> $word_freq{$a} } keys %word_freq;

# Print the results
print "Word frequencies in '$filename':\n";
print "-----------------------------\n";
foreach my $word (@sorted_words) {
    printf "%-15s : %d\n", $word, $word_freq{$word};
}