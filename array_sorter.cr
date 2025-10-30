# Create an array with some elements
array = [64, 34, 25, 12, 22, 11, 90, 5]

# Sort the array
sorted_array = array.sort

# Generate a random filename
random_number = Random.rand(10000..99999)
random_filename = "array_output_#{random_number}.txt"

# Write the sorted array to the file
File.write(random_filename, "Sorted array: #{sorted_array}\n")