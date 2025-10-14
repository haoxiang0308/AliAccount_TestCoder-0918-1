// This is the Rust source code for the User struct and main function.
// It would be compiled and run if Rust were installed.
//
// struct User {
//     name: String,
//     age: u32,
// }
//
// fn main() {
//     let user = User {
//         name: String::from("Alice"),
//         age: 30,
//     };
//
//     // Сохраняем в файл с случайным именем
//     use std::fs::File;
//     use std::io::Write;
//     use std::time::{SystemTime, UNIX_EPOCH};
//
//     let now = SystemTime::now()
//         .duration_since(UNIX_EPOCH)
//         .expect("Time went backwards")
//         .as_nanos();
//     let filename = format!("user_data_{}.txt", now);
//
//     let mut file = File::create(&filename).expect("Unable to create file");
//     writeln!(file, "Name: {}", user.name).expect("Unable to write name");
//     writeln!(file, "Age: {}", user.age).expect("Unable to write age");
//
//     println!("User data saved to {}", filename);
// }