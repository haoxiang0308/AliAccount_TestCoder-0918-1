use serde::{Serialize, Deserialize};
use std::fs;
use std::io::Write;
use rand::Rng;

// Define a User struct with name and age fields
#[derive(Debug, Clone, Serialize, Deserialize)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Create a sample user
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };
    
    // Print the user for verification
    println!("Created user: {:?}", user);
    
    // Serialize user data to JSON
    let user_json = serde_json::to_string_pretty(&user).expect("Could not serialize user");
    
    // Generate a random filename
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Write user data to the file
    fs::write(&random_filename, user_json).expect("Could not write to file");
    
    println!("User data saved to: {}", random_filename);
}