// Определение структуры User в Rust
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };
    
    println!("User data: name='{}', age={}", user.name, user.age);
}