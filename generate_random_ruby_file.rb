#!/usr/bin/env ruby

# Generate a random filename with .rb extension
def generate_random_filename
  chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  filename = (0...10).map{chars[rand(chars.length)]}.join
  "#{filename}.rb"
end

# Ruby code that uses blocks to iterate through an array and print elements
ruby_code = <<~'RUBY'
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
RUBY

# Generate random filename
random_filename = generate_random_filename

# Write the Ruby code to the randomly named file
File.open(random_filename, 'w') do |file|
  file.write(ruby_code)
end

puts "Created randomly named Ruby file: #{random_filename}"

# Optionally, execute the generated file to verify it works
puts "\nExecuting the generated file:"
system("ruby", random_filename)