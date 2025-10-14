C This file contains a Fortran subprogram to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT(N, A, B, RESULT)
C
C     Calculates the dot product of two vectors A and B.
C
C     Parameters:
C     N      - The number of elements in the vectors (INTEGER).
C     A      - The first vector (REAL array of size N).
C     B      - The second vector (REAL array of size N).
C     RESULT - The resulting dot product (REAL).
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I

      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO

      RETURN
      END