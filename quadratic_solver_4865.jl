using LinearAlgebra

"""
    solve_quadratic(a, b, c)

Solve the quadratic equation ax² + bx + c = 0.

# Arguments
- `a::Number`: coefficient of x²
- `b::Number`: coefficient of x
- `c::Number`: constant term

# Returns
- A tuple containing the solutions. The solutions can be real or complex numbers.
"""
function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return ("Infinite solutions",)
            else
                return ("No solution",)
        else
            # Linear equation: bx + c = 0
            return (-c/b,)
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two distinct real solutions
        root1 = (-b + √discriminant) / (2*a)
        root2 = (-b - √discriminant) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One repeated real solution
        root = -b / (2*a)
        return (root,)
    else
        # Two complex solutions
        real_part = -b / (2*a)
        imaginary_part = √(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return (root1, root2)
    end
end

# Example usage:
# solve_quadratic(1, -3, 2)   # Should return (2.0, 1.0)
# solve_quadratic(1, -2, 1)   # Should return (1.0,)
# solve_quadratic(1, 0, 1)    # Should return (0.0+1.0im, 0.0-1.0im)