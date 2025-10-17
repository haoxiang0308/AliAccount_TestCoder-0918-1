# Julia script for basic array operations

# Function to calculate sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of an array
function calculate_mean(arr)
    return mean(arr)
end

# Function to calculate maximum value in an array
function calculate_max(arr)
    return maximum(arr)
end

# Function to calculate minimum value in an array
function calculate_min(arr)
    return minimum(arr)
end

# Function to calculate standard deviation of an array
function calculate_std(arr)
    return std(arr)
end

# Import Statistics module for mean and std functions
using Statistics

# Example array
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", my_array)

# Perform basic array operations
println("Sum of array elements: ", calculate_sum(my_array))
println("Mean of array elements: ", calculate_mean(my_array))
println("Maximum value in array: ", calculate_max(my_array))
println("Minimum value in array: ", calculate_min(my_array))
println("Standard deviation of array: ", calculate_std(my_array))

# Additional operations
println("Length of array: ", length(my_array))
println("Sorted array: ", sort(my_array))
println("Reversed array: ", reverse(my_array))

# Create another example with random numbers
random_array = rand(1:100, 10)
println("\nRandom array: ", random_array)
println("Sum of random array: ", calculate_sum(random_array))
println("Mean of random array: ", calculate_mean(random_array))