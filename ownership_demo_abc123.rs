fn main() {
    // --- Ownership Transfer (Move Semantics) ---
    println!("--- Ownership Transfer ---");
    let s1 = String::from("hello"); // s1 owns the string data
    println!("s1: {}", s1); // This is fine, s1 is valid here.

    let s2 = s1; // The ownership of the string data is moved from s1 to s2.
                 // s1 is no longer valid after this point.

    // println!("s1: {}", s1); // This would cause a compile-time error!
    println!("s2: {}", s2); // s2 is now the owner.

    // --- Borrowing ---
    println!("\n--- Borrowing ---");
    let s3 = String::from("world");
    let len = calculate_length(&s3); // Pass a reference (&s3) instead of the value itself.
    println!("The length of '{}' is {}.", s3, len); // s3 is still valid here because we only borrowed it.

    // --- Mutable Borrowing ---
    println!("\n--- Mutable Borrowing ---");
    let mut s4 = String::from("Hi");
    println!("Before change: {}", s4);
    change(&mut s4); // Pass a mutable reference.
    println!("After change: {}", s4);

    // --- Slices ---
    println!("\n--- Slices ---");
    let my_string = String::from("Hello, world!");
    let word = first_word(&my_string); // Pass a string slice.
    println!("The first word in '{}' is '{}'", my_string, word);
}

// Function that takes a reference to a String (a borrow).
// It does not take ownership, so the original variable remains valid.
fn calculate_length(s: &String) -> usize {
    s.len() // We can use methods on the reference just like the original value.
}

// Function that takes a mutable reference to a String.
// It can modify the data it points to.
fn change(some_string: &mut String) {
    some_string.push_str(", Rust!"); // Appends to the original string.
}

// Function that returns a string slice.
// Slices are references to a portion of a collection.
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i]; // Return a slice from index 0 up to (but not including) i.
        }
    }

    &s[..] // Return a slice of the whole string if no space is found.
}