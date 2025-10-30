function solve_linear(a, b)
    if a == 0
        if b == 0
            return "Infinitas soluciones"
        else
            return "No tiene solución"
        end
    else
        return -b / a
    end
end