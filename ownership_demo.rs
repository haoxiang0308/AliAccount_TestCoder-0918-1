// Rust Ownership Demonstration

fn main() {
    // Example 1: Basic ownership transfer
    println!("=== Example 1: Basic Ownership Transfer ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1 is moved to s2, s1 is no longer valid
    
    // The following line would cause a compile-time error:
    // println!("{}", s1);  // Error: value borrowed here after move
    
    println!("s2: {}", s2);  // Only s2 is valid now
    
    // Example 2: Ownership with functions
    println!("\n=== Example 2: Ownership with Functions ===");
    let s3 = String::from("world");
    take_ownership(s3);  // s3 is moved into the function
    // println!("{}", s3);  // This would cause an error: s3 is no longer valid
    
    let x = 5;  // Integer types implement Copy trait
    make_copy(x);  // x is copied, not moved
    println!("x is still valid after function call: {}", x);  // This works fine
    
    // Example 3: Returning ownership
    println!("\n=== Example 3: Returning Ownership ===");
    let s4 = String::from("hello");
    let (s5, len) = calculate_length(s4);  // s4 is moved to s5
    println!("The length of '{}' is {}.", s5, len);
    
    // Example 4: References (borrowing)
    println!("\n=== Example 4: References (Borrowing) ===");
    let s6 = String::from("rust");
    let len_ref = calculate_length_ref(&s6);  // s6 is borrowed
    println!("The length of '{}' is {}.", s6, len_ref);  // s6 is still valid
    
    // Example 5: Mutable references
    println!("\n=== Example 5: Mutable References ===");
    let mut s7 = String::from("hello");
    println!("Before modification: {}", s7);
    change_string(&mut s7);  // Pass mutable reference
    println!("After modification: {}", s7);
    
    // Example 6: Multiple immutable references or one mutable reference
    println!("\n=== Example 6: Reference Restrictions ===");
    let mut s8 = String::from("hello");
    
    // Multiple immutable references are allowed
    let r1 = &s8;
    let r2 = &s8;
    println!("r1: {}, r2: {}", r1, r2);
    
    // Now we can create a mutable reference (after immutable references are done)
    let r3 = &mut s8;
    println!("r3: {}", r3);
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("This function took ownership of: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (for types that implement Copy trait)
fn make_copy(some_integer: i32) {
    println!("This function received a copy of integer: {}", some_integer);
    // some_integer goes out of scope here, but since i32 implements Copy, nothing special happens
}

// Function that takes ownership and returns it
fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String
    (s, length)  // Return both the String and its length
}

// Function that uses a reference (borrowing)
fn calculate_length_ref(s: &String) -> usize {  // s is a reference to a String
    s.len()  // We can use s just like a String
}  // s goes out of scope, but since it doesn't own the value, nothing happens

// Function that modifies a string through a mutable reference
fn change_string(some_string: &mut String) {
    some_string.push_str(", world!");  // Append to the string
}