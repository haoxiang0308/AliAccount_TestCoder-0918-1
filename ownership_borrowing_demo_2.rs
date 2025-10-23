// Rust Ownership and Borrowing Advanced Concepts

fn main() {
    // Demonstrating slice borrowing
    let my_string = String::from("hello world");
    
    // This is a slice that borrows from the string
    let word = first_word(&my_string);
    println!("The first word is: {}", word);

    // Demonstrating string slice with string literal
    let my_string_literal = String::from("hello world");
    let word2 = first_word(&my_string_literal);
    println!("The first word from string literal is: {}", word2);

    // Demonstrating mutable borrowing with multiple scopes
    let mut s = String::from("hello");
    
    {
        let r1 = &mut s;
        r1.push_str(", world!");
        println!("Inside inner scope: {}", r1);
    } // r1 goes out of scope here, so we can create a new reference

    let r2 = &s;
    println!("Outside scope: {}", r2);

    // Demonstrating the borrowing rules: 
    // You can have multiple immutable references OR one mutable reference
    let r3 = &s; // immutable reference
    let r4 = &s; // another immutable reference
    println!("Multiple immutable references: {}, {}", r3, r4);
    // Can't create a mutable reference while immutable references exist
    // let r5 = &mut s; // This would cause a compile error!

    // But after r3 and r4 go out of scope, we can create a mutable reference
    let r5 = &mut s;
    r5.push_str(" And more!");
    println!("After mutation: {}", r5);
    
    // Demonstrating ownership transfer with return values
    let original_string = String::from("Ownership transfer demo");
    let returned_string = transfer_ownership(original_string);
    println!("Returned string: {}", returned_string);
    
    // original_string is no longer valid here because ownership was transferred
}

// Function that returns the first word as a string slice
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..] // Return the whole string if no space is found
}

// Function that transfers ownership of a string
fn transfer_ownership(s: String) -> String {
    println!("Received string: {}", s);
    // Return ownership of the string
    s
}