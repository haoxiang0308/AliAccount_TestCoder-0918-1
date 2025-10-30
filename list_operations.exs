# Create a list in Elixir
list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filter the list to get only even numbers
filtered_list = Enum.filter(list, fn x -> rem(x, 2) == 0 end)

# Map the filtered list to square each number
mapped_list = Enum.map(filtered_list, fn x -> x * x end)

# Print the results
IO.puts("Original list: #{inspect(list)}")
IO.puts("Filtered list (even numbers): #{inspect(filtered_list)}")
IO.puts("Mapped list (squares of even numbers): #{inspect(mapped_list)}")

# Generate a random filename
random_filename = "random_file_#{:rand.uniform(100000)}.txt"

# Write the results to the random file
File.write!(random_filename, """
Original list: #{inspect(list)}
Filtered list (even numbers): #{inspect(filtered_list)}
Mapped list (squares of even numbers): #{inspect(mapped_list)}
""")

IO.puts("Results saved to #{random_filename}")