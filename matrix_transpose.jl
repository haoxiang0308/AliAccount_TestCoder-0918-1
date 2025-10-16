# Julia script to create a matrix and perform transpose operation

# Create a sample matrix
A = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix A:")
display(A)

# Perform transpose operation
A_transpose = transpose(A)

println("\nTransposed matrix A':")
display(A_transpose)

# Alternative syntax for transpose
A_transpose_alt = A'

println("\nTransposed matrix A' (using ' operator):")
display(A_transpose_alt)

# Create another example with a non-square matrix
B = [1 2 3 4; 5 6 7 8]

println("\nOriginal matrix B:")
display(B)

B_transpose = B'

println("\nTransposed matrix B':")
display(B_transpose)