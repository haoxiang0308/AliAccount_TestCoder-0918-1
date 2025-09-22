#!/usr/bin/env ruby

# Define an array of elements
my_array = ["apple", "banana", "cherry", "date", "elderberry"]

# Iterate over the array using a do...end block and print each element
my_array.each do |element|
  puts element
end

puts "\n---\n"

# Iterate over the array using a curly brace block and print each element with a prefix
my_array.each { |element| puts "Fruit: #{element}" }
