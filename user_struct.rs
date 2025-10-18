use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
use serde_json;
use rand::{distributions::Alphanumeric, Rng};

#[derive(Serialize, Deserialize, Debug)]
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

    // Генерируем случайное имя файла
    let random_filename: String = rand::thread_rng()
        .sample_iter(&Alphanumeric)
        .take(10)
        .map(char::from)
        .collect::<String>() + ".json";

    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string(&user).expect("Serialization failed");
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(json_data.as_bytes()).expect("Write failed");

    println!("User data saved to file: {}", random_filename);
    println!("User: {:?}", user);
}

// Зависимости, которые понадобятся (обычно указываются в Cargo.toml):
// serde = { version = "1.0", features = ["derive"] }
// serde_json = "1.0"
// rand = "0.8"