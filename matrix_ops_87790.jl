# Julia script to create a matrix and perform transpose operation

# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix:")
display(matrix)

# Perform transpose operation
transposed_matrix = transpose(matrix)

println("\nTransposed matrix:")
display(transposed_matrix)

# Alternative syntax for transpose
transposed_matrix_alt = matrix'

println("\nTransposed matrix (using ' operator):")
display(transposed_matrix_alt)

# Create another example with a non-square matrix
rect_matrix = [1 2 3 4; 5 6 7 8]

println("\nOriginal rectangular matrix:")
display(rect_matrix)

println("\nTransposed rectangular matrix:")
display(transpose(rect_matrix))