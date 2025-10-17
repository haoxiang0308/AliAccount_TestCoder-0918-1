function area_of_circle(radius)
    local pi = math.pi
    return pi * radius * radius
end

-- Пример использования
local radius = 5
local area = area_of_circle(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)