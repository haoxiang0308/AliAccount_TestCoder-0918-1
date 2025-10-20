"""
Функция для решения квадратного уравнения вида ax^2 + bx + c = 0
Возвращает корни уравнения в виде кортежа (x1, x2)
"""
function solve_quadratic(a::Float64, b::Float64, c::Float64)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Два различных действительных корня
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один действительный корень (кратный корень)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Пример использования:
# a, b, c = 1.0, -5.0, 6.0  # Уравнение x^2 - 5x + 6 = 0
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)