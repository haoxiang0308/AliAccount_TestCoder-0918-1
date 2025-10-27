use serde::{Deserialize, Serialize};
use std::fs::File;
use std::io::Write;
use rand::Rng;

#[derive(Serialize, Deserialize, Debug)]
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

    // Generate a random filename
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Serialize the user struct to JSON
    let json_data = serde_json::to_string(&user).expect("Serialization failed");
    
    // Write the JSON data to the file
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(json_data.as_bytes()).expect("Write failed");
    
    println!("User data saved to file: {}", random_filename);
    println!("User: {:?}", user);
}