// Rust Ownership Demonstration

fn main() {
    println!("=== Rust Ownership Demonstration ===\n");

    // 1. Basic ownership transfer
    println!("1. Basic ownership transfer:");
    let s1 = String::from("hello");
    println!("s1 = {}", s1);
    
    let s2 = s1; // Ownership of the string data is moved from s1 to s2
    // println!("s1 = {}", s1); // This would cause a compile-time error!
    println!("s2 = {}", s2);
    println!("After move: s1 is no longer valid\n");

    // 2. Ownership with functions
    println!("2. Ownership with functions:");
    let s3 = String::from("world");
    println!("s3 before function call = {}", s3);
    
    takes_ownership(s3); // s3's value is moved into the function
    // println!("s3 after function call = {}", s3); // This would cause a compile-time error!

    let x = 5; // Integer types implement Copy trait
    println!("x before function call = {}", x);
    makes_copy(x); // x would be copied (not moved) into the function
    println!("x after function call = {}", x); // This is valid because x was copied
    println!();

    // 3. Functions returning values and ownership
    println!("3. Functions returning values and ownership:");
    let s4 = gives_ownership(); // Function gives ownership to s4
    println!("s4 = {}", s4);

    let s5 = String::from("rust");
    println!("s5 before function = {}", s5);
    let s6 = takes_and_gives_back(s5); // s5 is moved to function, s6 receives ownership
    println!("s6 after function = {}", s6);
    // s5 is no longer valid here
    println!();

    // 4. References and borrowing
    println!("4. References and borrowing:");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // Pass a reference to avoid taking ownership
    println!("The length of '{}' is {}.", s7, len); // s7 is still valid here
    println!();

    // 5. Mutable references
    println!("5. Mutable references:");
    let mut s8 = String::from("hello");
    println!("s8 before mutation = {}", s8);
    change(&mut s8); // Pass a mutable reference
    println!("s8 after mutation = {}", s8);
    println!();

    // 6. Multiple references rules
    println!("6. Multiple references rules:");
    let mut s9 = String::from("hello");
    
    {
        let r1 = &mut s9; // Mutable reference
        println!("r1 = {}", r1);
    } // r1 goes out of scope here, so we can create a new reference

    let r2 = &s9; // Immutable reference
    let r3 = &s9; // Another immutable reference
    println!("r2 = {}, r3 = {}", r2, r3);
    // println!("s9 = {}", s9); // We can still access s9 through the immutable references
    println!();
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (for types that implement Copy trait)
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but since i32 implements Copy, nothing special happens
}

// Function that gives ownership to the caller
fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string // Return ownership to the caller
}

// Function that takes and returns ownership
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership to the caller
}

// Function that takes a reference (borrowing)
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
    // The reference goes out of scope, but the data it points to is not dropped
}

// Function that takes a mutable reference
fn change(some_string: &mut String) {
    some_string.push_str(", world"); // Modify the string through the mutable reference
}