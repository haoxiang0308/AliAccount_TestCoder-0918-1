# Basic Array Operations in Julia

# Define a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate sum
sum_result = sum(arr)
println("Sum of array: ", sum_result)

# Calculate mean
mean_result = mean(arr)
println("Mean of array: ", mean_result)

# Additional operations
println("Length of array: ", length(arr))
println("Maximum value: ", maximum(arr))
println("Minimum value: ", minimum(arr))

# Create another array with random numbers
using Random
random_arr = rand(5)  # Array of 5 random numbers between 0 and 1
println("Random array: ", random_arr)
println("Sum of random array: ", sum(random_arr))
println("Mean of random array: ", mean(random_arr))

# Element-wise operations
squared_arr = arr .^ 2
println("Squared array: ", squared_arr)