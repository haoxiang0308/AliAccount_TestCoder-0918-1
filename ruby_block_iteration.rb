#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# Method 1: Using each block to print elements
puts "Using each block:"
array.each do |element|
  puts element
end

# Method 2: Using each_with_index block
puts "\nUsing each_with_index block:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

# Method 3: Using a block with the map method (for transformation)
puts "\nUsing map block (doubled values for numbers, upcase for strings):"
result = array.map do |element|
  case element
  when Numeric
    element * 2
  when String
    element.upcase
  else
    element
  end
end
puts result

# Method 4: Using select block to filter elements
puts "\nUsing select block (only numeric values):"
numeric_elements = array.select do |element|
  element.is_a?(Numeric)
end
puts numeric_elements