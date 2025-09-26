# array_operations.jl
# This script demonstrates basic array operations in Julia.

# Define a sample array
numbers = [10, 20, 30, 40, 50]

# Calculate the sum of the array
total_sum = sum(numbers)
println("The sum of the array is: ", total_sum)

# Calculate the mean of the array
average = mean(numbers)
println("The mean of the array is: ", average)

# Demonstrate with another array of different data type
float_numbers = [1.5, 2.7, 3.2, 4.8, 5.1]
println("\nFor the float array [", join(float_numbers, ", "), "]:")
println("Sum: ", sum(float_numbers))
println("Mean: ", mean(float_numbers))
