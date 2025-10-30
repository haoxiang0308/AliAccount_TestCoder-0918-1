import numpy as np

def matrix_multiply(A, B):
    """
    Performs matrix multiplication of two numpy arrays.
    
    Args:
        A (numpy.ndarray): First matrix
        B (numpy.ndarray): Second matrix
    
    Returns:
        numpy.ndarray: Result of matrix multiplication A * B
    """
    return np.dot(A, B)

# Example usage
if __name__ == "__main__":
    # Create two random matrices
    A = np.random.rand(3, 4)
    B = np.random.rand(4, 2)
    
    print("Matrix A (3x4):")
    print(A)
    print("\nMatrix B (4x2):")
    print(B)
    
    # Perform matrix multiplication
    result = matrix_multiply(A, B)
    
    print("\nResult of A * B (3x2):")
    print(result)
    
    # Verify dimensions
    print(f"\nDimensions check: A is {A.shape}, B is {B.shape}, Result is {result.shape}")