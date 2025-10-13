#!/usr/bin/perl
use strict;
use warnings;

my %word_count;

# Check if a filename is provided
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Open and read the file
open my $fh, '<', $filename or die "Cannot open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Split line into words (on whitespace), convert to lowercase
    my @words = split /\s+/, lc $line;
    foreach my $word (@words) {
        # Remove non-word characters (punctuation)
        $word =~ s/[^\w]//g;
        # Skip empty strings
        next if $word eq "";
        $word_count{$word}++;
    }
}

close $fh;

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}