C This file contains a Fortran subroutine to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT(N, A, B, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Parameters:
C     N      - The number of elements in the vectors (integer)
C     A      - The first vector (array of real numbers)
C     B      - The second vector (array of real numbers)
C     RESULT - The result of the dot product (real number, output)
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