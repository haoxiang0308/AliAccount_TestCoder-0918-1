function calculateCircleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования:
-- local area = calculateCircleArea(5)
-- print("Площадь круга: " .. area)