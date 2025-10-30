C     Fortran subprogram to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      
      RESULT = 0.0
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END
      
C     Example program to demonstrate the usage of the subroutine
      PROGRAM TEST_DOT_PRODUCT
      INTEGER N
      PARAMETER (N = 5)
      REAL A(N), B(N), RESULT
      
      INTEGER I
      
C     Initialize test vectors
      DO I = 1, N
        A(I) = I * 1.0
        B(I) = (N + 1 - I) * 1.0
      END DO
      
C     Calculate dot product
      CALL DOT_PRODUCT_VEC(N, A, B, RESULT)
      
C     Print result
      PRINT *, 'Vector A: '
      DO I = 1, N
        PRINT *, A(I)
      END DO
      
      PRINT *, 'Vector B: '
      DO I = 1, N
        PRINT *, B(I)
      END DO
      
      PRINT *, 'Dot product: ', RESULT
      
      STOP
      END