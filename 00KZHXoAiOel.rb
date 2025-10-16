#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, "hello", "world", 3.14]

# Use a block to iterate through the array and print each element
puts "Iterating through array using a block:"
array.each do |element|
  puts element
end

puts "\nUsing block with index:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

puts "\nUsing map block to transform elements:"
squared_numbers = array.select { |item| item.is_a?(Numeric) }.map { |num| num * num }
puts "Squared numbers: #{squared_numbers}"