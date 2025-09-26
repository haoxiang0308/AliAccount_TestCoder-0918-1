# basic_array_operations_42.jl
# A script to demonstrate basic array operations in Julia

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of the array: $array_sum")

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of the array: $array_mean")

# Demonstrate with another array
arr2 = [10.0, 20.0, 30.0, 40.0, 50.0]
println("\nSecond array: $arr2")
println("Sum of the second array: $(sum(arr2))")
println("Mean of the second array: $(mean(arr2))")