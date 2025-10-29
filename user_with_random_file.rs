use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};
use rand::Rng;

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Create a new user
    let user = User {
        name: String::from("John Doe"),
        age: 25,
    };

    // Generate a random filename using a combination of time and random number
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let mut rng = rand::thread_rng();
    let random_num = rng.gen::<u32>();
    let random_filename = format!("user_data_{}_{}.txt", since_the_epoch.as_nanos(), random_num);
    
    // Format the user data as a simple string
    let user_data = format!("Name: {}, Age: {}", user.name, user.age);
    
    // Write the user data to the file
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(user_data.as_bytes()).expect("Write failed");
    
    println!("User data saved to file: {}", random_filename);
    println!("User: Name: {}, Age: {}", user.name, user.age);
}