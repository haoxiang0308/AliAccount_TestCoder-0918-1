# Julia script for basic array operations

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return sum(arr) / length(arr)
end

# Example usage
println("Basic Array Operations in Julia")

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Sample array: ", sample_array)

# Calculate and display sum
array_sum = calculate_sum(sample_array)
println("Sum of array elements: ", array_sum)

# Calculate and display mean
array_mean = calculate_mean(sample_array)
println("Mean of array elements: ", array_mean)

# Test with another array
another_array = [10, 20, 30, 40, 50]
println("\nAnother array: ", another_array)
println("Sum: ", calculate_sum(another_array))
println("Mean: ", calculate_mean(another_array))