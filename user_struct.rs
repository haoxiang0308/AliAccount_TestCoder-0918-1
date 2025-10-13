use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    // Генерируем случайное имя файла на основе текущего времени
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_secs();
    let filename = format!("user_data_{}.rs", now);

    let mut file = File::create(&filename).expect("Unable to create file");
    writeln!(file, "User {{ name: \"{}\", age: {} }}", user.name, user.age).expect("Unable to write data");

    println!("Структура пользователя сохранена в файл: {}", filename);
}