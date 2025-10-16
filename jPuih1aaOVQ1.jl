"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns a tuple of the two solutions (x1, x2), or throws an error if a = 0
"""
function solve_quadratic(a::Number, b::Number, c::Number)
    if a == 0
        throw(ArgumentError("Coefficient 'a' cannot be zero for a quadratic equation"))
    end
    
    discriminant = b^2 - 4*a*c
    
    if discriminant >= 0
        # Real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    else
        # Complex solutions
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should return (3.0, 2.0)
# println(solve_quadratic(1, 0, 1))   # Should return complex solutions