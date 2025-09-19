import numpy as np

def matrix_multiply_demo():
    # Create two random matrices
    matrix_a = np.random.rand(3, 4)
    matrix_b = np.random.rand(4, 3)
    
    print("Matrix A (3x4):")
    print(matrix_a)
    print("\nMatrix B (4x3):")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    print("\nMatrix Multiplication Result (A × B):")
    print(result)
    
    # Demonstrate element-wise multiplication for comparison
    print("\nElement-wise multiplication (A * B) requires same dimensions,")
    print("so let's create two 3x3 matrices for this demo:")
    
    matrix_c = np.random.rand(3, 3)
    matrix_d = np.random.rand(3, 3)
    
    print("\nMatrix C (3x3):")
    print(matrix_c)
    print("\nMatrix D (3x3):")
    print(matrix_d)
    
    elementwise_result = np.multiply(matrix_c, matrix_d)
    
    print("\nElement-wise Multiplication Result (C * D):")
    print(elementwise_result)

if __name__ == "__main__":
    matrix_multiply_demo()