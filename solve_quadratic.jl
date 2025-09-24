function solve_quadratic(a, b, c)
    # Проверка, является ли уравнение квадратным
    if a == 0
        error("Коэффициент 'a' не может быть равен нулю для квадратного уравнения.")
    end

    # Вычисление дискриминанта
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один действительный корень (кратный)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Примеры использования
println("Примеры решения квадратного уравнения ax^2 + bx + c = 0")
println("Корни для a=1, b=-5, c=6: ", solve_quadratic(1, -5, 6))
println("Корни для a=1, b=-2, c=1: ", solve_quadratic(1, -2, 1))
println("Корни для a=1, b=0, c=1: ", solve_quadratic(1, 0, 1))