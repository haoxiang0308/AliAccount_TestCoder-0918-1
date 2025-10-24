use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;
use rand::Rng;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Генерируем случайное имя файла
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string(&user)?;
    let mut file = File::create(&random_filename)?;
    file.write_all(json_data.as_bytes())?;
    
    println!("Данные пользователя сохранены в файл: {}", random_filename);
    Ok(())
}