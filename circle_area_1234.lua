-- Функция для вычисления площади круга
function area_of_circle(radius)
    local pi = math.pi
    return pi * radius * radius
end

-- Пример использования функции
local r = 5
local area = area_of_circle(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)