#!/usr/bin/env ruby

# Create an array of elements
array = [1, 2, 3, 4, 5, "hello", "world", 6.28, 42, "Ruby"]

puts "Original array:"
p array

puts "\nIterating through array using block and printing elements:"
array.each do |element|
  puts element
end

puts "\nUsing map block to transform elements:"
doubled_numbers = array.select { |e| e.is_a?(Numeric) }.map { |num| num * 2 }
puts "Doubled numeric elements: #{doubled_numbers}"

puts "\nUsing collect block (same as map):"
upcased_strings = array.select { |e| e.is_a?(String) }.collect { |str| str.upcase }
puts "Upcased string elements: #{upcased_strings}"

puts "\nUsing reject block:"
without_numbers = array.reject { |e| e.is_a?(Numeric) }
puts "Elements that are not numeric: #{without_numbers}"