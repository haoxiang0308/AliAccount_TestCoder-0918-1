#!/usr/bin/perl
use strict;
use warnings;

die "Usage: $0 <filename>\n" unless @ARGV == 1;
my $filename = $ARGV[0];

open my $fh, "<", $filename or die "Cannot open file $filename: $!\n";

my %word_count;
while (my $line = <$fh>) {
    chomp $line;
    # Split the line into words based on whitespace and punctuation
    my @words = split /\W+/, $line;
    foreach my $word (@words) {
        $word = lc $word; # Convert to lowercase for case-insensitive counting
        next if $word eq ""; # Skip empty strings
        $word_count{$word}++;
    }
}

close $fh;

# Print the word counts
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}