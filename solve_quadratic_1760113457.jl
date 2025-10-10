# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    D = b^2 - 4*a*c

    if D > 0
        # Два различных вещественных корня
        x1 = (-b + sqrt(D)) / (2*a)
        x2 = (-b - sqrt(D)) / (2*a)
        return (x1, x2)
    elseif D == 0
        # Один корень (кратный)
        x = -b / (2*a)
        return (x,)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Примеры использования
println("Корни уравнения x^2 - 5x + 6 = 0: ", solve_quadratic(1, -5, 6))
println("Корни уравнения x^2 - 2x + 1 = 0: ", solve_quadratic(1, -2, 1))
println("Корни уравнения x^2 + 1 = 0: ", solve_quadratic(1, 0, 1))