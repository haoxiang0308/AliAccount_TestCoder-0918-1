#!/usr/bin/perl
use strict;
use warnings;

# Check for input file argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Open file or die
open(my $fh, '<', $filename) or die "Cannot open '$filename': $!\n";

my %word_freq;

# Read file line by line
while (my $line = <$fh>) {
    # Extract words (alphanumeric sequences), convert to lowercase
    while ($line =~ /\b(\w+)\b/g) {
        my $word = lc($1);
        $word_freq{$word}++;
    }
}

close($fh);

# Sort words alphabetically and print with counts
foreach my $word (sort keys %word_freq) {
    print "$word: $word_freq{$word}\n";
}
