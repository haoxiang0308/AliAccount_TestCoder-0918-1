import numpy as np

def matrix_multiply_demo():
    # Create two sample matrices
    matrix_a = np.array([[1, 2, 3],
                         [4, 5, 6]])
    
    matrix_b = np.array([[7, 8],
                         [9, 10],
                         [11, 12]])
    
    # Perform matrix multiplication using np.dot()
    result_dot = np.dot(matrix_a, matrix_b)
    
    # Perform matrix multiplication using @ operator (Python 3.5+)
    result_at = matrix_a @ matrix_b
    
    # Perform matrix multiplication using np.matmul()
    result_matmul = np.matmul(matrix_a, matrix_b)
    
    # Display the results
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    print("\nResult using np.dot():")
    print(result_dot)
    print("\nResult using @ operator:")
    print(result_at)
    print("\nResult using np.matmul():")
    print(result_matmul)
    
    # Verify that all methods produce the same result
    print("\nAll methods produce the same result:", 
          np.array_equal(result_dot, result_at) and np.array_equal(result_dot, result_matmul))

if __name__ == "__main__":
    matrix_multiply_demo()