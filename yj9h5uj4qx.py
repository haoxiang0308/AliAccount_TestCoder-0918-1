import numpy as np

def matrix_multiplication_demo():
    """
    Demonstrates matrix multiplication using NumPy
    """
    print("NumPy Matrix Multiplication Demo")
    print("=" * 35)
    
    # Create two random matrices
    matrix_a = np.array([[1, 2, 3],
                         [4, 5, 6]])
    
    matrix_b = np.array([[7, 8],
                         [9, 10],
                         [11, 12]])
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication using np.dot()
    result_dot = np.dot(matrix_a, matrix_b)
    print("\nResult of A × B using np.dot():")
    print(result_dot)
    
    # Alternative method using @ operator (Python 3.5+)
    result_at = matrix_a @ matrix_b
    print("\nResult of A @ B using @ operator:")
    print(result_at)
    
    # Another alternative using np.matmul()
    result_matmul = np.matmul(matrix_a, matrix_b)
    print("\nResult of A × B using np.matmul():")
    print(result_matmul)
    
    # Verify all methods give the same result
    print("\nAll methods give the same result:", 
          np.array_equal(result_dot, result_at) and 
          np.array_equal(result_at, result_matmul))
    
    # Additional example with random matrices
    print("\n" + "=" * 35)
    print("Random 3x3 matrices example:")
    
    random_matrix_1 = np.random.rand(3, 3)
    random_matrix_2 = np.random.rand(3, 3)
    
    print("Random Matrix 1:")
    print(random_matrix_1)
    print("\nRandom Matrix 2:")
    print(random_matrix_2)
    
    result_random = np.dot(random_matrix_1, random_matrix_2)
    print("\nResult of Random Matrix 1 × Random Matrix 2:")
    print(result_random)

if __name__ == "__main__":
    matrix_multiplication_demo()