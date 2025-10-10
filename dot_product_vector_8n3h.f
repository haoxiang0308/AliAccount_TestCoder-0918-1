C This Fortran program demonstrates a subroutine to calculate the dot product of two vectors.
      PROGRAM MAIN
          INTEGER N
          PARAMETER (N=3)
          REAL A(N), B(N), RESULT
          DATA A /1.0, 2.0, 3.0/
          DATA B /4.0, 5.0, 6.0/
          
          CALL DOT_PRODUCT_VECTOR(A, B, N, RESULT)
          PRINT *, 'Dot Product Result: ', RESULT
      END
      
C Subroutine to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VECTOR(VEC1, VEC2, SIZE, RESULT)
          INTEGER SIZE
          REAL VEC1(SIZE), VEC2(SIZE), RESULT
          INTEGER I
          
          RESULT = 0.0
          DO 10 I = 1, SIZE
              RESULT = RESULT + VEC1(I) * VEC2(I)
   10     CONTINUE
      END