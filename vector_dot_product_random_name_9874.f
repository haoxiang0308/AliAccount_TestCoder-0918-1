! This Fortran file contains a subroutine to calculate the dot product of two vectors.
! The subroutine is named 'vector_dot_product'.
! It takes the size of the vectors (n), the two vectors (a and b), and returns the result in 'result'.

subroutine vector_dot_product(n, a, b, result)
    implicit none
    ! Declare the arguments
    integer, intent(in) :: n
    real, intent(in) :: a(n), b(n)
    real, intent(out) :: result

    ! Local variable for the loop index
    integer :: i

    ! Initialize the result to zero
    result = 0.0

    ! Calculate the dot product
    do i = 1, n
        result = result + a(i) * b(i)
    end do

end subroutine vector_dot_product

! Example program to demonstrate the subroutine
program test_dot_product
    implicit none
    integer, parameter :: n = 3
    real :: vector_a(n) = [1.0, 2.0, 3.0]
    real :: vector_b(n) = [4.0, 5.0, 6.0]
    real :: dot_product_result

    ! Call the subroutine
    call vector_dot_product(n, vector_a, vector_b, dot_product_result)

    ! Print the result
    print *, 'Dot product result: ', dot_product_result

end program test_dot_product