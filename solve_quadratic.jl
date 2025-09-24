function solve_quadratic(a, b, c)
    discriminant = b^2 - 4a*c
    if discriminant > 0
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2a)
        x2 = (-b - sqrt_discriminant) / (2a)
        return (x1, x2)
    elseif discriminant == 0
        x = -b / (2a)
        return (x, x)
    else
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2a)
        x2 = (-b - sqrt_discriminant) / (2a)
        return (x1, x2)
    end
end