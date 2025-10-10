C This file contains a Fortran subprogram to calculate the dot product of two vectors.
      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Args:
C         A: The first vector (REAL array of size N).
C         B: The second vector (REAL array of size N).
C         N: The number of elements in the vectors (INTEGER).
C         RESULT: The calculated dot product (REAL).
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
C
      RESULT = 0.0
      DO 10 I = 1, N
          RESULT = RESULT + A(I) * B(I)
   10 CONTINUE
C
      RETURN
      END