function solve_quadratic(a, b, c)
    discriminant = b^2 - 4*a*c
    if discriminant > 0
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        root = -b / (2*a)
        return (root, root)
    else
        realPart = -b / (2*a)
        imagPart = sqrt(-discriminant) / (2*a)
        return (complex(realPart, imagPart), complex(realPart, -imagPart))
    end
end
