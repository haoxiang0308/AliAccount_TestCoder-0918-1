C     Fortran subroutine to calculate dot product of two vectors
      SUBROUTINE DOT_PRODUCT(A, B, N, RESULT)
C
C     Calculate the dot product of two vectors A and B of length N
C
      INTEGER N
      REAL A(N), B(N)
      REAL RESULT
      INTEGER I
C
      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      ENDDO
C
      RETURN
      END