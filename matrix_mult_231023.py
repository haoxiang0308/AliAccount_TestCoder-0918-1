import numpy as np

def matrix_multiply(A, B):
    """
    Performs matrix multiplication of two numpy arrays.
    
    Args:
        A (numpy.ndarray): First matrix
        B (numpy.ndarray): Second matrix
    
    Returns:
        numpy.ndarray: Result of matrix multiplication A @ B
    """
    return np.dot(A, B)

def main():
    # Example matrices
    A = np.array([[1, 2], [3, 4]])
    B = np.array([[5, 6], [7, 8]])
    
    print("Matrix A:")
    print(A)
    print("\nMatrix B:")
    print(B)
    
    # Perform matrix multiplication
    result = matrix_multiply(A, B)
    
    print("\nResult of A @ B:")
    print(result)

if __name__ == "__main__":
    main()