use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
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
        .collect::<String>() + ".txt";

    // Сохраняем данные в файл
    let serialized = serde_json::to_string(&user).unwrap();
    let mut file = File::create(&random_filename).unwrap();
    file.write_all(serialized.as_bytes()).unwrap();
    
    println!("User data saved to file: {}", random_filename);
    println!("User data: {:?}", user);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_user_creation() {
        let user = User {
            name: String::from("Bob"),
            age: 25,
        };
        assert_eq!(user.name, "Bob");
        assert_eq!(user.age, 25);
    }
}