#!/usr/bin/env elixir

# Create a sample list
original_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filter the list to get only even numbers
filtered_list = Enum.filter(original_list, fn x -> rem(x, 2) == 0 end)

# Map the filtered list to get the square of each number
mapped_list = Enum.map(filtered_list, fn x -> x * x end)

# Print the original, filtered, and mapped lists
IO.puts("Original list: #{inspect(original_list)}")
IO.puts("Filtered list (even numbers): #{inspect(filtered_list)}")
IO.puts("Mapped list (squares of even numbers): #{inspect(mapped_list)}")

# Generate a random filename
random_filename = "elixir_result_#{:rand.uniform(10000)}.txt"

# Write the result to the file
File.write!(random_filename, "Original list: #{inspect(original_list)}\nFiltered list (even numbers): #{inspect(filtered_list)}\nMapped list (squares of even numbers): #{inspect(mapped_list)}\n")

IO.puts("Results saved to #{random_filename}")

# Return the final result
mapped_list