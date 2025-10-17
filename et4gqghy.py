import numpy as np

# Create two random matrices
matrix_a = np.random.rand(3, 4)
matrix_b = np.random.rand(4, 2)

print('Matrix A:')
print(matrix_a)
print('
Matrix B:')
print(matrix_b)

# Perform matrix multiplication
result = np.dot(matrix_a, matrix_b)
# Alternatively: result = matrix_a @ matrix_b

print('
Result of matrix multiplication (A @ B):')
print(result)
