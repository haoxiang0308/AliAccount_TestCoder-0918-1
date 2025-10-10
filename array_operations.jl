# array_operations.jl: Basic array operations in Julia

# Define a sample array
arr = [1, 2, 3, 4, 5]

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of the array: $sum_result")

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of the array: $mean_result")

# Perform operations on a different array
arr2 = [10.0, 20.0, 30.0]
println("\nFor the array $arr2:")
println("Sum: $(sum(arr2))")
println("Mean: $(mean(arr2))")