#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# Using each block to iterate and print elements
puts "Using each block:"
array.each do |element|
  puts element
end

puts "\nUsing map block:"
# Using map block (also prints the result of the block)
doubled_numbers = array.select { |item| item.is_a?(Numeric) }.map { |num| num * 2 }
puts "Doubled numbers: #{doubled_numbers}"

puts "\nUsing select block:"
# Using select block to filter strings
strings = array.select { |item| item.is_a?(String) }
puts "Strings in array: #{strings}"