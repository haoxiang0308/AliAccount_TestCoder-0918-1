use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

struct User {
    name: String,
    age: u32,
}

fn main() {
    // Create a new user
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Generate a random filename using current time
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", since_the_epoch.as_nanos());
    
    // Format the user data as a simple string
    let user_data = format!("Name: {}, Age: {}", user.name, user.age);
    
    // Write the user data to the file
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(user_data.as_bytes()).expect("Write failed");
    
    println!("User data saved to file: {}", random_filename);
    println!("User: Name: {}, Age: {}", user.name, user.age);
}