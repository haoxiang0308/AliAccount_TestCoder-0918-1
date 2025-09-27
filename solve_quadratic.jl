function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    D = b^2 - 4*a*c

    if D > 0
        # Два различных действительных корня
        root1 = (-b + sqrt(D)) / (2*a)
        root2 = (-b - sqrt(D)) / (2*a)
        return (root1, root2)
    elseif D == 0
        # Один действительный корень (кратный)
        root = -b / (2*a)
        return (root,)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        return (complex(real_part, imag_part), complex(real_part, -imag_part))
    end
end

# Примеры использования
println("Корни уравнения x^2 - 5x + 6 = 0: ", solve_quadratic(1, -5, 6))
println("Корни уравнения x^2 - 2x + 1 = 0: ", solve_quadratic(1, -2, 1))
println("Корни уравнения x^2 + 1 = 0: ", solve_quadratic(1, 0, 1))