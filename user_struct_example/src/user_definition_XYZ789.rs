// Определение структуры User с полями name и age
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры User
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User created: {}, age {}", user1.name, user1.age);
}