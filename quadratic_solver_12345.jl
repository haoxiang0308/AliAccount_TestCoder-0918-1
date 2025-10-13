function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение ax^2 + bx + c = 0.
    Возвращает кортеж (x1, x2), где x1 и x2 могут быть комплексными числами.
    """
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = sqrt(complex(discriminant))
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    return x1, x2
end

# Пример использования
println("Пример: a=1, b=-3, c=2 (x^2 - 3x + 2 = 0)")
roots = solve_quadratic(1, -3, 2)
println("Корни: $(roots[1]), $(roots[2])")