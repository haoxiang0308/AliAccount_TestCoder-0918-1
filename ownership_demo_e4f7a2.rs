// Rust Ownership Demonstration

fn main() {
    // 1. Ownership basics
    println!("--- Ownership Basics ---");
    let s1 = String::from("hello");
    let s2 = s1; // `s1` is moved to `s2`, `s1` is no longer valid
    // println!("{}", s1); // This would cause a compile-time error!
    println!("s2 is: {}", s2);

    // 2. Functions and ownership
    println!("\n--- Functions and Ownership ---");
    let s3 = String::from("world");
    takes_ownership(s3); // `s3` is moved into the function
    // println!("{}", s3); // This would cause a compile-time error!

    let x = 5;
    makes_copy(x); // `x` is copied (i32 implements Copy trait), so it's still valid
    println!("x is still valid after function call: {}", x);

    // 3. Returning values and scope
    println!("\n--- Returning Values ---");
    let s4 = gives_ownership(); // Function gives ownership to `s4`
    println!("s4 received ownership: {}", s4);

    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5); // `s5` is moved in and `s6` receives the return
    println!("s6 received ownership: {}", s6);
    // `s5` is no longer valid here
}

fn takes_ownership(some_string: String) { // `some_string` comes into scope
    println!("Took ownership and will print: {}", some_string);
} // `some_string` goes out of scope and `drop` is called. Memory is freed.

fn makes_copy(some_integer: i32) { // `some_integer` comes into scope
    println!("Made a copy (or passed by value) and will print: {}", some_integer);
} // `some_integer` goes out of scope. Nothing special happens.

fn gives_ownership() -> String {             // Function gives ownership to the caller
    let some_string = String::from("yours"); // `some_string` comes into scope
    some_string                              // `some_string` is returned and ownership is transferred to the caller
}

fn takes_and_gives_back(a_string: String) -> String { // Takes ownership, returns it
    println!("Inside function, got: {}", a_string);
    a_string  // `a_string` is returned, ownership is transferred back to the caller
}