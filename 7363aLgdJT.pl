#!/usr/bin/perl
use strict;
use warnings;

# Check if filename is provided as argument
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

# Open file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters and apostrophes within words)
    $line = lc($line);
    while ($line =~ /(\w+(?:'\w+)?)/g) {
        $word_count{$1}++;
    }
}

close($fh);

# Print word frequencies in descending order of frequency
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";

# Sort by frequency (descending) and then alphabetically for ties
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}

print "\nTotal unique words: " . scalar(keys %word_count) . "\n";
print "Total words: " . sum(values %word_count) . "\n";

# Subroutine to calculate sum of values
sub sum {
    my $total = 0;
    $total += $_ for @_;
    return $total;
}