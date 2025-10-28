# Julia script for basic array operations
using Statistics

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return mean(arr)
end

# Function to calculate other basic statistics
function basic_stats(arr)
    println("Array: ", arr)
    println("Sum: ", calculate_sum(arr))
    println("Mean: ", calculate_mean(arr))
    println("Length: ", length(arr))
    println("Minimum: ", minimum(arr))
    println("Maximum: ", maximum(arr))
    println("Standard Deviation: ", std(arr))
    println()
end

# Example arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10, 20, 30, 40, 50]
array3 = [2.5, 3.7, 1.2, 8.9, 5.1]

println("Basic Array Operations in Julia")
println("===============================")

# Perform operations on example arrays
basic_stats(array1)
basic_stats(array2)
basic_stats(array3)

# Create a random array and perform operations
random_array = rand(1:100, 10)  # 10 random integers between 1 and 100
basic_stats(random_array)