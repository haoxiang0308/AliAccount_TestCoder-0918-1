# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных вещественных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один вещественный корень (или два одинаковых)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        sqrt_discriminant = sqrt(Complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Примеры использования
println("Корни уравнения x^2 - 5x + 6 = 0: ", solve_quadratic(1, -5, 6))
println("Корни уравнения x^2 - 2x + 1 = 0: ", solve_quadratic(1, -2, 1))
println("Корни уравнения x^2 + 1 = 0: ", solve_quadratic(1, 0, 1))