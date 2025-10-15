#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10]

# Method 1: Using each block to iterate and print elements
puts "Using 'each' block:"
array.each do |element|
  puts element
end

puts "\nUsing 'each' with a one-line block:"
array.each { |element| puts element }

# Method 2: Using map to transform and print
puts "\nUsing 'map' block to print with index:"
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

# Method 3: Using select to filter and print even numbers (for numeric elements)
puts "\nUsing 'select' block to print only numeric elements:"
numeric_elements = array.select { |element| element.is_a?(Numeric) }
numeric_elements.each { |element| puts element }

puts "\nUsing 'select' to print only string elements:"
string_elements = array.select { |element| element.is_a?(String) }
string_elements.each { |element| puts element }