"""
Solve a quadratic equation of the form ax^2 + bx + c = 0
Returns the roots as a tuple (root1, root2)
If the roots are complex, they will be returned as Complex numbers
"""
function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions"
            else
                return "No solution"
            end
        else
            # Linear equation: bx + c = 0
            root = -c / b
            return (root, nothing)
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return (root, root)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = Complex(real_part, imaginary_part)
        root2 = Complex(real_part, -imaginary_part)
        return (root1, root2)
    end
end

# Example usage:
# roots = solve_quadratic(1, -5, 6)  # x^2 - 5x + 6 = 0
# println(roots)  # Should print (3.0, 2.0)