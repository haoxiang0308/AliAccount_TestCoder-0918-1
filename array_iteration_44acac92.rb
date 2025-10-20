# Ruby script to iterate through an array using blocks

# Create an array of elements
array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts 'Iterating through array using each block:'
array.each do |element|
  puts element
end

puts '
Using map to transform elements:'
uppercase_array = array.map { |element| element.upcase }
uppercase_array.each { |element| puts element }

puts '
Using select to filter elements:'
long_name_elements = array.select { |element| element.length > 5 }
long_name_elements.each { |element| puts element }
