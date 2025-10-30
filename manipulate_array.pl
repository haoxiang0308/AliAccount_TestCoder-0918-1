#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(shuffle);

# Create an array with some initial values
my @array = (10, 20, 30, 40, 50);

print "Original array: @array\n";

# Manipulate the array
push @array, 60;          # Add an element
print "After adding 60: @array\n";

shift @array;             # Remove first element
print "After removing first element: @array\n";

@array = reverse @array;  # Reverse the array
print "After reversing: @array\n";

@array = shuffle @array;  # Shuffle the array
print "After shuffling: @array\n";

# Generate a random filename
my $random_filename = "array_output_" . int(rand(10000)) . ".txt";

# Write the final array to the random-named file
open(my $fh, '>', $random_filename) or die "Cannot open file '$random_filename': $!";
print $fh "Final array: @array\n";
close($fh);

print "Array saved to $random_filename\n";