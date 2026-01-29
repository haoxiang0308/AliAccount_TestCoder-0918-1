program circle_area
    implicit none
    real :: radius, area
    real, parameter :: pi = 3.14159265358979323846

    ! Prompt for radius input
    print *, 'Enter the radius of the circle:'
    read *, radius

    ! Calculate area of circle: A = pi * r^2
    area = pi * radius * radius

    ! Display the result
    print *, 'The area of the circle with radius ', radius, ' is: ', area

end program circle_area
