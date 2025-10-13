import numpy as np

# Define two matrices
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# Perform matrix multiplication
result = np.dot(A, B)
# Alternatively, you can use the @ operator: result = A @ B

print("Matrix A:")
print(A)
print("\nMatrix B:")
print(B)
print("\nResult of A * B:")
print(result)
