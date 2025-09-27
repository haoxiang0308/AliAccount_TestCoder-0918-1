# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Проверка, является ли 'a' нулем
    if a == 0
        if b == 0
            # Если a и b равны нулю, уравнение не является квадратным и не имеет решений (если c != 0)
            if c == 0
                println("Уравнение 0 = 0, x может быть любым числом.")
                return []
            else
                println("Уравнение $c = 0 не имеет решений.")
                return []
            end
        else
            # Линейное уравнение bx + c = 0
            x = -c / b
            println("Уравнение не является квадратным. Решение: x = $x")
            return [x]
        end
    end

    # Вычисление дискриминанта
    discriminant = b^2 - 4*a*c
    println("Дискриминант: $discriminant")

    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        println("Два действительных корня: x1 = $x1, x2 = $x2")
        return [x1, x2]
    elseif discriminant == 0
        # Один действительный корень (кратный корень)
        x = -b / (2*a)
        println("Один действительный корень: x = $x")
        return [x]
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        println("Комплексные корни: x1 = $x1, x2 = $x2")
        return [x1, x2]
    end
end

# Примеры использования
println("Пример 1: x^2 - 5x + 6 = 0")
solve_quadratic(1, -5, 6)

println("\nПример 2: x^2 + 2x + 1 = 0")
solve_quadratic(1, 2, 1)

println("\nПример 3: x^2 + 1 = 0")
solve_quadratic(1, 0, 1)