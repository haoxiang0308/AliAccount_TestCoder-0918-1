# Basic Array Operations in Julia

# Function to calculate the sum of an array
function array_sum(arr)
    return sum(arr)
end

# Function to calculate the mean of an array
function array_mean(arr)
    return mean(arr)
end

# Function to calculate both sum and mean
function array_stats(arr)
    s = array_sum(arr)
    m = array_mean(arr)
    return s, m
end

# Example usage
println("Basic Array Operations in Julia")
println("="^30)

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Sample array: ", sample_array)

# Calculate sum
total = array_sum(sample_array)
println("Sum: ", total)

# Calculate mean
avg = array_mean(sample_array)
println("Mean: ", avg)

# Calculate both using the combined function
sum_val, mean_val = array_stats(sample_array)
println("Sum and Mean (from combined function): ", sum_val, ", ", mean_val)

# Try with a different array
float_array = [1.5, 2.7, 3.2, 4.8, 5.1]
println("\nFloat array: ", float_array)
sum_val2, mean_val2 = array_stats(float_array)
println("Sum and Mean: ", sum_val2, ", ", mean_val2)