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

# Hash to store word frequencies
my %word_count;

# Open and read the file
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!";

while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters)
    $line = lc($line);
    while ($line =~ /(\w+)/g) {
        $word_count{$1}++;
    }
}

close($fh);

# Sort words by frequency (in descending order)
my @sorted_words = sort { $word_count{$b} <=> $word_count{$a} } keys %word_count;

# Print the results
print "Word frequencies in '$filename':\n";
print "-----------------------------\n";
foreach my $word (@sorted_words) {
    print "$word: $word_count{$word}\n";
}