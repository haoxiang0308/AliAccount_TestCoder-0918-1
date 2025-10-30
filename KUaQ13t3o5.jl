"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns a tuple of the two solutions (real or complex)
"""
function solve_quadratic(a, b, c)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    # Calculate the two solutions using the quadratic formula
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
println("Example: Solving x^2 - 5x + 6 = 0")
a, b, c = 1, -5, 6
solutions = solve_quadratic(a, b, c)
println("Solutions: ", solutions)

println("\nExample: Solving x^2 + 2x + 5 = 0 (complex solutions)")
a, b, c = 1, 2, 5
solutions = solve_quadratic(a, b, c)
println("Solutions: ", solutions)