import numpy as np
import random
import string

# Create a 3x3 matrix using numpy
matrix = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print("Original Matrix:")
print(matrix)

# Transpose the matrix
transposed_matrix = matrix.T
print("\nTransposed Matrix:")
print(transposed_matrix)

# Generate a random filename with .jl extension
random_filename = "matrix_operation_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".jl"
print(f"\nSaving operations to {random_filename}...")

# Write a comment to the file indicating this is a simulation
with open(random_filename, 'w') as f:
    f.write("# This .jl file contains Python code to simulate Julia matrix operations.\n")
    f.write("# Original Matrix:\n")
    f.write(str(matrix))
    f.write("\n# Transposed Matrix:\n")
    f.write(str(transposed_matrix))

print(f"Operations saved to {random_filename}")