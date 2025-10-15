#!/usr/bin/env ruby

# Create an example array
array = ['apple', 'banana', 'cherry', 'date', 1, 2, 3]

# Using each block to print elements
puts "Iterating through array using each block:"
array.each do |element|
  puts element
end

# Using each_with_index block
puts "\nUsing each_with_index block:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

# Using map block to transform elements
puts "\nUsing map block to transform elements:"
transformed = array.map do |element|
  case element
  when String
    element.upcase
  when Numeric
    element * 10
  else
    element
  end
end
puts transformed
