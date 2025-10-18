# Julia script to create a matrix and perform transpose operation

# Create a 3x3 matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix:")
display(matrix)

# Perform transpose operation
transposed_matrix = transpose(matrix)

println("\nTransposed matrix:")
display(transposed_matrix)

# Create another example with a non-square matrix
println("\n" * "="^40)
println("Another example with a 2x4 matrix:")

matrix2 = [1 2 3 4; 5 6 7 8]

println("Original matrix:")
display(matrix2)

transposed_matrix2 = transpose(matrix2)

println("\nTransposed matrix:")
display(transposed_matrix2)