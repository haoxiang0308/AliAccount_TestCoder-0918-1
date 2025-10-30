-- Function to calculate the volume of a sphere
function sphere_volume(radius)
    if radius < 0 then
        error("Radius cannot be negative")
    end
    local pi = math.pi
    return (4/3) * pi * radius^3
end

-- Example usage:
-- print(sphere_volume(5)) -- This would calculate the volume of a sphere with radius 5