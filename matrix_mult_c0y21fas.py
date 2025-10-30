import numpy as np

def matrix_multiplication():
    """
    Performs matrix multiplication using NumPy
    """
    # Create two random matrices
    matrix_a = np.random.rand(3, 4)
    matrix_b = np.random.rand(4, 2)
    
    print("Matrix A (3x4):")
    print(matrix_a)
    print("\nMatrix B (4x2):")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    print("\nResult of A * B (3x2):")
    print(result)
    
    # Also demonstrate using the @ operator for matrix multiplication
    result_alt = matrix_a @ matrix_b
    print("\nResult using @ operator:")
    print(result_alt)
    
    # Verify both methods give the same result
    print("\nBoth methods give the same result:", np.allclose(result, result_alt))
    
    return result

if __name__ == "__main__":
    print("Performing matrix multiplication with NumPy...")
    result = matrix_multiplication()