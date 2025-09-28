// Структура пользователя
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра пользователя
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Вывод информации о пользователе
    println!("User: {}, Age: {}", user.name, user.age);
}