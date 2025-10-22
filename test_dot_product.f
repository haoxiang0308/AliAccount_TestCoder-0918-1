C     Test program for dot product subroutine
      PROGRAM TEST_DOT_PRODUCT
      REAL A(3), B(3), RESULT
      
C     Initialize test vectors
      A(1) = 1.0
      A(2) = 2.0
      A(3) = 3.0
      
      B(1) = 4.0
      B(2) = 5.0
      B(3) = 6.0
      
C     Call the dot product subroutine
      CALL DOT_PRODUCT_VEC(3, A, B, RESULT)
      
C     Print the result
      PRINT *, 'Dot product result: ', RESULT
      
      STOP
      END

C     Fortran subroutine to calculate dot product of two vectors
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