! Fortran subprogram to calculate the dot product of two vectors
subroutine dot_product(vec1, vec2, n, result)
    implicit none
    
    ! Input parameters
    integer, intent(in) :: n                    ! Size of vectors
    real, intent(in) :: vec1(n), vec2(n)       ! Input vectors
    real, intent(out) :: result                ! Result of dot product
    
    ! Local variables
    integer :: i
    real :: sum
    
    ! Calculate dot product
    sum = 0.0
    do i = 1, n
        sum = sum + vec1(i) * vec2(i)
    end do
    
    result = sum
end subroutine dot_product

! Example program to test the subroutine
program test_dot_product
    implicit none
    
    integer, parameter :: n = 3
    real :: vector1(n) = [1.0, 2.0, 3.0]
    real :: vector2(n) = [4.0, 5.0, 6.0]
    real :: result
    
    call dot_product(vector1, vector2, n, result)
    
    print *, 'Vector 1: ', vector1
    print *, 'Vector 2: ', vector2
    print *, 'Dot product: ', result
end program test_dot_product