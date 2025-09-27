use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> std::io::Result<()> {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    // Генерация случайного имени файла
    let random_filename = format!("user_data_{}.ron", rand::random::<u32>());
    let mut file = File::create(&random_filename)?;
    let ron_data = ron::ser::to_string_pretty(&user, ron::ser::PrettyConfig::default()).unwrap();
    file.write_all(ron_data.as_bytes())?;
    println!("User data saved to {}", random_filename);

    Ok(())
}