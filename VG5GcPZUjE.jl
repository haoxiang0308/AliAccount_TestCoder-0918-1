# Julia script for basic array operations

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return mean(arr)
end

# Example usage
println("Basic Array Operations in Julia")

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Sample array: ", sample_array)

# Calculate sum
array_sum = calculate_sum(sample_array)
println("Sum of array elements: ", array_sum)

# Calculate mean
array_mean = calculate_mean(sample_array)
println("Mean of array elements: ", array_mean)

# Additional examples with different arrays
println("\nAdditional examples:")
arr1 = [10, 20, 30]
println("Array: ", arr1, " | Sum: ", calculate_sum(arr1), " | Mean: ", calculate_mean(arr1))

arr2 = [2.5, 3.7, 1.2, 8.9, 5.1]
println("Array: ", arr2, " | Sum: ", calculate_sum(arr2), " | Mean: ", calculate_mean(arr2))

# Example with empty array handling
empty_arr = Float64[]
if !isempty(empty_arr)
    println("Empty array sum: ", calculate_sum(empty_arr))
    println("Empty array mean: ", calculate_mean(empty_arr))
else
    println("Empty array provided - cannot calculate sum or mean")
end