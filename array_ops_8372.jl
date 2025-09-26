# array_ops_8372.jl

using Statistics

# Define an example array
numbers = [10, 20, 30, 40, 50]

# Calculate the sum
total_sum = sum(numbers)
println("Sum of the array: ", total_sum)

# Calculate the mean
average = mean(numbers)
println("Mean of the array: ", average)

# Demonstrating operations on a 2D array
matrix = [1 2; 3 4; 5 6]
println("2D Array (Matrix):")
display(matrix)
println("\nSum of all elements in the matrix: ", sum(matrix))
println("Mean of all elements in the matrix: ", mean(matrix))

# Using a function for reusability
function calculate_and_print_stats(arr)
    println("\n--- Calculating stats for a new array ---")
    println("Array: ", arr)
    println("Sum: ", sum(arr))
    println("Mean: ", mean(arr))
end

# Example usage of the function
calculate_and_print_stats([5, 15, 25])