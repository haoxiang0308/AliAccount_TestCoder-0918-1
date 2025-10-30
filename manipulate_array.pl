#!/usr/bin/perl
use strict;
use warnings;

# Create an array with some initial values
my @array = (10, 20, 30, 40, 50);

print "Original array: @array\n";

# Manipulate the array: add an element
push @array, 60;
print "After adding 60: @array\n";

# Manipulate the array: remove the first element
shift @array;
print "After removing first element: @array\n";

# Manipulate the array: sort in descending order
@array = sort { $b <=> $a } @array;
print "Sorted in descending order: @array\n";

# Generate a random filename
my $random_filename = "array_output_" . int(rand(10000)) . ".txt";

# Write the final array to the random filename
open my $fh, '>', $random_filename or die "Could not open file '$random_filename' $!";
print $fh "Final array: @array\n";
close $fh;

print "Array saved to: $random_filename\n";