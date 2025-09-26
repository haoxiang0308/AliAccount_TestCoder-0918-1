# basic_array_ops.jl
# This script demonstrates basic array operations in Julia.

# Define a sample array
arr = [10, 20, 30, 40, 50]

println("Original Array: ", arr)

# Calculate the sum of the array elements
sum_result = sum(arr)
println("Sum of elements: ", sum_result)

# Calculate the mean of the array elements
mean_result = mean(arr)
println("Mean of elements: ", mean_result)

# Other common operations
println("Maximum value: ", maximum(arr))
println("Minimum value: ", minimum(arr))
println("Length of array: ", length(arr))