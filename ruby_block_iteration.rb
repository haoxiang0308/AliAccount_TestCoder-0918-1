#!/usr/bin/env ruby

# Create an array of elements
array = ["apple", "banana", "cherry", "date", "elderberry"]

puts "Using each block to iterate through the array:"
array.each do |element|
  puts element
end

puts "\nUsing each_with_index block to iterate with index:"
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

puts "\nUsing map block to transform and print elements:"
array.map { |element| puts "Element: #{element}" }

puts "\nUsing select block to filter and print specific elements:"
selected = array.select { |element| element.length > 5 }
puts "Elements with length greater than 5:"
selected.each { |element| puts element }