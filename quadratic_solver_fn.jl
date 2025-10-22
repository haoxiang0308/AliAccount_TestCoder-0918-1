function solve_quadratic(a, b, c)
    """
    Solves a quadratic equation of the form ax^2 + bx + c = 0
    Returns a tuple of the two solutions (which may be the same if discriminant is 0)
    """
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution (repeated root)
        x = -b / (2*a)
        return (x, x)
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Example usage:
# a, b, c = 1, -5, 6  # x^2 - 5x + 6 = 0
# solutions = solve_quadratic(a, b, c)
# println("Solutions: ", solutions)