! Fortran program to calculate the area of a circle
program circle_area
    implicit none
    real, parameter :: pi = 3.14159265359
    real :: radius, area
    
    ! Prompt user for radius
    write(*,*) 'Enter the radius of the circle:'
    read(*,*) radius
    
    ! Calculate area
    area = pi * radius * radius
    
    ! Display result
    write(*,*) 'The area of the circle with radius', radius, 'is:', area
    
end program circle_area