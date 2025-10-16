// Rust Ownership Demo
// This program demonstrates the core concepts of ownership in Rust

fn main() {
    // 1. Ownership basics
    println!("=== Ownership Basics ===");
    {
        let s = String::from("hello"); // s comes into scope
        println!("Value of s: {}", s); // use of s
        // s goes out of scope here and is dropped
    }
    // s is no longer valid here

    // 2. Moving ownership
    println!("\n=== Moving Ownership ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1's value is moved to s2, s1 is no longer valid
    // println!("{}", s1); // This would cause a compile error!
    println!("Value of s2: {}", s2);

    // 3. Cloning to avoid move
    println!("\n=== Cloning to Avoid Move ===");
    let s3 = String::from("world");
    let s4 = s3.clone(); // Deep copy is made
    println!("Value of s3: {}", s3); // Now both s3 and s4 are valid
    println!("Value of s4: {}", s4);

    // 4. Function ownership transfer
    println!("\n=== Function Ownership Transfer ===");
    let s5 = String::from("hello");
    let len = calculate_length(s5); // s5 is moved into function
    // println!("{}", s5); // This would cause a compile error!
    println!("Length is: {}", len);

    // 5. References to avoid ownership transfer
    println!("\n=== Using References ===");
    let s6 = String::from("rust");
    let len2 = calculate_length_ref(&s6); // s6 is borrowed
    println!("String: {}, Length: {}", s6, len2); // s6 is still valid

    // 6. Mutable references
    println!("\n=== Mutable References ===");
    let mut s7 = String::from("hello");
    println!("Before modification: {}", s7);
    change_string(&mut s7); // Pass mutable reference
    println!("After modification: {}", s7);

    // 7. Demonstrating borrowing rules
    println!("\n=== Borrowing Rules ===");
    borrowing_rules_demo();
}

// Function that takes ownership of a String
fn calculate_length(s: String) -> usize {
    s.len() // s is returned but ownership is transferred
}

// Function that takes a reference to avoid taking ownership
fn calculate_length_ref(s: &String) -> usize {
    s.len() // s is a reference, no ownership is transferred
}

// Function that modifies a string through a mutable reference
fn change_string(s: &mut String) {
    s.push_str(", world!"); // Append to the string
}

// Demonstrates borrowing rules: cannot have multiple mutable references
fn borrowing_rules_demo() {
    let mut s = String::from("hello");
    
    // This is valid - one mutable reference
    let r1 = &mut s;
    println!("Mutable reference value: {}", r1);
    // Note: we can't create another mutable reference while r1 is still in scope
    // let r2 = &mut s; // This would cause a compile error
    
    // We can have multiple immutable references
    let r3 = &s; // immutable reference
    let r4 = &s; // another immutable reference
    println!("Immutable references: {}, {}", r3, r4);
    
    // But we can't have both mutable and immutable references at the same time
    // let r5 = &mut s; // This would cause a compile error
}