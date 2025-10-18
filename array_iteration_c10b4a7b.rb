#!/usr/bin/env ruby

# Ruby script demonstrating array iteration using blocks
# This script shows different ways to iterate through an array using blocks and print elements

puts "=== Ruby Array Iteration Using Blocks ==="

# Define an example array
fruits = ["apple", "banana", "cherry", "date", "elderberry"]

puts "\n1. Using .each block to iterate through array:"
fruits.each do |fruit|
  puts "Fruit: #{fruit}"
end

puts "\n2. Using .each_with_index block:"
fruits.each_with_index do |fruit, index|
  puts "Index #{index}: #{fruit}"
end

puts "\n3. Using .map to transform and print:"
doubled_fruits = fruits.map do |fruit|
  "#{fruit} #{fruit}"
end
puts "Doubled fruits: #{doubled_fruits.join(', ')}"

puts "\n4. Using .select to filter and print:"
long_named_fruits = fruits.select do |fruit|
  fruit.length > 5
end
puts "Fruits with name longer than 5 characters: #{long_named_fruits.join(', ')}"

puts "\n5. Using shorthand block syntax:"
numbers = [1, 2, 3, 4, 5]
puts "Squared numbers:"
numbers.each { |n| puts "#{n} squared is #{n*n}" }

puts "\n6. Using blocks with ranges:"
puts "Numbers from 1 to 10:"
(1..10).each { |i| print "#{i} " }
puts "\n"

puts "\nAll examples completed!"