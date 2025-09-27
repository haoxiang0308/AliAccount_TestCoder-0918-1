# Define an example array
arr = [10, 20, 30, 40, 50]

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of the array: $sum_result")

# Calculate the mean of the array
mean_result = sum(arr) / length(arr) # Using basic calculation
println("Mean of the array (calculated): $mean_result")

# Alternatively, using the Statistics package for mean
using Statistics
mean_result_stats = mean(arr)
println("Mean of the array (using Statistics.mean): $mean_result_stats")
