# Function to solve quadratic equation ax^2 + bx + c = 0
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
            return [-c/b]
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return [root1, root2]
    elseif discriminant == 0
        # One real solution
        root = -b / (2*a)
        return [root]
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        return [complex(real_part, imaginary_part), complex(real_part, -imaginary_part)]
    end
end

# Example usage:
# solve_quadratic(1, -3, 2)  # Should return [2.0, 1.0]
# solve_quadratic(1, -2, 1)  # Should return [1.0]
# solve_quadratic(1, 0, 1)   # Should return [0.0+1.0im, 0.0-1.0im]