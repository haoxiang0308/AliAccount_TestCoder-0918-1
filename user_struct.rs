// Определяем структуру User с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры
fn main() {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };

    // Выводим информацию о пользователе
    println!("Пользователь: {}, возраст: {}", user.name, user.age);
    
    // Сохраняем в файл
    use std::fs::File;
    use std::io::Write;
    use std::time::{SystemTime, UNIX_EPOCH};
    
    // Генерируем "случайное" имя файла на основе текущего времени
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Время пошло вспять");
    let random_filename = format!("user_data_{}.txt", since_the_epoch.as_secs());
    
    let mut file = File::create(&random_filename).expect("Не удалось создать файл");
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать в файл");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать в файл");
    
    println!("Данные пользователя сохранены в файл: {}", random_filename);
}