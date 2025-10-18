// Rust Ownership Concepts Demonstration

fn main() {
    println!("=== Rust Ownership Concepts ===\n");

    // 1. Basic ownership transfer
    println!("1. Basic ownership:");
    let original_string = String::from("Hello, Rust!");
    println!("Created original_string: {}", original_string);
    
    let transferred_string = original_string; // Ownership moves here
    // println!("original_string: {}", original_string); // This would cause a compile error!
    println!("Ownership transferred to: {}", transferred_string);
    println!();

    // 2. Ownership with functions
    println!("2. Ownership with functions:");
    let my_string = String::from("Owned string");
    println!("Before function call: my_string created");
    takes_ownership(my_string); // Ownership moves to the function
    // println!("After function call: {}", my_string); // This would cause a compile error!
    println!();

    // 3. Functions that return ownership
    println!("3. Functions returning ownership:");
    let returned_string = gives_ownership();
    println!("Function returned ownership of: {}", returned_string);
    println!();

    // 4. References (borrowing)
    println!("4. References (borrowing):");
    let length = calculate_length(&returned_string); // Borrowing, not taking ownership
    println!("The length of '{}' is {} characters", returned_string, length);
    println!("returned_string is still valid: {}", returned_string);
    println!();

    // 5. Mutable references
    println!("5. Mutable references:");
    let mut mutable_string = String::from("Hello");
    println!("Before mutation: {}", mutable_string);
    add_world(&mut mutable_string); // Mutable borrow
    println!("After mutation: {}", mutable_string);
    println!();

    // 6. Multiple immutable references vs mutable reference
    println!("6. Borrowing rules:");
    let mut s = String::from("rules");
    
    // Multiple immutable references are allowed
    let r1 = &s;
    let r2 = &s;
    println!("Immutable references r1: {}, r2: {}", r1, r2);
    
    // Now we can create a mutable reference, but only after r1 and r2 go out of scope
    {
        let r3 = &mut s;
        r3.push_str(" applied");
        println!("Mutable reference r3: {}", r3);
    }
    
    println!("After mutable reference scope: {}", s);
    println!();
    
    // 7. Demonstrating scope and drop
    println!("7. Scope and automatic cleanup:");
    {
        let inner_string = String::from("I exist only in this scope");
        println!("Inside scope: {}", inner_string);
    } // inner_string goes out of scope and is automatically dropped
    println!("Outside scope - inner_string no longer exists");
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received ownership of: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that returns ownership of a String
fn gives_ownership() -> String {
    let some_string = String::from("String from function");
    some_string // Return ownership to the caller
}

// Function that borrows (references) a String and returns its length
fn calculate_length(s: &String) -> usize {
    s.len() // No ownership is transferred, just reading
} // Reference goes out of scope, no effect on the original string

// Function that mutably borrows a String to modify it
fn add_world(s: &mut String) {
    s.push_str(", World!"); // Modifying through mutable reference
} // Mutable reference goes out of scope