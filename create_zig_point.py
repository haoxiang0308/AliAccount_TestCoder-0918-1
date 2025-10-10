import random
import string
import os

# Определяем содержимое файла на Zig
zig_code = '''const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() void {
    const my_point = Point{ .x = 3.14, .y = 2.71 };
    std.debug.print("Point: {{x={d}, y={d}}}\\n", .{ my_point.x, my_point.y });
}
'''

# Генерируем случайное имя файла
random_filename = "point_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".zig"

# Полный путь к файлу
full_path = os.path.join("/workspace", random_filename)

# Сохраняем код в файл
with open(full_path, 'w') as f:
    f.write(zig_code)

print(f"Файл Zig успешно создан: {full_path}")