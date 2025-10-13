-- Функция для вычисления площади круга по радиусу
function circleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local r = 5
local area = circleArea(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)