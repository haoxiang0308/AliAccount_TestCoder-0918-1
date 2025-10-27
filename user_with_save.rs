use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

// Определение структуры User в Rust
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Генерируем "случайное" имя файла на основе текущего времени
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", since_the_epoch.as_nanos());

    // Сохраняем данные в файл (в формате, который можно прочитать)
    let mut file = File::create(&random_filename)
        .expect("Unable to create file");
    
    writeln!(file, "name: {}", user.name)
        .expect("Unable to write name");
    writeln!(file, "age: {}", user.age)
        .expect("Unable to write age");
    
    println!("User data saved to file: {}", random_filename);
    println!("User data: name='{}', age={}", user.name, user.age);
}