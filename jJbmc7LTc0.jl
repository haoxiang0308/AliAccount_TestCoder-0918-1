# Julia script for basic array operations

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Additional array operations
println("Length of array: ", length(arr))
println("Maximum value: ", maximum(arr))
println("Minimum value: ", minimum(arr))

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]

println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Element-wise operations
println("\nAdding arrays element-wise: ", arr[1:length(arr2)] .+ arr2)
println("Multiplying first array by 2: ", arr .* 2)