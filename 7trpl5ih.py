import numpy as np

# Define two matrices
matrix_a = np.array([[1, 2, 3],
                     [4, 5, 6]])

matrix_b = np.array([[7, 8],
                     [9, 10],
                     [11, 12]])

# Perform matrix multiplication
result = np.dot(matrix_a, matrix_b)
# Alternatively: result = matrix_a @ matrix_b

print('Matrix A:')
print(matrix_a)
print('
Matrix B:')
print(matrix_b)
print('
Result of multiplication (A @ B):')
print(result)
