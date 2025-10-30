// Función Zig que devuelve el máximo de dos números
fn max(a: i32, b: i32) -> i32 {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

// Ejemplo de uso
pub fn main() void {
    const result = max(10, 20);
    @import("std").debug.print("El máximo es: {}\n", .{result});
}