// Define a User struct with name and age fields
#[derive(Debug, Clone)]
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
    
    // Serialize and save to a file with a random name
    use std::fs::File;
    use std::io::Write;
    use rand::Rng;
    
    // Generate a random filename
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.txt", rng.gen::<u32>());
    
    // Write user data to the file
    let mut file = File::create(&random_filename).expect("Could not create file");
    writeln!(file, "Name: {}", user.name).expect("Could not write name");
    writeln!(file, "Age: {}", user.age).expect("Could not write age");
    
    println!("User data saved to: {}", random_filename);
}

// Add required dependencies
// Note: This example uses the rand crate for generating random filenames