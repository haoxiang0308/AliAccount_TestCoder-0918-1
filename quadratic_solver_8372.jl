# Function to solve quadratic equation ax² + bx + c = 0
function solve_quadratic(a, b, c)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return ("Two real roots", root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return ("One real root", root, root)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return ("Complex roots", root1, root2)
    end
end

# Example usage
println("Example: solving x² - 5x + 6 = 0")
result = solve_quadratic(1, -5, 6)
println(result)

println("\nExample: solving x² + 2x + 5 = 0 (complex roots)")
result = solve_quadratic(1, 2, 5)
println(result)

println("\nExample: solving x² - 4x + 4 = 0 (one root)")
result = solve_quadratic(1, -4, 4)
println(result)