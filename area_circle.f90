program area_circle
    implicit none
    real :: radius, area
    real, parameter :: pi = 3.14159265359

    print *, 'Enter the radius of the circle:'
    read *, radius

    area = pi * radius**2

    print *, 'The area of the circle is:', area

end program area_circle