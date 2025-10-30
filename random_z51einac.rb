#!/usr/bin/env ruby

# Create an array of elements
array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts "Using each block to iterate through array:"
array.each do |element|
  puts element
end

puts "\nUsing each block with index:"
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

puts "\nUsing map block to transform elements:"
transformed = array.map { |element| element.upcase }
puts transformed

puts "\nUsing select block to filter elements:"
filtered = array.select { |element| element.length > 5 }
puts filtered