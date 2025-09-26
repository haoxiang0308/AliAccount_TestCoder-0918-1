fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Rule 1: Each value has an owner ---");
    let s1 = String::from("hello"); // 's1' is the owner of the String value
    println!("s1: {}", s1);

    println!("\n--- Rule 2: Only one owner at a time (Move Semantics) ---");
    let s2 = s1; // The value "hello" is moved from s1 to s2. s1 is no longer valid.
    // println!("{}", s1); // This line would cause a compile-time error!
    println!("s2: {}", s2);
    println!("s1 is no longer valid after the move.");

    println!("\n--- Rule 3: Value is dropped when owner goes out of scope ---");
    {
        let s3 = String::from("temporary");
        println!("Inside scope, s3: {}", s3);
        // 's3' goes out of scope here, and the value is automatically dropped.
    } // End of scope
    // println!("{}", s3); // This line would cause a compile-time error!

    println!("s3 is dropped when it goes out of scope.");

    println!("\n--- Borrowing to avoid taking ownership ---");
    let s4 = String::from("world");
    let len = calculate_length(&s4); // Pass a reference to s4, not the value itself
    println!("The length of '{}' is {}.", s4, len); // s4 is still valid here

    println!("\n--- Mutable Borrowing ---");
    let mut s5 = String::from("hi");
    println!("Before modification: {}", s5);
    change_string(&mut s5); // Pass a mutable reference
    println!("After modification: {}", s5);
}

// Function that takes a reference to a String, not the String itself.
// This is called "borrowing". It does not take ownership.
fn calculate_length(s: &String) -> usize {
    s.len()
} // 's' goes out of scope here, but since it does not own the underlying value,
  // nothing happens to the original string.

// Function that takes a mutable reference to modify the value.
fn change_string(s: &mut String) {
    s.push_str(", Rust!");
} // 's' goes out of scope here, but the original value is modified.