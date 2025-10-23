"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns the solutions as a tuple (x1, x2), where x1 and x2 may be complex numbers
"""
function solve_quadratic(a::Number, b::Number, c::Number)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    # Calculate the two solutions using the quadratic formula
    sqrt_discriminant = sqrt(complex(discriminant))  # Use complex to handle negative discriminants
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    
    return x1, x2
end

# Example usage:
# a, b, c = 1, -5, 6  # x^2 - 5x + 6 = 0
# solutions = solve_quadratic(a, b, c)
# println("Solutions: ", solutions)