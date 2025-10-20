#!/usr/bin/env ruby

# Define an array of sample elements
array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts "Iterating through array using blocks:"
puts

# Using each block to iterate and print elements
array.each do |element|
  puts element
end

puts
puts "Using each_with_index block:"
array.each_with_index do |element, index|
  puts "#{index + 1}. #{element}"
end

puts
puts "Using map block to transform elements:"
capitalized = array.map { |element| element.capitalize }
puts capitalized.join(', ')

puts
puts "Using select block to filter elements:"
long_elements = array.select { |element| element.length > 5 }
puts "Elements with more than 5 characters: #{long_elements.join(', ')}"