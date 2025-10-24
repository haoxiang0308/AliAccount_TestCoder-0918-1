use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

// Структура пользователя с полями имя и возраст
#[derive(Debug, Clone)]
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    // Конструктор для создания нового пользователя
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
    
    // Метод для сохранения пользователя в файл
    pub fn save_to_file(&self, filename: &str) -> std::io::Result<()> {
        let mut file = File::create(filename)?;
        let data = format!("Name: {}\nAge: {}", self.name, self.age);
        file.write_all(data.as_bytes())?;
        Ok(())
    }
}

fn main() {
    // Создание экземпляра структуры
    let user = User::new("Иван".to_string(), 30);
    
    // Генерация случайного имени файла на основе времени
    let duration = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", duration.as_nanos());
    
    // Сохранение экземпляра в файл
    match user.save_to_file(&random_filename) {
        Ok(()) => println!("Пользователь успешно сохранён в файл: {}", random_filename),
        Err(e) => eprintln!("Ошибка при сохранении в файл: {}", e),
    }
}