// Rust Ownership Concept Demonstration

fn main() {
    // 1. Basic ownership: when a variable goes out of scope, its value is dropped
    {
        let s = String::from("hello"); // s is valid from this point forward
        println!("Value of s: {}", s);
        // s goes out of scope here and is dropped automatically
    } // s is no longer valid here

    // 2. Move semantics: transferring ownership
    let s1 = String::from("hello");
    let s2 = s1; // s1's ownership is moved to s2
    // println!("{}", s1); // This would cause a compile error! s1 is no longer valid
    
    println!("Value of s2: {}", s2);

    // 3. Cloning to create a new independent copy
    let s3 = String::from("world");
    let s4 = s3.clone(); // Creates a deep copy of the data
    
    println!("s3: {}, s4: {}", s3, s4); // Both are valid now

    // 4. Ownership and functions
    let s5 = String::from("hello");
    takes_ownership(s5); // s5's value moves into the function and is no longer valid here
    
    let x = 5;
    makes_copy(x); // x would move into the function, but i32 implements Copy, so it's copied instead
    println!("x is still valid after function call: {}", x);

    // 5. Functions returning values and ownership
    let s6 = gives_ownership(); // Function returns ownership to s6
    let s7 = String::from("world");
    let s8 = takes_and_gives_back(s7); // Function takes ownership of s7 and returns it to s8
    println!("s6: {}, s8: {}", s6, s8);

    // 6. References and borrowing
    let s9 = String::from("hello");
    let len = calculate_length(&s9); // &s9 creates a reference to s9 without taking ownership
    println!("The length of '{}' is {}.", s9, len); // s9 is still valid here

    // 7. Mutable references
    let mut s10 = String::from("hello");
    change(&mut s10); // Pass a mutable reference
    println!("After mutation: {}", s10);

    // 8. Multiple immutable references OR one mutable reference (but not both)
    let r1 = &s10; // no problem
    let r2 = &s10; // no problem
    println!("{} and {}", r1, r2);
    // r1 and r2 are no longer used after this point

    let r3 = &mut s10; // no problem - we're done with r1 and r2
    println!("Mutable reference: {}", r3);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and the memory is freed
}

// Function that works with a copy (i32 implements Copy trait)
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but nothing happens since i32 implements Copy
}

// Function that gives ownership to the caller
fn gives_ownership() -> String {
    let some_string = String::from("hello");
    some_string // Return ownership of the string
}

// Function that takes and returns ownership
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership of the received string
}

// Function that calculates length using a reference (borrowing)
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope, but since it doesn't own the value, nothing happens

// Function that modifies a string through a mutable reference
fn change(some_string: &mut String) {
    some_string.push_str(", world");
} // The mutable reference goes out of scope here