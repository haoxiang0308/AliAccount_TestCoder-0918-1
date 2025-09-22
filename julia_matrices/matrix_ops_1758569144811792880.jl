# Julia script for matrix creation and transposition

# Create a 3x4 matrix filled with random numbers
original_matrix = rand(3, 4)

println("Original Matrix:")
println(original_matrix)

# Transpose the matrix
transposed_matrix = transpose(original_matrix)

println("\nTransposed Matrix:")
println(transposed_matrix)

# Save the matrices to a file for later use
using DelimitedFiles

writedlm("original_matrix.txt", original_matrix, ' ')
writedlm("transposed_matrix.txt", transposed_matrix, ' ')

println("\nMatrices saved to 'original_matrix.txt' and 'transposed_matrix.txt'")