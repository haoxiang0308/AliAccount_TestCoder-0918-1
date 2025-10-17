// Rust Ownership Demo
// This program demonstrates the core concepts of ownership in Rust:
// 1. Each value has a single owner
// 2. When the owner goes out of scope, the value is dropped
// 3. There can only be one owner at a time

fn main() {
    println!("=== Rust Ownership Demo ===\n");

    // Example 1: Basic ownership
    println!("1. Basic Ownership:");
    let s1 = String::from("Hello");
    println!("s1 = {}", s1);

    // Moving ownership from s1 to s2
    let s2 = s1;  // s1 is moved to s2, s1 is no longer valid
    println!("s2 = {}", s2);
    // println!("s1 = {}", s1);  // This would cause a compile error!
    println!("s1 is no longer valid after move\n");

    // Example 2: Ownership with functions
    println!("2. Ownership with Functions:");
    let s3 = String::from("World");
    println!("Before function call - s3 = {}", s3);
    
    take_ownership(s3);  // s3's ownership is moved to the function
    // println!("s3 = {}", s3);  // This would cause a compile error!
    println!("s3 is no longer valid after function call\n");

    // Example 3: Copying vs Moving
    println!("3. Copy vs Move:");
    let x = 5;  // i32 implements Copy trait
    let y = x;  // x is copied to y
    println!("x = {}, y = {} (both are valid because of Copy)", x, y);

    let s4 = String::from("Rust");  // String does not implement Copy
    let s5 = s4;  // s4 is moved to s5
    println!("s5 = {}", s5);
    // println!("s4 = {}", s4);  // This would cause a compile error!
    println!("s4 was moved to s5\n");

    // Example 4: Returning ownership
    println!("4. Returning Ownership:");
    let s6 = String::from("Ownership");
    println!("Before function - s6 = {}", s6);
    let s7 = return_ownership(s6);  // Ownership is returned
    println!("After function - s7 = {}", s7);
    // println!("s6 = {}", s6);  // s6 is no longer valid
    println!("Ownership was transferred from s6 to s7 through the function\n");

    // Example 5: Borrowing (references)
    println!("5. Borrowing (References):");
    let s8 = String::from("Borrowing");
    println!("s8 = {}", s8);
    let len = calculate_length(&s8);  // Borrow s8 without taking ownership
    println!("The length of '{}' is {}.", s8, len);  // s8 is still valid
    println!("s8 is still valid because we only borrowed it\n");

    // Example 6: Mutable borrowing
    println!("6. Mutable Borrowing:");
    let mut s9 = String::from("Hello");
    println!("Before mutation - s9 = {}", s9);
    change_string(&mut s9);  // Mutably borrow s9
    println!("After mutation - s9 = {}", s9);
    println!("s9 was modified through mutable reference\n");
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("The function took ownership of: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that returns ownership of a String
fn return_ownership(some_string: String) -> String {
    println!("The function received: {}", some_string);
    // Return ownership back to the caller
    some_string
}

// Function that borrows a string (takes a reference)
fn calculate_length(s: &String) -> usize {
    s.len()  // Return the length without taking ownership
}

// Function that mutably borrows a string
fn change_string(s: &mut String) {
    s.push_str(", World!");  // Modify the string through the mutable reference
}