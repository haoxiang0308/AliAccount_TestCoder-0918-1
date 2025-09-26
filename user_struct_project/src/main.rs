// Определение структуры User
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Пример создания экземпляра структуры
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User: {}, Age: {}", user1.name, user1.age);
}