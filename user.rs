// Определение структуры User в Rust
struct User {
    name: String,
    age: u32,
}

// Пример создания экземпляра структуры
fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };
    
    println!("User created: {}, age {}", user.name, user.age);
}