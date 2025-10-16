"""
Function to solve quadratic equations of the form ax² + bx + c = 0
Returns a tuple of the two solutions (real or complex)
"""
function solve_quadratic(a::Number, b::Number, c::Number)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    # Calculate solutions using quadratic formula
    sqrt_discriminant = sqrt(complex(discriminant))  # Use complex to handle negative discriminants
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    
    return x1, x2
end

# Example usage:
# a, b, c = 1, -5, 6  # x² - 5x + 6 = 0
# solutions = solve_quadratic(a, b, c)
# println("Solutions: ", solutions)