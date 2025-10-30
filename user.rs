// Структура для представления пользователя
#[derive(Debug, Clone)]
pub struct User {
    pub name: String,
    pub age: u32,
}

fn main() {
    // Пример создания экземпляра структуры
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Создан пользователь: {:?}", user);
    
    // Сохранение в файл
    use std::fs::File;
    use std::io::Write;
    
    // Создаем файл со случайным именем (используем текущее время в наносекундах как "случайное" значение)
    use std::time::{SystemTime, UNIX_EPOCH};
    let start = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Время дошло до эпохи UNIX");
    let random_filename = format!("user_data_{}.txt", start.as_nanos());
    let mut file = File::create(&random_filename).expect("Не удалось создать файл");
    
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать в файл");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать в файл");
    
    println!("Данные пользователя сохранены в файл: {}", random_filename);
}