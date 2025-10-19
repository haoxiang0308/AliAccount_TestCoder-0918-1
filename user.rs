// Структура пользователя с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создаем экземпляр структуры
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Создан пользователь: {} с возрастом {}", user.name, user.age);
}