fn main() {
    // --- Ownership Transfer (Move Semantics) ---
    println!("--- Ownership Transfer (Move Semantics) ---");
    let s1 = String::from("hello");
    println!("Initial owner s1: '{}'", s1);

    // The ownership of the String's data is moved from s1 to s2.
    // After this line, s1 is no longer valid and Rust will prevent its use (a compile-time error).
    let s2 = s1;
    // println!("s1 after move: '{}'", s1); // This would cause a compile-time error!
    println!("Value moved to s2: '{}'", s2);
    println!("s1 is no longer valid after the move.\n");

    // --- Borrowing (Immutable Reference) ---
    println!("--- Borrowing (Immutable Reference) ---");
    let s3 = String::from("world");
    // We pass an immutable reference to s3 to the function.
    // s3 still owns the data, and its value cannot be changed through this reference.
    let len = calculate_length(&s3);
    println!("The string '{}' has a length of {}.", s3, len);
    // s3 is still valid and can be used here because it was only borrowed immutably.
    println!("s3 is still valid after borrowing: '{}'\n", s3);

    // --- Borrowing (Mutable Reference) ---
    println!("--- Borrowing (Mutable Reference) ---");
    let mut s4 = String::from("Hello");
    println!("String before mutation: '{}'", s4);
    // We pass a mutable reference to s4.
    // The function can modify the data through this reference.
    change(&mut s4);
    println!("String after mutation: '{}'\n", s4);

    // --- Borrowing Rules ---
    println!("--- Borrowing Rules ---");
    let mut s5 = String::from("Rust");
    // You can have multiple immutable references at the same time.
    let r1 = &s5;
    let r2 = &s5;
    println!("Immutable references r1: '{}', r2: '{}'", r1, r2);

    // Now, let's try a mutable reference. This is only allowed if there are no immutable references in scope.
    // The immutable references r1 and r2 are no longer used after this point, so this is allowed.
    let r3 = &mut s5;
    println!("Mutable reference r3: '{}'", r3);
    // r1 and r2 are no longer valid here if we tried to use them after r3 was created,
    // because r3 is a mutable borrow.
}

// Function that takes an immutable reference to a String.
// It does not take ownership of the data.
fn calculate_length(s: &String) -> usize {
    s.len()
} // The reference s goes out of scope here, but since it doesn't own the data,
  // nothing happens to the original String.

// Function that takes a mutable reference to a String.
// It can modify the data but does not take ownership.
fn change(some_string: &mut String) {
    some_string.push_str(", World!");
} // The mutable reference goes out of scope here, but the original String is still valid.