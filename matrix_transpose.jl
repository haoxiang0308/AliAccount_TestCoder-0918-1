# Julia code to create a matrix and perform transpose operation

# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original Matrix:")
display(matrix)

# Perform transpose operation
transposed_matrix = transpose(matrix)

println("\nTransposed Matrix:")
display(transposed_matrix)

# Alternative way to transpose using the ' operator
transposed_matrix_alt = matrix'

println("\nTransposed Matrix (using ' operator):")
display(transposed_matrix_alt)

# Create another example with a non-square matrix
matrix2 = [1 2 3 4; 5 6 7 8]

println("\nOriginal Non-Square Matrix:")
display(matrix2)

transposed_matrix2 = matrix2'

println("\nTransposed Non-Square Matrix:")
display(transposed_matrix2)