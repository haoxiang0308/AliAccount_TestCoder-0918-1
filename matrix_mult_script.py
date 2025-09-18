import numpy as np

# Create two random matrices
matrix_a = np.random.rand(3, 3)
matrix_b = np.random.rand(3, 3)

print("Matrix A:")
print(matrix_a)
print("\nMatrix B:")
print(matrix_b)

# Perform matrix multiplication
result = np.dot(matrix_a, matrix_b)

print("\nResult of A × B:")
print(result)

# Verify the result with element-wise multiplication for comparison
elementwise_result = matrix_a * matrix_b

print("\nElement-wise multiplication (A * B):")
print(elementwise_result)