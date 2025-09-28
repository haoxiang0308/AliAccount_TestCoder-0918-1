# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Проверка на линейное уравнение
    if a == 0
        if b == 0
            # 0 = 0 или c = 0
            return c == 0 ? "Infinite solutions" : "No solution"
        else
            # bx + c = 0
            return [-c / b]
        end
    end

    # Вычисление дискриминанта
    D = b^2 - 4*a*c

    if D > 0
        # Два различных действительных корня
        sqrt_D = sqrt(D)
        x1 = (-b + sqrt_D) / (2*a)
        x2 = (-b - sqrt_D) / (2*a)
        return [x1, x2]
    elseif D == 0
        # Один действительный корень (кратный)
        x = -b / (2*a)
        return [x]
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return [x1, x2]
    end
end

# Пример использования
println("Примеры решений квадратного уравнения ax^2 + bx + c = 0")
println("Корни для 1x^2 + -3x + 2 = 0: ", solve_quadratic(1, -3, 2))
println("Корни для 1x^2 + -2x + 1 = 0: ", solve_quadratic(1, -2, 1))
println("Корни для 1x^2 + 0x + 1 = 0: ", solve_quadratic(1, 0, 1))
println("Корни для 0x^2 + 2x + -4 = 0: ", solve_quadratic(0, 2, -4))